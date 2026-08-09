#!/usr/bin/env sh
# Report the code size of the *_size libraries built into a build tree.
#
# These libraries are compiled to be measured, never linked or run, so there is
# nothing for CTest or a benchmark runner to drive. The figure that matters is
# .text: on a flash-constrained target it is the cost an inlining annotation is
# traded against, and a desktop timing loop cannot see it.
#
# Usage:
#   script/ci/run_size.sh [PRESET] [CONFIG]
#
#   PRESET   CMake preset whose build tree to measure (default: default)
#   CONFIG   configuration to measure (default: MinSizeRel)
#
# Build first, for a target worth measuring:
#   cmake --preset arm-none-eabi && cmake --build --preset arm-none-eabi
#
# Examples:
#   script/ci/run_size.sh arm-none-eabi
#   script/ci/run_size.sh arm-none-eabi MinSizeRel

set -eu

PRESET="${1:-default}"
CONFIG="${2:-MinSizeRel}"

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
cd "${SCRIPT_DIR}/../.."

CACHE="build/${PRESET}/CMakeCache.txt"
if [ ! -f "${CACHE}" ]; then
    echo "run_size.sh: no build tree for preset '${PRESET}'." >&2
    echo "  cmake --preset ${PRESET} && cmake --build --preset ${PRESET}" >&2
    exit 1
fi

# A cross build must be measured with its own size(1): the host's reads a
# foreign object file as garbage rather than refusing it.
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

# An empty run must not report success: it means the build had benchmarks
# switched off, which is the default.
if [ "${FOUND}" -eq 0 ]; then
    echo "run_size.sh: no *_size library in '${BIN_DIR}'." >&2
    echo "  configure with -DSCL_BUILD_BENCHMARKS=ON and rebuild" >&2
    exit 1
fi
