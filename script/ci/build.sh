#!/usr/bin/env sh
# Configure and build the ScL Toolkit through a CMake preset.
#
# Delegating to a preset means scripts and IDEs share the exact same build tree
# (build/<preset>/), keyed by compiler + architecture. The compiler version and
# architecture appear on the artifacts under bin/<OS>-<Compiler>.<Version>-<arch>/.
#
# Usage:
#   script/ci/build.sh [PRESET] [CONFIG] [extra cmake configure args...]
#
#   PRESET   CMake configure/build preset  (default: default)
#            e.g. default, clang-x64, gcc-x64, msvc-x64-2022, msvc-x86-2022,
#                 clang-arm64 / gcc-arm64 (cross, need SCL_SYSROOT)
#   CONFIG   build configuration (default: Debug). Multi-config presets pick
#            it at build time; single-config presets (e.g. `default`) bake it
#            in at configure time via CMAKE_BUILD_TYPE, so the requested
#            CONFIG is honored either way. May be omitted even when passing
#            extra args, since a "-..." argument is never mistaken for it.
#   Extra arguments are forwarded to the configure step, e.g.
#            script/ci/build.sh gcc-arm64 -DSCL_SYSROOT=/opt/aarch64-sysroot
#
# Examples:
#   script/ci/build.sh                    # default preset, Debug
#   script/ci/build.sh clang-x64 Release
#   script/ci/build.sh msvc-x64-2022 Debug

set -eu

PRESET="${1:-default}"
[ $# -gt 0 ] && shift

# A CONFIG name never starts with "-"; a leading "-" means the caller omitted
# CONFIG and this is already an extra configure argument to forward as-is.
CONFIG="Debug"
case "${1-}" in
    -*|"") ;;
    *) CONFIG="$1"; shift ;;
esac

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
cd "${SCRIPT_DIR}/../.."

set -x
cmake --preset "${PRESET}" -DCMAKE_BUILD_TYPE="${CONFIG}" "$@"
cmake --build --preset "${PRESET}" --config "${CONFIG}"
