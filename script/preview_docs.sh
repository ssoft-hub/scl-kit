#!/bin/sh
# Build a local preview of the complete scl-kit docs site.
#
# Usage: sh script/preview_docs.sh [output_dir]
#   output_dir — defaults to preview-site/
#
# Structure:
#   <out>/            — scl-kit main site (mkdocs)
#   <out>/utility/    — versioned Doxygen docs for all utility tags + main + dev
#   <out>/feature/    — versioned Doxygen docs for all feature tags + main + dev
#
# Serves on http://localhost:8080/ when done.

set -e

OUT="${1:-preview-site}"
rm -rf "${OUT}"
mkdir -p "${OUT}"
OUT=$(cd "${OUT}" && pwd)  # make absolute so paths survive cd into submodule

# On Windows, doxygen is a native binary and needs Windows-style paths.
native_path() {
  if command -v cygpath >/dev/null 2>&1; then cygpath -w "$1"; else echo "$1"; fi
}

# ── scl-kit main site (mkdocs) ────────────────────────────────────────────────
echo "=== scl-kit main ==="
mkdocs build --site-dir "${OUT}"
rm -rf .cache

# ── Helper: update versions.json ─────────────────────────────────────────────
update_versions() {
  JSON_FILE="$1"; VERSION="$2"; ALIAS="$3"
  python - "${JSON_FILE}" "${VERSION}" "${ALIAS}" << 'EOF'
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

# ── Helper: generate version index.html ──────────────────────────────────────
update_index() {
  JSON_FILE="$1"; INDEX_FILE="$2"; MODULE="$3"
  python - "${JSON_FILE}" "${INDEX_FILE}" "${MODULE}" << 'EOF'
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
<title>SCL {m} - Versions</title>
<style>body{{font-family:sans-serif;max-width:600px;margin:2em auto}}</style>
</head><body>
<h1>SCL {m}</h1><ul>{items}</ul>
</body></html>'''.format(m=module.capitalize(), items=items)
open(idx_file, 'w').write(html)
EOF
}

# ── Helper: build Doxygen + inject nav bar for one module version ─────────────
build_version() {
  MODULE="$1"; VERSION="$2"; SUBMODULE_DIR="$3"; OUT_DIR="$4"; VERSIONS_JSON="$5"

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

# ── Build all versions for a module ──────────────────────────────────────────
build_module() {
  MODULE="$1"
  SUBMODULE_DIR="module/${MODULE}"
  VERSIONS_FILE="${OUT}/${MODULE}/versions.json"

  TAGS=$(git -C "${SUBMODULE_DIR}" tag -l 'v[0-9]*' 2>/dev/null | sort -V || true)

  DEV_REF=""
  if git -C "${SUBMODULE_DIR}" rev-parse --verify dev >/dev/null 2>&1; then
    DEV_REF="dev"
  elif git -C "${SUBMODULE_DIR}" rev-parse --verify "origin/dev" >/dev/null 2>&1; then
    DEV_REF="origin/dev"
  fi

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

  echo ""
  echo "=== ${MODULE} ==="
  mkdir -p "${OUT}/${MODULE}"

  for TAG in $TAGS; do
    echo "  [build] ${TAG}"
    git -C "${SUBMODULE_DIR}" checkout "${TAG}"
    build_version "${MODULE}" "${TAG}" "${SUBMODULE_DIR}" "${OUT}/${MODULE}/${TAG}" "${VERSIONS_JSON}"
    update_versions "${VERSIONS_FILE}" "${TAG}" ""
  done

  echo "  [build] main"
  git -C "${SUBMODULE_DIR}" checkout main 2>/dev/null \
    || git -C "${SUBMODULE_DIR}" checkout "origin/main"
  if [ -n "$DEV_REF" ]; then
    echo "  [build] dev -> latest"
    git -C "${SUBMODULE_DIR}" checkout "${DEV_REF}"
    build_version "${MODULE}" "dev" "${SUBMODULE_DIR}" "${OUT}/${MODULE}/dev" "${VERSIONS_JSON}"
    update_versions "${VERSIONS_FILE}" "dev" "latest"
  fi

  update_index "${VERSIONS_FILE}" "${OUT}/${MODULE}/index.html" "${MODULE}"
  git submodule update -- "${SUBMODULE_DIR}"
}

build_module utility
build_module feature

# ── Serve with Python HTTP server ─────────────────────────────────────────────
PORT=8080
echo ""
echo "=== Preview ready: http://localhost:${PORT}/ ==="
echo "    Press Ctrl+C to stop."
start "" "http://localhost:${PORT}/" 2>/dev/null || true
cd "${OUT}"
python -m http.server ${PORT}
