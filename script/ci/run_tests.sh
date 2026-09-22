#!/usr/bin/env sh
# Usage: script/ci/run_tests.sh [PRESET] [CONFIG] [--no-rtti|--no-exceptions]
#
# Drives CTest in the tree script/ci/build.sh populated, so the flags must match.
# A cross preset has no test preset: its binaries do not run on the host.

set -eu

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
. "${SCRIPT_DIR}/variant.sh"

PRESET="${1:-default}"
CONFIG="${2:-Debug}"

cd "${SCRIPT_DIR}/../.."

set -x
ctest --preset "${PRESET}" --build-config "${CONFIG}"
