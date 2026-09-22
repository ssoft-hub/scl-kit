# 3.23: FILE_SET HEADERS install and CMakePresets.json v4 both require it.
cmake_minimum_required(VERSION 3.23)

project(ScL
    VERSION 0.0.0
    LANGUAGES CXX
    DESCRIPTION "ScL C++ Toolkit"
)

# Order matters: a dependency is listed before its dependents.
set(SCL_MODULES utility feature)

# OFF for an embedding consumer, which wants the scl targets alone.
option(SCL_BUILD_EXAMPLES "Build examples" ${PROJECT_IS_TOP_LEVEL})
option(SCL_BUILD_TESTS    "Build tests"    ${PROJECT_IS_TOP_LEVEL})
option(SCL_INSTALL        "Enable install/export packaging" ${PROJECT_IS_TOP_LEVEL})

# Off even at top level: a run is long and means nothing outside Release.
option(SCL_BUILD_BENCHMARKS "Build benchmarks" OFF)

option(SCL_ENABLE_GTEST   "Enable GoogleTest-based tests (if available)"   ON)
option(SCL_ENABLE_DOCTEST "Enable doctest-based tests (if available)"      ON)
option(SCL_ENABLE_CATCH2  "Enable Catch2-based tests (if available)"       ON)

option(SCL_ENABLE_GBENCH  "Enable Google Benchmark based benchmarks (if available)" ON)

option(SCL_ENABLE_RTTI       "Compile with RTTI"       ON)
option(SCL_ENABLE_EXCEPTIONS "Compile with exceptions" ON)

set(SCL_BUILD_VARIANT "" CACHE STRING "Suffix appended to the toolchain triplet, after the one composed from the options above")

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# macOS exposes some libc facilities only under the GNU dialect.
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(SCL_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}")

if (NOT SCL_ENABLE_RTTI)
    if (MSVC)
        string(REGEX REPLACE "(^| )[-/]GR-?( |$)" " " CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
        add_compile_options($<$<COMPILE_LANGUAGE:CXX>:/GR->)
    else()
        add_compile_options($<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>)
    endif()
endif()

if (NOT SCL_ENABLE_EXCEPTIONS)
    if (MSVC)
        string(REGEX REPLACE "(^| )[-/]EHs?c?-?( |$)" " " CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
        add_compile_options($<$<COMPILE_LANGUAGE:CXX>:/EHs-c->)
        add_compile_definitions($<$<COMPILE_LANGUAGE:CXX>:_HAS_EXCEPTIONS=0>)
    else()
        add_compile_options($<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>)
    endif()
endif()

# The arch component describes the target: CMAKE_SYSTEM_PROCESSOR reports the
# host for a VS -A, an -m32 and a CMAKE_OSX_ARCHITECTURES build alike.
if (CMAKE_OSX_ARCHITECTURES)
    string(REPLACE ";" "+" _proc "${CMAKE_OSX_ARCHITECTURES}")
elseif (CMAKE_GENERATOR_PLATFORM)
    set(_proc "${CMAKE_GENERATOR_PLATFORM}")
else()
    set(_proc "${CMAKE_SYSTEM_PROCESSOR}")
endif()

string(TOLOWER "${_proc}" _proc)
if (_proc MATCHES "^(amd64|x86_64|x64)$")
    # An -m32 build keeps the host processor; the pointer size tells the width.
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
set(_scl_variant "")
if (NOT SCL_ENABLE_RTTI)
    list(APPEND _scl_variant "nortti")
endif()
if (NOT SCL_ENABLE_EXCEPTIONS)
    list(APPEND _scl_variant "noexc")
endif()
if (SCL_BUILD_BENCHMARKS)
    list(APPEND _scl_variant "bench")
endif()
foreach(_part IN LISTS _scl_variant)
    string(APPEND _scl_toolchain "-${_part}")
endforeach()
# STREQUAL "": if() reads "0", "OFF" and "NO" as false and would drop such a tag.
if (NOT SCL_BUILD_VARIANT STREQUAL "")
    string(APPEND _scl_toolchain "-${SCL_BUILD_VARIANT}")
endif()
# FORCE: a plain CACHE set is a no-op once the entry exists, keeping a stale tag.
set(SCL_TOOLCHAIN "${_scl_toolchain}" CACHE STRING "Toolchain triplet used for output directory layout" FORCE)

set(SCL_TARGET_BASE_DIR "${PROJECT_SOURCE_DIR}/bin/${SCL_TOOLCHAIN}" CACHE PATH "Base dir for target outputs" FORCE)

# Top level only: an embedding consumer keeps its own output layout.
if (PROJECT_IS_TOP_LEVEL)
    if (DEFINED CMAKE_BUILD_TYPE AND NOT CMAKE_BUILD_TYPE STREQUAL "")
        set(_cfg "${CMAKE_BUILD_TYPE}")
    else()
        set(_cfg "Debug")
    endif()

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${SCL_TARGET_BASE_DIR}/${_cfg}")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${SCL_TARGET_BASE_DIR}/${_cfg}")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${SCL_TARGET_BASE_DIR}/${_cfg}")

    foreach(conf IN ITEMS Debug Release RelWithDebInfo MinSizeRel)
        string(TOUPPER "${conf}" CONFU)
        set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${CONFU} "${SCL_TARGET_BASE_DIR}/${conf}")
        set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${CONFU} "${SCL_TARGET_BASE_DIR}/${conf}")
        set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${CONFU} "${SCL_TARGET_BASE_DIR}/${conf}")
    endforeach()
endif()

# clangd searches the source tree, which CMAKE_EXPORT_COMPILE_COMMANDS does not
# write to. A no-op where the generator produces no database at all.
if (PROJECT_IS_TOP_LEVEL)
    add_custom_target(mirror_compile_commands ALL
        COMMAND ${CMAKE_COMMAND}
            "-DSRC=${CMAKE_BINARY_DIR}/compile_commands.json"
            "-DDST=${CMAKE_SOURCE_DIR}/compile_commands.json"
            -P "${CMAKE_SOURCE_DIR}/project/cmake/MirrorCompileCommands.cmake"
        COMMENT "Mirroring compile_commands.json to source root for clangd"
        VERBATIM
    )
endif()

if (SCL_BUILD_TESTS)
    include(CTest)
endif()

add_subdirectory(project/cmake)

if (SCL_INSTALL)
    include(CMakePackageConfigHelpers)

    foreach(_module IN LISTS SCL_MODULES)
        install(TARGETS scl-${_module}
            EXPORT sclTargets
            FILE_SET HEADERS DESTINATION include
        )
    endforeach()

    install(EXPORT sclTargets
        NAMESPACE scl::
        DESTINATION lib/cmake/scl
    )

    # Lowercase "scl": find_package(scl) must resolve on a case-sensitive filesystem.
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
