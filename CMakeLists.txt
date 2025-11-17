cmake_minimum_required(VERSION 3.20)

project(SCL
    VERSION 0.1.0
    LANGUAGES CXX
    DESCRIPTION "ScL C++ Toolkit"
)

# -----------------------------
# Global options
# -----------------------------
option(SCL_BUILD_EXAMPLES "Build examples" ON)
option(SCL_BUILD_TESTS    "Build tests"    ON)
option(SCL_INSTALL        "Enable install/export packaging" ON)

# Test framework toggles
option(SCL_ENABLE_GTEST   "Enable GoogleTest-based tests (if available)"   ON)
option(SCL_ENABLE_DOCTEST "Enable doctest-based tests (if available)"      ON)
option(SCL_ENABLE_CATCH2  "Enable Catch2-based tests (if available)"       ON)

# -----------------------------
# C++ standard and common settings
# -----------------------------
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(SCL_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}")

# -----------------------------
# Cross-compilation helpers (optional)
# -----------------------------
# Load cross-configuration helpers (safe for native builds too).
include(${CMAKE_CURRENT_SOURCE_DIR}/project/cmake/SCLCross.cmake OPTIONAL)

# -----------------------------
# One place building (unified output directories)
# -----------------------------
# Compose a toolchain "triplet": <OS>-<Compiler>.<Version>-<Arch>
# Examples:
#   Linux-GNU.13.2.0-x86_64
#   Windows-MSVC.19.41-x64
#   Darwin-AppleClang.15.0.0-arm64
set(_proc "${CMAKE_SYSTEM_PROCESSOR}")
if (WIN32 AND ("${_proc}" STREQUAL "AMD64" OR "${_proc}" STREQUAL "x64"))
    set(_proc "x64")
elseif("${_proc}" STREQUAL "x86_64")
    set(_proc "x86_64")
elseif("${_proc}" STREQUAL "aarch64")
    set(_proc "arm64")
endif()

set(SCL_TOOLCHAIN
    "${CMAKE_SYSTEM_NAME}-${CMAKE_CXX_COMPILER_ID}.${CMAKE_CXX_COMPILER_VERSION}-${_proc}"
    CACHE STRING "Toolchain triplet used for output directory layout"
)

set(SCL_BASE_DIR "${PROJECT_SOURCE_DIR}" CACHE PATH "Project source root" FORCE)
set(SCL_TARGET_BASE_DIR "${SCL_BASE_DIR}/bin/${SCL_TOOLCHAIN}" CACHE PATH "Base dir for target outputs")
set(SCL_BUILD_BASE_DIR  "${SCL_BASE_DIR}/build/${SCL_TOOLCHAIN}" CACHE PATH "Suggested base dir for build trees")

if (DEFINED CMAKE_BUILD_TYPE AND NOT CMAKE_BUILD_TYPE STREQUAL "")
    set(_cfg "${CMAKE_BUILD_TYPE}")
else()
    set(_cfg "Debug")
endif()

# Single-config generators
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${SCL_TARGET_BASE_DIR}/${_cfg}" CACHE PATH "Archive output dir" FORCE)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${SCL_TARGET_BASE_DIR}/${_cfg}" CACHE PATH "Library output dir" FORCE)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${SCL_TARGET_BASE_DIR}/${_cfg}" CACHE PATH "Runtime output dir" FORCE)

# Multi-config generators
foreach(conf IN ITEMS Debug Release RelWithDebInfo MinSizeRel)
    string(TOUPPER "${conf}" CONFU)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${CONFU} "${SCL_TARGET_BASE_DIR}/${conf}" CACHE PATH "" FORCE)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${CONFU} "${SCL_TARGET_BASE_DIR}/${conf}" CACHE PATH "" FORCE)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${CONFU} "${SCL_TARGET_BASE_DIR}/${conf}" CACHE PATH "" FORCE)
endforeach()

# Generator-expression friendly dirs (for custom properties if needed)
set(SCL_RUNTIME_DIR "$<IF:$<CONFIG:>,${SCL_TARGET_BASE_DIR}/$<CONFIG>,${SCL_TARGET_BASE_DIR}/${_cfg}>")
set(SCL_LIBRARY_DIR "${SCL_RUNTIME_DIR}")
set(SCL_ARCHIVE_DIR "${SCL_RUNTIME_DIR}")

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

    # CMake >= 3.23: install the HEADERS file sets from interface targets
    if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.23")
        install(TARGETS
            scl-utility
            scl-meta
            EXPORT SCLTargets
            # Install their FILE_SETs named HEADERS into include/
            FILE_SET HEADERS DESTINATION include
        )
    else()
        # Fallback for older CMake: install headers by directory
        install(DIRECTORY
            ${SCL_ROOT_DIR}/module/utility/include/
            DESTINATION include
            FILES_MATCHING
                PATTERN "*.h" PATTERN "*.hpp" PATTERN "*.hh" PATTERN "*.hxx" PATTERN "*.inl"
        )
        install(DIRECTORY
            ${SCL_ROOT_DIR}/module/meta/include/
            DESTINATION include
            FILES_MATCHING
                PATTERN "*.h" PATTERN "*.hpp" PATTERN "*.hh" PATTERN "*.hxx" PATTERN "*.inl"
        )

        # Export targets
        install(TARGETS
            SCL_utility
            SCL_meta
            EXPORT SCLTargets
        )
    endif()

    # Exported targets with namespace SCL::
    install(EXPORT SCLTargets
        NAMESPACE SCL::
        DESTINATION lib/cmake/SCL
    )

    # Package config files
    configure_package_config_file(
        ${SCL_ROOT_DIR}/project/cmake/SCLConfig.cmake.in
        ${CMAKE_CURRENT_BINARY_DIR}/SCLConfig.cmake
        INSTALL_DESTINATION lib/cmake/SCL
    )
    write_basic_package_version_file(
        ${CMAKE_CURRENT_BINARY_DIR}/SCLConfigVersion.cmake
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion
    )
    install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/SCLConfig.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/SCLConfigVersion.cmake
        DESTINATION lib/cmake/SCL
    )
endif()
