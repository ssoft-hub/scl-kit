# Bare metal, to measure code size; nothing built here runs. Needs
# gcc-arm-none-eabi. SCL_ARM_CPU picks the core, SCL_TOOL_PREFIX the install.
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# A freestanding target has no startup code, so the compiler check cannot link.
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

# Cached because CMake never invokes it: script/ci/run_size.sh reads it back.
set(CMAKE_SIZE "${_TBIN}arm-none-eabi-size" CACHE FILEPATH "size(1) matching the target objects")

if (NOT DEFINED SCL_ARM_CPU OR SCL_ARM_CPU STREQUAL "")
    set(SCL_ARM_CPU "cortex-m4")
endif()

# Per-symbol sections, so .text reflects what a firmware link would keep.
set(_SCL_ARM_FLAGS "-mcpu=${SCL_ARM_CPU} -mthumb -ffunction-sections -fdata-sections")
set(CMAKE_C_FLAGS_INIT   "${_SCL_ARM_FLAGS}")
set(CMAKE_CXX_FLAGS_INIT "${_SCL_ARM_FLAGS}")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
