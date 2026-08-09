#!/usr/bin/env sh
# Usage: script/ci/run_benchmarks.sh [PRESET] [CONFIG] [benchmark args...]
#
# Runs every *_gbench in a tree built with -DSCL_BUILD_BENCHMARKS=ON. The
# repetition count is fixed here, a before/after pair being comparable only at
# one count. CONFIG defaults to Release: a Debug timing measures the absence of
# optimisation.

set -eu

PRESET="${1:-default}"
[ $# -gt 0 ] && shift

# A CONFIG never starts with "-", so a leading "-" is already an extra argument.
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

# An empty run means benchmarks were off, which is the default; do not pass.
if [ "${FOUND}" -eq 0 ]; then
    echo "run_benchmarks.sh: no *_gbench binary in '${BIN_DIR}'." >&2
    echo "  configure with -DSCL_BUILD_BENCHMARKS=ON and rebuild" >&2
    exit 1
fi
