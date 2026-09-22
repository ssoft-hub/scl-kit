#!/usr/bin/env sh
# Usage: script/ci/build.sh [PRESET] [CONFIG] [--no-rtti|--no-exceptions|--benchmarks]
#        [extra configure args...]
#
# PRESET defaults to `default`, CONFIG to Debug. A variant flag builds in a tree
# and a bin/ directory of its own; pass the same flags to every script in the run.

set -eu

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
. "${SCRIPT_DIR}/variant.sh"

PRESET="${1:-default}"
[ $# -gt 0 ] && shift

# A CONFIG never starts with "-", so a leading "-" is already an extra argument.
CONFIG="Debug"
case "${1-}" in
    -*|"") ;;
    *) CONFIG="$1"; shift ;;
esac

cd "${SCRIPT_DIR}/../.."

set -x
cmake --preset "${PRESET}" -DCMAKE_BUILD_TYPE="${CONFIG}" ${SCL_VARIANT_DEFS} "$@"
cmake --build --preset "${PRESET}" --config "${CONFIG}"
