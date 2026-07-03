#!/usr/bin/env sh
# Run the ScL Toolkit test suite through a CMake test preset.
#
# Uses the same preset as script/ci/build.sh, so it drives CTest in the exact
# build tree the build populated (build/<preset>/). Cross presets (e.g.
# clang-arm64) have no test preset: their binaries do not run on the host.
#
# Usage:
#   script/ci/run_tests.sh [PRESET] [CONFIG]
#
#   PRESET   CMake test preset            (default: default)
#   CONFIG   configuration to test for multi-config presets (default: Debug)
#
# Examples:
#   script/ci/run_tests.sh
#   script/ci/run_tests.sh clang-x64 Release
#   script/ci/run_tests.sh msvc-x64 Debug

set -eu

PRESET="${1:-default}"
CONFIG="${2:-Debug}"

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
cd "${SCRIPT_DIR}/../.."

set -x
ctest --preset "${PRESET}" --build-config "${CONFIG}"
