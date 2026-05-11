#!/bin/sh
# Build and serve a local Sphinx preview.
# Must be run from the scl-kit root directory.
#
# Usage: sh script/sphinx/preview.sh [output_dir]
#   output_dir — defaults to doc/sphinx/

set -e

OUT="${1:-doc/sphinx}"
sh "$(dirname "$0")/build.sh" "${OUT}"

PORT=8080
echo ""
echo "=== Preview ready: http://localhost:${PORT}/ ==="
echo "    Press Ctrl+C to stop."
start "" "http://localhost:${PORT}/" 2>/dev/null || true
cd "${OUT}"
python -m http.server ${PORT}
