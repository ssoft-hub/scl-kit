# 3.23: FILE_SET HEADERS install and CMakePresets.json v4 both require it.
cmake_minimum_required(VERSION 3.23)

project(ScL
    VERSION 0.0.0
    LANGUAGES CXX
    DESCRIPTION "ScL C++ Toolkit"
)

# Modules composed into the toolkit. This list drives the module/example/test
# subdirectories, the installed target set, and the find_package() component
# list in SCLConfig.cmake.in — wiring a new module means extending it here only.
# Order matters: a module may fall back to find_package(scl COMPONENTS ...)
# for a dependency not yet built in-tree (see module/feature's scl::utility
# guard), so a dependency must be listed before its dependents.
set(SCL_MODULES utility feature)

# -----------------------------
# Global options
# -----------------------------
# Default to OFF when scl-kit is consumed via add_subdirectory()/FetchContent:
# an embedding consumer gets just the scl targets, without our tests, examples,
# or install rules.
option(SCL_BUILD_EXAMPLES "Build examples" ${PROJECT_IS_TOP_LEVEL})
option(SCL_BUILD_TESTS    "Build tests"    ${PROJECT_IS_TOP_LEVEL})
option(SCL_INSTALL        "Enable install/export packaging" ${PROJECT_IS_TOP_LEVEL})

# Test framework toggles
option(SCL_ENABLE_GTEST   "Enable GoogleTest-based tests (if available)"   ON)
option(SCL_ENABLE_DOCTEST "Enable doctest-based tests (if available)"      ON)
option(SCL_ENABLE_CATCH2  "Enable Catch2-based tests (if available)"       ON)

# Optional variant tag: keeps bin/ outputs of same-toolchain builds with
# different options apart (e.g. -DSCL_BUILD_VARIANT=notests). Build trees are
# already separated per preset; see CONTRIBUTING.md "Independent builds".
set(SCL_BUILD_VARIANT "" CACHE STRING "Suffix appended to the toolchain triplet to isolate option variants")

# -----------------------------
# C++ standard and common settings
# -----------------------------
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# Keep compiler extensions on: on macOS some libc/system facilities are only
# exposed under the GNU dialect (e.g. -std=gnu++20), so a strict -std=c++20
# fails to pull them in.
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(SCL_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}")

# -----------------------------
# One place building (unified output directories)
# -----------------------------
# Compose a toolchain "triplet": <OS>-<Compiler>.<Version>-<Arch>
# Examples:
#   Linux-GNU.13.2.0-x64
#   Windows-MSVC.19.41-x64
#   Darwin-AppleClang.15.0.0-arm64
#
# The arch component must describe the *target*, not the host:
# CMAKE_SYSTEM_PROCESSOR keeps reporting the host for VS `-A`, `-m32`, and
# CMAKE_OSX_ARCHITECTURES builds, which would fold different-architecture
# builds into one bin/ directory.
if (CMAKE_OSX_ARCHITECTURES)
    string(REPLACE ";" "+" _proc "${CMAKE_OSX_ARCHITECTURES}")
elseif (CMAKE_GENERATOR_PLATFORM)
    set(_proc "${CMAKE_GENERATOR_PLATFORM}")
else()
    # Also the path taken for cross builds: the toolchain files set
    # CMAKE_SYSTEM_PROCESSOR from SCL_TARGET_TRIPLET before this runs.
    set(_proc "${CMAKE_SYSTEM_PROCESSOR}")
endif()

string(TOLOWER "${_proc}" _proc)
if (_proc MATCHES "^(amd64|x86_64|x64)$")
    # -m32 builds keep the host CMAKE_SYSTEM_PROCESSOR; pointer size tells
    # the actual target width.
    if (CMAKE_SIZEOF_VOID_P EQUAL 4)
        set(_proc "x86")
    else()
        set(_proc "x64")
    endif()
elseif (_proc MATCHES "^(i[3-6]86|x86|win32)$")
    set(_proc "x86")
elseif (_proc MATCHES "^(aarch64|arm64)$")
    set(_proc "arm64")
endif()

set(_scl_toolchain "${CMAKE_SYSTEM_NAME}-${CMAKE_CXX_COMPILER_ID}.${CMAKE_CXX_COMPILER_VERSION}-${_proc}")
# STREQUAL "" rather than `if (SCL_BUILD_VARIANT)`: CMake's if() treats
# "0"/"OFF"/"NO" as false too, which would silently drop a variant tag
# literally named that.
if (NOT SCL_BUILD_VARIANT STREQUAL "")
    string(APPEND _scl_toolchain "-${SCL_BUILD_VARIANT}")
endif()
# FORCE: reconfiguring an existing tree with a different compiler, arch, or
# SCL_BUILD_VARIANT must update the triplet — a plain CACHE set is a no-op once
# the cache entry already exists, silently keeping the stale directory layout.
set(SCL_TOOLCHAIN "${_scl_toolchain}" CACHE STRING "Toolchain triplet used for output directory layout" FORCE)

set(SCL_TARGET_BASE_DIR "${PROJECT_SOURCE_DIR}/bin/${SCL_TOOLCHAIN}" CACHE PATH "Base dir for target outputs" FORCE)

# Plain directory-scoped variables, applied only when scl-kit is the top-level
# project: an embedding consumer keeps its own output layout and cache.
if (PROJECT_IS_TOP_LEVEL)
    if (DEFINED CMAKE_BUILD_TYPE AND NOT CMAKE_BUILD_TYPE STREQUAL "")
        set(_cfg "${CMAKE_BUILD_TYPE}")
    else()
        set(_cfg "Debug")
    endif()

    # Single-config generators
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${SCL_TARGET_BASE_DIR}/${_cfg}")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${SCL_TARGET_BASE_DIR}/${_cfg}")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${SCL_TARGET_BASE_DIR}/${_cfg}")

    # Multi-config generators
    foreach(conf IN ITEMS Debug Release RelWithDebInfo MinSizeRel)
        string(TOUPPER "${conf}" CONFU)
        set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${CONFU} "${SCL_TARGET_BASE_DIR}/${conf}")
        set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${CONFU} "${SCL_TARGET_BASE_DIR}/${conf}")
        set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${CONFU} "${SCL_TARGET_BASE_DIR}/${conf}")
    endforeach()
endif()

# -----------------------------
# CTest in root so subdirs can register tests
# -----------------------------
if (SCL_BUILD_TESTS)
    include(CTest)
endif()

# -----------------------------
# Central project logic (routes to modules/examples/tests)
# -----------------------------
add_subdirectory(project/cmake)

# -----------------------------
# Install / Export package
# -----------------------------
if (SCL_INSTALL)
    include(CMakePackageConfigHelpers)

    # Install the HEADERS file sets from the interface targets into include/
    foreach(_module IN LISTS SCL_MODULES)
        install(TARGETS scl-${_module}
            EXPORT sclTargets
            FILE_SET HEADERS DESTINATION include
        )
    endforeach()

    # Exported targets with namespace scl::
    install(EXPORT sclTargets
        NAMESPACE scl::
        DESTINATION lib/cmake/scl
    )

    # Package config files. Lowercase "scl" so that the documented
    # find_package(scl ...) resolves sclConfig.cmake on case-sensitive
    # filesystems too.
    configure_package_config_file(
        ${SCL_ROOT_DIR}/project/cmake/SCLConfig.cmake.in
        ${CMAKE_CURRENT_BINARY_DIR}/sclConfig.cmake
        INSTALL_DESTINATION lib/cmake/scl
    )
    write_basic_package_version_file(
        ${CMAKE_CURRENT_BINARY_DIR}/sclConfigVersion.cmake
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion
    )
    install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/sclConfig.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/sclConfigVersion.cmake
        DESTINATION lib/cmake/scl
    )
endif()
