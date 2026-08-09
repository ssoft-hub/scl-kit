# Bare-metal ARM toolchain file, for measuring code size rather than running code.
# Usage:
#   cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=project/cmake/toolchain/arm-none-eabi.cmake
#
# Optional:
#   -DSCL_ARM_CPU=cortex-m0plus     target core (default: cortex-m4)
#   -DSCL_TOOL_PREFIX=/opt/gcc/bin  when the toolchain is not on PATH
#
# Requires the arm-none-eabi toolchain: `apt install gcc-arm-none-eabi`.

# Generic, not Linux: there is no operating system on the target, so CMake must
# not look for one or expect its conventions.
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# A freestanding target has no startup files or linker script here, so CMake's
# compiler check cannot link an executable. Checking a static library instead
# exercises the compiler without ever invoking the linker.
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

if (DEFINED SCL_TOOL_PREFIX AND NOT SCL_TOOL_PREFIX STREQUAL "")
    set(_TBIN "${SCL_TOOL_PREFIX}/")
else()
    set(_TBIN "")
endif()

set(CMAKE_C_COMPILER   "${_TBIN}arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER "${_TBIN}arm-none-eabi-g++")
set(CMAKE_AR           "${_TBIN}arm-none-eabi-ar")
set(CMAKE_RANLIB       "${_TBIN}arm-none-eabi-ranlib")
set(CMAKE_OBJCOPY      "${_TBIN}arm-none-eabi-objcopy")

# Cached, unlike the tools above: CMake never invokes it, but script/ci/run_size.sh
# reads it back out of the build tree to know which `size` matches these objects.
set(CMAKE_SIZE "${_TBIN}arm-none-eabi-size" CACHE FILEPATH "size(1) matching the target objects")

if (NOT DEFINED SCL_ARM_CPU OR SCL_ARM_CPU STREQUAL "")
    set(SCL_ARM_CPU "cortex-m4")
endif()

# -ffunction-sections/-fdata-sections put each symbol in its own section, so a
# .text figure reflects what a real firmware link would keep rather than every
# header-only function the translation unit happened to instantiate.
#
# Exceptions and RTTI are off because that is the profile these targets build
# in, and it is what SCL_HAS_RTTI resolves against.
set(_SCL_ARM_FLAGS "-mcpu=${SCL_ARM_CPU} -mthumb -ffunction-sections -fdata-sections")
set(CMAKE_C_FLAGS_INIT   "${_SCL_ARM_FLAGS}")
set(CMAKE_CXX_FLAGS_INIT "${_SCL_ARM_FLAGS} -fno-exceptions -fno-rtti")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
