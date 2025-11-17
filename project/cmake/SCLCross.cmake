# Cross-compilation helper (safe to include on native builds).
# Goals:
# - Respect a provided toolchain file (-DCMAKE_TOOLCHAIN_FILE=...).
# - Optionally configure sysroot and find paths when cross-compiling.
# - Keep host tools discoverable while libraries/headers are looked up in target root.

include_guard(GLOBAL)

# User-tunable variables:
#  - SCL_SYSROOT        : absolute path to target sysroot (e.g., /opt/aarch64-sysroot)
#  - SCL_TARGET_TRIPLET : target triplet for GCC/Clang (e.g., aarch64-linux-gnu)
#  - SCL_TOOL_PREFIX    : path prefix where cross compilers live (e.g., /opt/toolchain/bin)
#  - SCL_FORCE_CROSS    : force applying cross rules even if CMAKE_CROSSCOMPILING is OFF

# Apply only in cross scenarios (or forced)
if (CMAKE_CROSSCOMPILING OR SCL_FORCE_CROSS)
    message(STATUS "[SCLCross] Configuring cross-compilation helpers")

    # Configure sysroot if provided
    if (DEFINED SCL_SYSROOT AND NOT SCL_SYSROOT STREQUAL "")
        if (NOT IS_ABSOLUTE "${SCL_SYSROOT}")
            message(FATAL_ERROR "SCL_SYSROOT must be an absolute path")
        endif()
        # CMake 3.20+ honors these for search paths and compiler driver flags
        set(CMAKE_SYSROOT "${SCL_SYSROOT}" CACHE PATH "CMake sysroot" FORCE)
        set(CMAKE_SYSROOT_COMPILE "${SCL_SYSROOT}" CACHE PATH "" FORCE)
        set(CMAKE_SYSROOT_LINK    "${SCL_SYSROOT}" CACHE PATH "" FORCE)

        # Hint CMake find logic to prefer the sysroot for headers/libs
        list(PREPEND CMAKE_PREFIX_PATH
            "${SCL_SYSROOT}" "${SCL_SYSROOT}/usr" "${SCL_SYSROOT}/usr/local"
        )
        list(PREPEND CMAKE_FIND_ROOT_PATH
            "${SCL_SYSROOT}" "${SCL_SYSROOT}/usr" "${SCL_SYSROOT}/usr/local"
        )

        # Modes: look for headers/libs ONLY in root path, but host programs on host.
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
        # Programs normally are host tools; adjust to BOTH if you need target-side tools:
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    endif()

    # Optionally point compilers to target-prefixed names if not provided by toolchain file
    if (DEFINED SCL_TARGET_TRIPLET AND NOT SCL_TARGET_TRIPLET STREQUAL "")
        if (NOT DEFINED CMAKE_C_COMPILER OR NOT DEFINED CMAKE_CXX_COMPILER)
            if (DEFINED SCL_TOOL_PREFIX AND NOT SCL_TOOL_PREFIX STREQUAL "")
                set(_TOOLBIN "${SCL_TOOL_PREFIX}")
            else()
                set(_TOOLBIN "") # rely on PATH
            endif()
            if (NOT DEFINED CMAKE_C_COMPILER)
                set(CMAKE_C_COMPILER   "${_TOOLBIN}/${SCL_TARGET_TRIPLET}-gcc"  CACHE STRING "" FORCE)
            endif()
            if (NOT DEFINED CMAKE_CXX_COMPILER)
                set(CMAKE_CXX_COMPILER "${_TOOLBIN}/${SCL_TARGET_TRIPLET}-g++"  CACHE STRING "" FORCE)
            endif()
        endif()
    endif()

    # Add explicit --sysroot if compiler driver does not pick it up
    if (DEFINED SCL_SYSROOT AND NOT SCL_SYSROOT STREQUAL "")
        add_compile_options(--sysroot=${SCL_SYSROOT})
        add_link_options(--sysroot=${SCL_SYSROOT})
    endif()
endif()
