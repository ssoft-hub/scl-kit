#!/bin/sh
# Build a local Sphinx preview of the full scl-kit docs site.
#
# Usage: sh script/preview_sphinx.sh [output_dir]
#   output_dir — defaults to preview-site/
#
# Structure:
#   <out>/            — top-level narrative Sphinx docs
#   <out>/_pagefind/  — Pagefind search index
#   <out>/utility/    — versioned API docs for utility module
#   <out>/feature/    — versioned API docs for feature module
#
# Serves on http://localhost:8080/ when done.

set -e

OUT="${1:-preview-site}"
rm -rf "${OUT}"
mkdir -p "${OUT}"
OUT=$(cd "${OUT}" && pwd)

SPHINX_SRC="$(pwd)/doc/sphinx"

native_path() {
  if command -v cygpath >/dev/null 2>&1; then cygpath -w "$1"; else echo "$1"; fi
}

# ── Top-level narrative docs ──────────────────────────────────────────────────
echo "=== Top-level docs ==="
DOCTREES=$(mktemp -d)
sphinx-build -Q -d "${DOCTREES}" "${SPHINX_SRC}" "${OUT}"
rm -rf "${DOCTREES}"

# ── Helpers ───────────────────────────────────────────────────────────────────
update_versions() {
  VFILE="$1"; VERSION="$2"; ALIAS="$3"
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

update_module_index() {
  MODULE="$1"
  python - "${OUT}/${MODULE}/versions.json" \
            "${OUT}/${MODULE}/index.html" \
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

build_version() {
  MODULE="$1"; VERSION="$2"; SUBMODULE_DIR="$3"; VERSIONS_JSON="$4"
  OUT_DIR="${OUT}/${MODULE}/${VERSION}"

  DOXYFILE="${SUBMODULE_DIR}/project/doxygen/Doxyfile"
  if [ ! -f "${DOXYFILE}" ]; then
    echo "    [warn] no Doxyfile for ${MODULE}@${VERSION}, skipping"
    return
  fi

  TMP_SRC=$(mktemp -d)
  TMP_XML=$(mktemp -d)
  TMP_TREES=$(mktemp -d)

  cp -r "${SPHINX_SRC}/." "${TMP_SRC}/"
  rm -f "${TMP_SRC}/index.md" "${TMP_SRC}/index_api.rst"
  cp "${SPHINX_SRC}/index_api.rst" "${TMP_SRC}/index.rst"

  (cd "${SUBMODULE_DIR}" && {
    cat project/doxygen/Doxyfile
    printf '\nGENERATE_HTML=NO\nGENERATE_XML=YES\nOUTPUT_DIRECTORY=%s\nXML_OUTPUT=xml\n' \
      "$(native_path "${TMP_XML}")"
  } | doxygen - 2>/dev/null)

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

# ── Build all versions for a module ──────────────────────────────────────────
build_module() {
  MODULE="$1"
  SUBMODULE_DIR="module/${MODULE}"

  echo ""
  echo "=== ${MODULE} ==="
  mkdir -p "${OUT}/${MODULE}"

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

  for TAG in $TAGS; do
    echo "  [build] ${TAG}"
    git -C "${SUBMODULE_DIR}" checkout -f "${TAG}"
    build_version "${MODULE}" "${TAG}" "${SUBMODULE_DIR}" "${VERSIONS_JSON}"
    update_versions "${OUT}/${MODULE}/versions.json" "${TAG}" ""
  done

  if [ -n "${DEV_REF}" ]; then
    echo "  [build] dev"
    git -C "${SUBMODULE_DIR}" checkout -f "${DEV_REF}"
    build_version "${MODULE}" "dev" "${SUBMODULE_DIR}" "${VERSIONS_JSON}"
    update_versions "${OUT}/${MODULE}/versions.json" "dev" "latest"
  fi

  update_module_index "${MODULE}"
  git submodule update -- "${SUBMODULE_DIR}"
}

build_module utility
build_module feature

# ── Pagefind ──────────────────────────────────────────────────────────────────
echo ""
echo "=== Pagefind ==="
python -m pagefind --site "${OUT}" --output-subdir _pagefind

# ── Serve ─────────────────────────────────────────────────────────────────────
PORT=8080
echo ""
echo "=== Preview ready: http://localhost:${PORT}/ ==="
echo "    Press Ctrl+C to stop."
start "" "http://localhost:${PORT}/" 2>/dev/null || true
cd "${OUT}"
python -m http.server ${PORT}
