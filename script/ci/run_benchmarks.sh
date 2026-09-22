#!/usr/bin/env sh
# Usage: script/ci/run_benchmarks.sh [PRESET] [CONFIG] --benchmarks [benchmark args...]
#
# Runs every *_gbench in the tree script/ci/build.sh --benchmarks populated, so the
# flag goes here too. The repetition count is fixed here, since a before/after pair
# is comparable only at one count; SCL_BENCHMARK_REPETITIONS raises it for both.
# SCL_BENCHMARK_TAG names the run, SCL_BENCHMARK_OUT_DIR moves the JSON.

set -eu

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
. "${SCRIPT_DIR}/variant.sh"

PRESET="${1:-default}"
[ $# -gt 0 ] && shift

# A CONFIG never starts with "-", so a leading "-" is already an extra argument.
CONFIG="Release"
case "${1-}" in
    -*|"") ;;
    *) CONFIG="$1"; shift ;;
esac

cd "${SCRIPT_DIR}/../.."

CACHE="build/${PRESET}${SCL_BUILD_SUFFIX}/CMakeCache.txt"
if [ ! -f "${CACHE}" ]; then
    echo "run_benchmarks.sh: no build tree '${PRESET}${SCL_BUILD_SUFFIX}'." >&2
    echo "  script/ci/build.sh          ${PRESET} ${CONFIG} --benchmarks" >&2
    echo "  script/ci/run_benchmarks.sh ${PRESET} ${CONFIG} --benchmarks" >&2
    exit 1
fi

BIN_DIR="$(sed -n 's/^SCL_TARGET_BASE_DIR:PATH=//p' "${CACHE}")/${CONFIG}"
if [ ! -d "${BIN_DIR}" ]; then
    echo "run_benchmarks.sh: '${BIN_DIR}' does not exist; was ${CONFIG} built?" >&2
    exit 1
fi

# A figure only in scrollback feeds no comparison tool, so each run is kept.
RESULTS_DIR="${SCL_BENCHMARK_OUT_DIR:-build/${PRESET}${SCL_BUILD_SUFFIX}/benchmark-results}"
mkdir -p "${RESULTS_DIR}"

FOUND=0
for binary in "${BIN_DIR}"/*_gbench "${BIN_DIR}"/*_gbench.exe; do
    [ -f "${binary}" ] || continue
    FOUND=$((FOUND + 1))
    name="$(basename "${binary}" .exe)"
    result="${RESULTS_DIR}/${name}-${SCL_BENCHMARK_TAG:-latest}.json"
    set -x
    "${binary}" --benchmark_repetitions="${SCL_BENCHMARK_REPETITIONS:-5}" \
        --benchmark_report_aggregates_only=true \
        --benchmark_out="${result}" --benchmark_out_format=json "$@"
    set +x
done

# An empty run means benchmarks were off, which is the default; do not pass.
if [ "${FOUND}" -eq 0 ]; then
    echo "run_benchmarks.sh: no *_gbench binary in '${BIN_DIR}'." >&2
    echo "  build with --benchmarks and run this again" >&2
    exit 1
fi

echo
echo "Results written to ${RESULTS_DIR}/"
echo "Set SCL_BENCHMARK_TAG to keep a run under its own name, then compare two of them:"
echo "  python 3rdparty/benchmark/tools/compare.py benchmarks <before>.json <after>.json"
echo "  (that tool needs numpy and scipy; the files are plain JSON without them)"
