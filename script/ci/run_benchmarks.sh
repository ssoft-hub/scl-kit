#!/usr/bin/env sh
# Run the ScL Toolkit benchmarks built into a preset's output directory.
#
# Benchmarks are not CTest tests, so this has no test preset to delegate to the
# way script/ci/run_tests.sh does. It reads the output directory out of the
# build tree's cache instead, which keeps it correct whatever toolchain triplet
# the preset resolved to.
#
# The repetition flags are fixed here on purpose: a before/after comparison is
# only meaningful when both runs aggregate the same number of repetitions.
#
# Usage:
#   script/ci/run_benchmarks.sh [PRESET] [CONFIG] [extra benchmark args...]
#
#   PRESET   CMake preset whose build tree to run    (default: default)
#   CONFIG   configuration to run (default: Release). Debug timings measure
#            the absence of optimization, not the code.
#   Extra arguments are forwarded to every benchmark binary, e.g.
#            script/ci/run_benchmarks.sh clang-x64 Release --benchmark_filter=fnv1a
#
# Build first, with benchmarks enabled:
#   script/ci/build.sh clang-x64 Release -DSCL_BUILD_BENCHMARKS=ON -DSCL_BUILD_TESTS=OFF
#
# Examples:
#   script/ci/run_benchmarks.sh clang-x64
#   script/ci/run_benchmarks.sh msvc-x64-2022 Release --benchmark_filter=siphash

set -eu

PRESET="${1:-default}"
[ $# -gt 0 ] && shift

# A CONFIG name never starts with "-"; a leading "-" means the caller omitted
# CONFIG and this is already an extra argument to forward as-is.
CONFIG="Release"
case "${1-}" in
    -*|"") ;;
    *) CONFIG="$1"; shift ;;
esac

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
cd "${SCRIPT_DIR}/../.."

CACHE="build/${PRESET}/CMakeCache.txt"
if [ ! -f "${CACHE}" ]; then
    echo "run_benchmarks.sh: no build tree for preset '${PRESET}'." >&2
    echo "  script/ci/build.sh ${PRESET} ${CONFIG} -DSCL_BUILD_BENCHMARKS=ON -DSCL_BUILD_TESTS=OFF" >&2
    exit 1
fi

BIN_DIR="$(sed -n 's/^SCL_TARGET_BASE_DIR:PATH=//p' "${CACHE}")/${CONFIG}"
if [ ! -d "${BIN_DIR}" ]; then
    echo "run_benchmarks.sh: '${BIN_DIR}' does not exist; was ${CONFIG} built?" >&2
    exit 1
fi

FOUND=0
for binary in "${BIN_DIR}"/*_gbench "${BIN_DIR}"/*_gbench.exe; do
    [ -f "${binary}" ] || continue
    FOUND=$((FOUND + 1))
    set -x
    "${binary}" --benchmark_repetitions=5 --benchmark_report_aggregates_only=true "$@"
    set +x
done

# An empty run must not report success: it means the build had benchmarks
# switched off, which is the default.
if [ "${FOUND}" -eq 0 ]; then
    echo "run_benchmarks.sh: no *_gbench binary in '${BIN_DIR}'." >&2
    echo "  configure with -DSCL_BUILD_BENCHMARKS=ON and rebuild" >&2
    exit 1
fi
