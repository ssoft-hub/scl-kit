# osxcross cross-compilation toolchain file: build for macOS (Darwin) from a
# non-Darwin host (Linux/WSL) via an osxcross install.
#
# Unlike clang-generic.cmake / gcc-generic.cmake, this file needs no
# -DSCL_TARGET_TRIPLET / -DSCL_SYSROOT: it discovers the target triple, the SDK
# path, and the tool directory from `osxcross-conf`, which osxcross ships in its
# target/bin. That single dependency is "osxcross's target/bin on PATH" -- the
# same shape of precondition as "crossbuild-essential-arm64 installed" for the
# Linux cross presets.
#
# Usage (from CMakePresets.json osxcross-* presets):
#   export PATH=<osxcross>/target/bin:$PATH      # provides osxcross-conf + <triple>-clang
#   cmake --preset osxcross-arm64                # SCL_APPLE_ARCH baked by the preset
#
# The selected architecture(s) come from SCL_APPLE_ARCH:
#   arm64            -> single-arch arm64
#   x86_64           -> single-arch x86_64
#   arm64;x86_64     -> fat (universal) binary

set(CMAKE_SYSTEM_NAME Darwin)

set(SCL_APPLE_ARCH "arm64" CACHE STRING "Apple target arch(es) for osxcross: arm64 | x86_64 | arm64;x86_64")

# osxcross-conf prints `export OSXCROSS_*="..."` lines; it lives in the same
# target/bin as the compilers, so finding it locates the whole toolchain.
find_program(SCL_OSXCROSS_CONF osxcross-conf)
if (NOT SCL_OSXCROSS_CONF)
    message(FATAL_ERROR
        "osxcross-conf not found on PATH. Add the osxcross target/bin to PATH "
        "before configuring, e.g.:\n"
        "  export PATH=$HOME/tools/osxcross/target/bin:$PATH")
endif()

execute_process(
    COMMAND "${SCL_OSXCROSS_CONF}"
    OUTPUT_VARIABLE _osxcross_conf
    OUTPUT_STRIP_TRAILING_WHITESPACE
    RESULT_VARIABLE _osxcross_conf_rc
)
if (NOT _osxcross_conf_rc EQUAL 0)
    message(FATAL_ERROR "osxcross-conf failed (exit ${_osxcross_conf_rc})")
endif()

# Pull the three values we need out of the `export KEY="VALUE"` dump.
foreach (_key OSXCROSS_TARGET OSXCROSS_SDK OSXCROSS_TARGET_DIR)
    if (_osxcross_conf MATCHES "${_key}=\"([^\"]*)\"")
        set(${_key} "${CMAKE_MATCH_1}")
    else()
        message(FATAL_ERROR "osxcross-conf output missing ${_key}")
    endif()
endforeach()

# osxcross-conf reports paths relative to target/bin (".../target/bin/../SDK/...");
# normalize so CMake and downstream tooling see a clean absolute path.
get_filename_component(OSXCROSS_SDK "${OSXCROSS_SDK}" ABSOLUTE)
get_filename_component(OSXCROSS_TARGET_DIR "${OSXCROSS_TARGET_DIR}" ABSOLUTE)

# The compiler driver is architecture-prefixed (arm64-apple-darwinNN-clang).
# For a fat build the first arch drives; CMAKE_OSX_ARCHITECTURES adds the rest.
list(GET SCL_APPLE_ARCH 0 _driver_arch)

set(_prefix "${OSXCROSS_TARGET_DIR}/bin/${_driver_arch}-apple-${OSXCROSS_TARGET}")
set(CMAKE_C_COMPILER      "${_prefix}-clang")
set(CMAKE_CXX_COMPILER    "${_prefix}-clang++")
set(CMAKE_OBJC_COMPILER   "${_prefix}-clang")
set(CMAKE_OBJCXX_COMPILER "${_prefix}-clang++")
set(CMAKE_AR                "${_prefix}-ar"                CACHE FILEPATH "")
set(CMAKE_RANLIB            "${_prefix}-ranlib"            CACHE FILEPATH "")
set(CMAKE_INSTALL_NAME_TOOL "${_prefix}-install_name_tool" CACHE FILEPATH "")

set(CMAKE_OSX_SYSROOT "${OSXCROSS_SDK}" CACHE PATH "")
set(CMAKE_OSX_ARCHITECTURES "${SCL_APPLE_ARCH}" CACHE STRING "")

set(CMAKE_FIND_ROOT_PATH "${OSXCROSS_SDK}")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
