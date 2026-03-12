#!/bin/sh
# Deploy versioned Doxygen docs for a submodule into the scl-kit pages branch.
#
# Usage: deploy_module_docs.sh <module> <pages_branch> [dryrun]
#   module       — submodule name (utility | feature)
#   pages_branch — target branch for pages (gh-pages | pages)
#   dryrun       — skip push, keep output dir, print its path
#
# Each version's Doxygen HTML gets a navigation bar injected (post-processing)
# with a version selector that links to all other versions of the same module.

set -e

MODULE="$1"
PAGES_BRANCH="${2:-gh-pages}"
DRY_RUN="${3:-}"
SUBMODULE_DIR="module/${MODULE}"
DOXYFILE="${SUBMODULE_DIR}/project/doxygen/Doxyfile"

if [ -z "$MODULE" ]; then
  echo "Usage: $0 <module> <pages_branch> [dryrun]" >&2
  exit 1
fi

# On Windows, doxygen is a native binary and needs Windows-style paths.
# cygpath -w converts /tmp/... → C:\...; on Linux it's a no-op passthrough.
native_path() {
  if command -v cygpath >/dev/null 2>&1; then cygpath -w "$1"; else echo "$1"; fi
}

BUILD_DIR=$(mktemp -d)
PAGES_WORK=$(mktemp -d)

cleanup() {
  rm -rf "${BUILD_DIR}"
  if [ -z "${DRY_RUN}" ]; then
    rm -rf "${PAGES_WORK}"
  fi
  git submodule update -- "${SUBMODULE_DIR}"
}
trap cleanup EXIT

echo "=== Module: ${MODULE}, branch: ${PAGES_BRANCH} ==="

# ── Check out the pages branch ───────────────────────────────────────────────
REMOTE_URL=$(git remote get-url origin)
git fetch origin "${PAGES_BRANCH}" 2>/dev/null || true
if git rev-parse --verify "origin/${PAGES_BRANCH}" >/dev/null 2>&1; then
  git clone --branch "${PAGES_BRANCH}" --single-branch "${REMOTE_URL}" "${PAGES_WORK}"
fi
mkdir -p "${PAGES_WORK}/${MODULE}"

# ── Read existing deployed versions ──────────────────────────────────────────
VERSIONS_FILE="${PAGES_WORK}/${MODULE}/versions.json"
if [ -f "${VERSIONS_FILE}" ]; then
  EXISTING=$(python - "${VERSIONS_FILE}" << 'EOF'
import json, sys
data = json.load(open(sys.argv[1]))
for v in data: print(v['version'])
EOF
)
else
  EXISTING=""
fi

# ── Collect tags and detect dev branch ───────────────────────────────────────
TAGS=$(git -C "${SUBMODULE_DIR}" tag -l 'v[0-9]*' 2>/dev/null | sort -V || true)

DEV_REF=""
if git -C "${SUBMODULE_DIR}" rev-parse --verify dev >/dev/null 2>&1; then
  DEV_REF="dev"
elif git -C "${SUBMODULE_DIR}" rev-parse --verify "origin/dev" >/dev/null 2>&1; then
  DEV_REF="origin/dev"
fi

echo "    Tags    : $(echo "$TAGS" | tr '\n' ' ')"
echo "    Existing: $(echo "$EXISTING" | tr '\n' ' ')"

# ── Pre-compute full versions list for the nav bar ────────────────────────────
# Order: dev (latest), tags newest-first
VERSIONS_JSON=$(python - "${TAGS}" "${DEV_REF}" << 'EOF'
import sys
tags_raw, dev_ref = sys.argv[1], sys.argv[2]
tags = [t for t in tags_raw.split('\n') if t.strip()]
items = []
if dev_ref:
    items.append('{"v":"dev","label":"dev (latest)"}')
for t in reversed(tags):
    items.append('{"v":"%s","label":"%s"}' % (t, t))
print('[' + ','.join(items) + ']')
EOF
)

# ── Helper: run Doxygen + inject nav bar ──────────────────────────────────────
build_version() {
  VERSION="$1"
  OUT_DIR="${PAGES_WORK}/${MODULE}/${VERSION}"

  rm -rf "${OUT_DIR}"
  mkdir -p "${OUT_DIR}"

  if [ ! -f "${SUBMODULE_DIR}/project/doxygen/Doxyfile" ]; then
    echo "    [warn] no Doxyfile for ${MODULE}@${VERSION}, skipping"
    return
  fi

  (cd "${SUBMODULE_DIR}" && \
   { cat "project/doxygen/Doxyfile"; \
     printf '\nGENERATE_HTML=YES\nGENERATE_XML=NO\nHTML_OUTPUT=.\nOUTPUT_DIRECTORY=%s\n' \
       "$(native_path "${OUT_DIR}")"; \
   } | doxygen -)

  # Inject navigation bar into every HTML file
  python - "${OUT_DIR}" "${MODULE}" "${VERSION}" "${VERSIONS_JSON}" << 'EOF'
import os, sys

out_dir, module, version, versions_json = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4]

nav = (
    '<div id="scl-nav" style="background:#1565c0;color:#fff;padding:8px 16px;'
    'font-family:sans-serif;display:flex;align-items:center;gap:12px;font-size:14px">'
    '<a href="../../" style="color:#fff;font-weight:bold;text-decoration:none">SCL Toolkit</a>'
    '<span style="opacity:.5">/</span>'
    '<span>SCL ' + module.capitalize() + '</span>'
    '<span style="opacity:.5">/</span>'
    '<select id="scl-ver" style="background:#0d47a1;color:#fff;'
    'border:1px solid rgba(255,255,255,.4);padding:3px 8px;cursor:pointer;font-size:13px">'
    '</select></div>\n'
    '<script>(function(){'
    'var V=' + versions_json + ';'
    'var cur="' + version + '";'
    'var s=document.getElementById("scl-ver");'
    'V.forEach(function(v){'
    'var o=document.createElement("option");'
    'o.value=v.v;o.text=v.label;'
    'if(v.v===cur)o.selected=true;'
    's.appendChild(o);});'
    's.onchange=function(){window.location="../"+s.value+"/";};'
    '})();</script>\n'
)

for root, dirs, files in os.walk(out_dir):
    for fname in files:
        if not fname.endswith('.html'):
            continue
        path = os.path.join(root, fname)
        try:
            content = open(path, encoding='utf-8', errors='ignore').read()
            idx = content.find('<body')
            if idx < 0:
                continue
            idx = content.find('>', idx) + 1
            open(path, 'w', encoding='utf-8').write(content[:idx] + nav + content[idx:])
        except Exception:
            pass
EOF
}

# ── Update versions.json ──────────────────────────────────────────────────────
update_versions() {
  VERSION="$1"
  ALIAS="$2"
  python - "${VERSIONS_FILE}" "${VERSION}" "${ALIAS}" << 'EOF'
import json, sys
f, ver, alias = sys.argv[1], sys.argv[2], sys.argv[3]
try:
    data = json.load(open(f))
except (FileNotFoundError, ValueError):
    data = []
data = [v for v in data if v['version'] != ver]
if alias:
    for v in data:
        if alias in v.get('aliases', []):
            v['aliases'].remove(alias)
entry = {'version': ver, 'title': ver, 'aliases': [alias] if alias else []}
if alias == 'latest':
    data.insert(0, entry)
elif ver == 'dev':
    data.append(entry)
else:
    idx = next((i for i, v in enumerate(data) if v['version'] == 'dev'), len(data))
    data.insert(idx, entry)
with open(f, 'w') as fp:
    json.dump(data, fp, indent=2)
EOF
}

# ── Update top-level index.html (version listing + redirect to main) ──────────
update_index() {
  python - "${VERSIONS_FILE}" "${PAGES_WORK}/${MODULE}/index.html" "${MODULE}" << 'EOF'
import json, sys
vf, idx_file, module = sys.argv[1], sys.argv[2], sys.argv[3]
try:
    data = json.load(open(vf))
except (FileNotFoundError, ValueError):
    data = []
items = ''
for v in data:
    alias = ' <em>(%s)</em>' % ', '.join(v['aliases']) if v.get('aliases') else ''
    items += '<li><a href="%s/">%s</a>%s</li>\n' % (v['version'], v['title'], alias)
html = '''<!DOCTYPE html>
<html><head><meta charset="utf-8">
<meta http-equiv="refresh" content="0; url=main/">
<title>SCL {m} — Versions</title>
<style>body{{font-family:sans-serif;max-width:600px;margin:2em auto}}</style>
</head><body>
<h1>SCL {m}</h1><ul>{items}</ul>
</body></html>'''.format(m=module.capitalize(), items=items)
open(idx_file, 'w').write(html)
EOF
}

# ── Build version tags (skip already deployed) ────────────────────────────────
for TAG in $TAGS; do
  if echo "${EXISTING}" | grep -qxF "${TAG}"; then
    echo "  [skip] ${TAG}"
    continue
  fi
  echo "  [build] ${TAG}"
  git -C "${SUBMODULE_DIR}" checkout "${TAG}"
  build_version "${TAG}"
  update_versions "${TAG}" ""
done

# ── Build dev (if exists) ─────────────────────────────────────────────────────
if [ -n "$DEV_REF" ]; then
  echo "  [build] dev -> latest"
  git -C "${SUBMODULE_DIR}" checkout "${DEV_REF}"
  build_version "dev"
  update_versions "dev" "latest"
fi

update_index

# ── Commit and push ───────────────────────────────────────────────────────────
if [ -n "${DRY_RUN}" ]; then
  echo "  [dryrun] output dir: ${PAGES_WORK}/${MODULE}"
else
  git -C "${PAGES_WORK}" config user.email "$(git config user.email)"
  git -C "${PAGES_WORK}" config user.name "$(git config user.name)"
  git -C "${PAGES_WORK}" remote set-url origin "${REMOTE_URL}"
  git -C "${PAGES_WORK}" add -A
  if git -C "${PAGES_WORK}" diff --cached --quiet; then
    echo "  [no changes] nothing to push"
  else
    git -C "${PAGES_WORK}" commit -m "docs(${MODULE}): deploy versioned docs"
    git -C "${PAGES_WORK}" push origin "${PAGES_BRANCH}"
  fi
fi

echo "=== Done: ${MODULE} ==="
