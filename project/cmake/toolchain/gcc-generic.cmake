# Generic GCC cross-compilation toolchain file.
# Usage:
#   cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=project/cmake/toolchain/gcc-generic.cmake \
#         -DSCL_TARGET_TRIPLET=aarch64-linux-gnu -DSCL_SYSROOT=/opt/aarch64-sysroot
#
# You may also set SCL_TOOL_PREFIX if compilers are not in PATH:
#   -DSCL_TOOL_PREFIX=/opt/toolchain/bin

set(CMAKE_SYSTEM_NAME Linux)

# The target processor is the first component of the triplet
# (aarch64-linux-gnu -> aarch64); the output-directory layout depends on it.
if (DEFINED SCL_TARGET_TRIPLET AND NOT SCL_TARGET_TRIPLET STREQUAL "")
    string(REGEX REPLACE "-.*" "" _scl_triplet_proc "${SCL_TARGET_TRIPLET}")
    set(CMAKE_SYSTEM_PROCESSOR "${_scl_triplet_proc}")
endif()

# Prefer user-provided triplet/tool prefix; fall back to PATH if not set.
if (DEFINED SCL_TARGET_TRIPLET AND NOT SCL_TARGET_TRIPLET STREQUAL "")
    if (DEFINED SCL_TOOL_PREFIX AND NOT SCL_TOOL_PREFIX STREQUAL "")
        # Absolute location: <prefix>/<triplet>-gcc
        set(_TBIN "${SCL_TOOL_PREFIX}/")
    else()
        # Bare name: <triplet>-gcc, resolved from PATH
        set(_TBIN "")
    endif()
    set(CMAKE_C_COMPILER   "${_TBIN}${SCL_TARGET_TRIPLET}-gcc")
    set(CMAKE_CXX_COMPILER "${_TBIN}${SCL_TARGET_TRIPLET}-g++")
endif()

# Sysroot support
if (DEFINED SCL_SYSROOT AND NOT SCL_SYSROOT STREQUAL "")
    set(CMAKE_SYSROOT "${SCL_SYSROOT}")
    set(CMAKE_FIND_ROOT_PATH
        "${SCL_SYSROOT}" "${SCL_SYSROOT}/usr" "${SCL_SYSROOT}/usr/local"
    )
    set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
endif()
