# Generic Clang cross-compilation toolchain file.
# Usage:
#   cmake -S . -B build -G Ninja \
#     -DCMAKE_TOOLCHAIN_FILE=project/toolchains/clang-generic.cmake \
#     -DSCL_TARGET_TRIPLET=aarch64-linux-gnu -DSCL_SYSROOT=/opt/aarch64-sysroot \
#     -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++

set(CMAKE_SYSTEM_NAME Linux)
# set(CMAKE_SYSTEM_PROCESSOR aarch64)

# Sysroot and target triple
if (DEFINED SCL_SYSROOT AND NOT SCL_SYSROOT STREQUAL "")
    set(CMAKE_SYSROOT "${SCL_SYSROOT}")
    set(CMAKE_FIND_ROOT_PATH
        "${SCL_SYSROOT}" "${SCL_SYSROOT}/usr" "${SCL_SYSROOT}/usr/local"
    )
    set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
endif()

# For Clang, pass target/triple via flags if needed
if (DEFINED SCL_TARGET_TRIPLET AND NOT SCL_TARGET_TRIPLET STREQUAL "")
    set(CMAKE_C_FLAGS_INIT   "--target=${SCL_TARGET_TRIPLET}")
    set(CMAKE_CXX_FLAGS_INIT "--target=${SCL_TARGET_TRIPLET}")
endif()
