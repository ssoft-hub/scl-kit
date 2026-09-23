#!/usr/bin/env sh
# Usage: script/ci/run_size.sh [PRESET] [CONFIG] --benchmarks
#
# Reports the .text of every *_size library in the tree script/ci/build.sh
# --benchmarks populated. Those libraries are compiled to be measured and never
# linked, so nothing else drives them.

set -eu

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
. "${SCRIPT_DIR}/variant.sh"

PRESET="${1:-default}"
CONFIG="${2:-MinSizeRel}"

cd "${SCRIPT_DIR}/../.."

CACHE="build/${PRESET}${SCL_BUILD_SUFFIX}/CMakeCache.txt"
if [ ! -f "${CACHE}" ]; then
    echo "run_size.sh: no build tree for preset '${PRESET}'." >&2
    echo "  cmake --preset ${PRESET} && cmake --build --preset ${PRESET}" >&2
    exit 1
fi

# The host size(1) reads a foreign object as garbage rather than refusing it.
SIZE="$(sed -n 's/^CMAKE_SIZE:FILEPATH=//p' "${CACHE}")"
SIZE="${SIZE:-size}"

BIN_DIR="$(sed -n 's/^SCL_TARGET_BASE_DIR:PATH=//p' "${CACHE}")/${CONFIG}"
if [ ! -d "${BIN_DIR}" ]; then
    echo "run_size.sh: '${BIN_DIR}' does not exist; was ${CONFIG} built?" >&2
    exit 1
fi

FOUND=0
for library in "${BIN_DIR}"/*_size.a "${BIN_DIR}"/*_size.lib; do
    [ -f "${library}" ] || continue
    FOUND=$((FOUND + 1))
    echo "== ${library}"
    "${SIZE}" -t "${library}"
done

# An empty run means benchmarks were off, which is the default; do not pass.
if [ "${FOUND}" -eq 0 ]; then
    echo "run_size.sh: no *_size library in '${BIN_DIR}'." >&2
    echo "  build with --benchmarks and run this again" >&2
    exit 1
fi
