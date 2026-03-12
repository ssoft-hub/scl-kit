#!/bin/sh
# Deploy unified Sphinx docs (narrative + versioned API per module) to pages branch.
# Must be run from the scl-kit root directory.
#
# Usage: sh script/ci/deploy_sphinx_docs.sh <pages_branch> [dryrun]
#   pages_branch — gh-pages (GitHub) or pages (GitLab)
#   dryrun       — skip push, keep output dir, print its path
#
# Output structure:
#   /                 — top-level narrative docs (Sphinx)
#   /_pagefind/       — Pagefind search index
#   /utility/         — utility version listing + versions.json
#   /utility/<ver>/   — Sphinx API docs for utility@<ver>
#   /feature/<ver>/   — Sphinx API docs for feature@<ver>

set -e

PAGES_BRANCH="${1:-gh-pages}"
DRY_RUN="${2:-}"
SPHINX_SRC="doc/sphinx"

native_path() {
  if command -v cygpath >/dev/null 2>&1; then cygpath -w "$1"; else echo "$1"; fi
}

PAGES_WORK=$(mktemp -d)
DOCTREES=$(mktemp -d)

cleanup() {
  rm -rf "${DOCTREES}"
  if [ -z "${DRY_RUN}" ]; then
    rm -rf "${PAGES_WORK}"
  fi
  git submodule update -- module/utility module/feature 2>/dev/null || true
}
trap cleanup EXIT

REMOTE_URL=$(git remote get-url origin)

git fetch origin "${PAGES_BRANCH}" 2>/dev/null || true
if git rev-parse --verify "origin/${PAGES_BRANCH}" >/dev/null 2>&1; then
  git clone --branch "${PAGES_BRANCH}" --single-branch "${REMOTE_URL}" "${PAGES_WORK}"
fi

# ── Top-level narrative docs ──────────────────────────────────────────────────
echo "=== Top-level docs ==="
sphinx-build -Q -d "${DOCTREES}/root" "${SPHINX_SRC}" "${PAGES_WORK}"
rm -rf "${DOCTREES}/root"

# ── Per-module versioned API docs ─────────────────────────────────────────────

# Read existing deployed versions for a module
read_existing() {
  MODULE="$1"
  VFILE="${PAGES_WORK}/${MODULE}/versions.json"
  if [ -f "${VFILE}" ]; then
    python - "${VFILE}" << 'EOF'
import json, sys
data = json.load(open(sys.argv[1]))
for v in data: print(v['version'])
EOF
  fi
}

# Update versions.json
update_versions() {
  MODULE="$1"; VERSION="$2"; ALIAS="$3"
  VFILE="${PAGES_WORK}/${MODULE}/versions.json"
  python - "${VFILE}" "${VERSION}" "${ALIAS}" << 'EOF'
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

# Regenerate module index.html
update_module_index() {
  MODULE="$1"
  python - "${PAGES_WORK}/${MODULE}/versions.json" \
            "${PAGES_WORK}/${MODULE}/index.html" \
            "${MODULE}" << 'EOF'
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
<meta http-equiv="refresh" content="0; url=dev/">
<title>SCL {m} — Versions</title>
<style>body{{font-family:sans-serif;max-width:600px;margin:2em auto}}</style>
</head><body>
<h1>SCL {m}</h1><ul>{items}</ul>
</body></html>'''.format(m=module.capitalize(), items=items)
open(idx_file, 'w').write(html)
EOF
}

# Build one version of a module with Sphinx + Breathe
build_version() {
  MODULE="$1"; VERSION="$2"; SUBMODULE_DIR="$3"; VERSIONS_JSON="$4"
  OUT_DIR="${PAGES_WORK}/${MODULE}/${VERSION}"

  DOXYFILE="${SUBMODULE_DIR}/project/doxygen/Doxyfile"
  if [ ! -f "${DOXYFILE}" ]; then
    echo "    [warn] no Doxyfile for ${MODULE}@${VERSION}, skipping"
    return
  fi

  TMP_SRC=$(mktemp -d)
  TMP_XML=$(mktemp -d)
  TMP_TREES=$(mktemp -d)

  # Copy Sphinx source; for API builds use index_api.rst as root
  cp -r "${SPHINX_SRC}/." "${TMP_SRC}/"
  rm -f "${TMP_SRC}/index.md" "${TMP_SRC}/index_api.rst"
  cp "${SPHINX_SRC}/index_api.rst" "${TMP_SRC}/index.rst"

  # Doxygen → XML only
  (cd "${SUBMODULE_DIR}" && {
    cat project/doxygen/Doxyfile
    printf '\nGENERATE_HTML=NO\nGENERATE_XML=YES\nOUTPUT_DIRECTORY=%s\nXML_OUTPUT=xml\n' \
      "$(native_path "${TMP_XML}")"
  } | doxygen - 2>/dev/null)

  # Nav config JSON
  MODULE_CAP=$(python -c "print('${MODULE}'.capitalize())")
  NAV_CFG='{"module":"'"${MODULE}"'","version":"'"${VERSION}"'","versions":'"${VERSIONS_JSON}"',"siteRoot":"../../"}'

  printf 'window.SCL_NAV=%s;\n' "${NAV_CFG}" > "${TMP_SRC}/_static/scl_config.js"

  rm -rf "${OUT_DIR}"
  mkdir -p "${OUT_DIR}"

  SCL_PROJECT_NAME="SCL ${MODULE_CAP}" \
  SCL_MODULE="${MODULE}" \
  SCL_VERSION="${VERSION}" \
  SCL_DOXYGEN_XML="${TMP_XML}/xml" \
  SCL_SRC_DIR="$(pwd)/${SUBMODULE_DIR}/src" \
    sphinx-build -Q -d "${TMP_TREES}" "${TMP_SRC}" "${OUT_DIR}"

  rm -rf "${TMP_SRC}" "${TMP_XML}" "${TMP_TREES}"
}

# Build all versions for one module
build_module() {
  MODULE="$1"
  SUBMODULE_DIR="module/${MODULE}"

  echo ""
  echo "=== Module: ${MODULE} ==="
  mkdir -p "${PAGES_WORK}/${MODULE}"

  TAGS=$(git -C "${SUBMODULE_DIR}" tag -l 'v[0-9]*' 2>/dev/null | sort -V || true)

  DEV_REF=""
  if git -C "${SUBMODULE_DIR}" rev-parse --verify dev >/dev/null 2>&1; then
    DEV_REF="dev"
  elif git -C "${SUBMODULE_DIR}" rev-parse --verify "origin/dev" >/dev/null 2>&1; then
    DEV_REF="origin/dev"
  fi

  EXISTING=$(read_existing "${MODULE}")
  echo "    Tags    : $(echo "${TAGS}" | tr '\n' ' ')"
  echo "    Existing: $(echo "${EXISTING}" | tr '\n' ' ')"

  # Pre-compute versions list for nav bar
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

  # Version tags — skip already deployed
  for TAG in $TAGS; do
    if echo "${EXISTING}" | grep -qxF "${TAG}"; then
      echo "  [skip] ${TAG}"
      continue
    fi
    echo "  [build] ${TAG}"
    git -C "${SUBMODULE_DIR}" checkout -f "${TAG}"
    build_version "${MODULE}" "${TAG}" "${SUBMODULE_DIR}" "${VERSIONS_JSON}"
    update_versions "${MODULE}" "${TAG}" ""
  done

  # dev — always rebuild
  if [ -n "${DEV_REF}" ]; then
    echo "  [build] dev"
    git -C "${SUBMODULE_DIR}" checkout -f "${DEV_REF}"
    build_version "${MODULE}" "dev" "${SUBMODULE_DIR}" "${VERSIONS_JSON}"
    update_versions "${MODULE}" "dev" "latest"
  fi

  update_module_index "${MODULE}"
  git submodule update -- "${SUBMODULE_DIR}"
}

build_module utility
build_module feature

# ── Pagefind ──────────────────────────────────────────────────────────────────
echo ""
echo "=== Pagefind ==="
python -m pagefind --site "${PAGES_WORK}" --output-subdir _pagefind

# ── Commit and push ───────────────────────────────────────────────────────────
if [ -n "${DRY_RUN}" ]; then
  echo ""
  echo "  [dryrun] output: ${PAGES_WORK}"
else
  git -C "${PAGES_WORK}" config user.email "$(git config user.email)"
  git -C "${PAGES_WORK}" config user.name "$(git config user.name)"
  git -C "${PAGES_WORK}" remote set-url origin "${REMOTE_URL}"
  git -C "${PAGES_WORK}" add -A
  if git -C "${PAGES_WORK}" diff --cached --quiet; then
    echo "  [no changes]"
  else
    git -C "${PAGES_WORK}" commit -m "docs: deploy unified Sphinx docs"
    git -C "${PAGES_WORK}" push origin "${PAGES_BRANCH}"
  fi
fi

echo ""
echo "=== Done ==="
