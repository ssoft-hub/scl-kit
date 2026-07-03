# Unified discovery for test frameworks.
# Policy:
# 1) Try find_package (CONFIG mode).
# 2) If not found, fallback to in-tree 3rdparty submodules (add_subdirectory).
# 3) For header-only (doctest) create an imported INTERFACE target if only include is available.

include_guard(GLOBAL)

# -----------------------------
# GoogleTest
# -----------------------------
set(GTEST_FOUND FALSE)
if (SCL_ENABLE_GTEST)
    find_package(GTest QUIET CONFIG)
    if (GTest_FOUND)
        set(GTEST_FOUND TRUE)
    else()
        if (EXISTS "${PROJECT_SOURCE_DIR}/3rdparty/googletest/CMakeLists.txt")
            message(STATUS "Using bundled GoogleTest from 3rdparty.")
            # The bundled copy is a test-only dependency: no gmock (nothing
            # here links it), no install rules leaking into the scl package,
            # and no participation in the default build beyond test targets.
            # FORCE: a plain CACHE set is a no-op if the variable is already
            # cached (e.g. a stale tree from before this fix, or a user -D),
            # silently keeping gmock/install-rules enabled.
            set(BUILD_GMOCK OFF CACHE BOOL "Builds the googlemock subproject" FORCE)
            set(INSTALL_GTEST OFF CACHE BOOL "Enable installation of googletest" FORCE)
            add_subdirectory(${PROJECT_SOURCE_DIR}/3rdparty/googletest ${PROJECT_BINARY_DIR}/3rdparty/googletest EXCLUDE_FROM_ALL)
            # gtest::gtest and gtest::gtest_main targets are usually provided
            set(GTEST_FOUND TRUE)
        endif()
    endif()
endif()

# -----------------------------
# doctest
# -----------------------------
set(DOCTEST_FOUND FALSE)
if (SCL_ENABLE_DOCTEST)
    find_package(doctest QUIET CONFIG) # Prefer a config package if available
    if (TARGET doctest::doctest)
        set(DOCTEST_FOUND TRUE)
    else()
        # Header-only fallback: detect doctest header in 3rdparty
        set(_doctest_guess "${PROJECT_SOURCE_DIR}/3rdparty/doctest/doctest/doctest.h")
        if (EXISTS "${_doctest_guess}")
            add_library(doctest::doctest INTERFACE IMPORTED)
            set_target_properties(doctest::doctest PROPERTIES
                INTERFACE_INCLUDE_DIRECTORIES "${PROJECT_SOURCE_DIR}/3rdparty/doctest"
            )
            message(STATUS "Using header-only doctest from 3rdparty (created doctest::doctest).")
            set(DOCTEST_FOUND TRUE)
        endif()
    endif()
endif()

# -----------------------------
# Catch2
# -----------------------------
set(CATCH2_FOUND FALSE)
if (SCL_ENABLE_CATCH2)
    # First try v3 (preferred)
    find_package(Catch2 3 QUIET CONFIG)
    if (TARGET Catch2::Catch2WithMain)
        set(CATCH2_FOUND TRUE)
    else()
        # Try v2 fallback (different targets)
        find_package(Catch2 2 QUIET CONFIG)
        if (TARGET Catch2::Catch2)
            set(CATCH2_FOUND TRUE)
        else()
            # In-tree fallback
            if (EXISTS "${PROJECT_SOURCE_DIR}/3rdparty/Catch2/CMakeLists.txt")
                message(STATUS "Using bundled Catch2 from 3rdparty.")
                add_subdirectory(${PROJECT_SOURCE_DIR}/3rdparty/Catch2 ${PROJECT_BINARY_DIR}/3rdparty/Catch2 EXCLUDE_FROM_ALL)
                # After add_subdirectory, Catch2::Catch2 and/or Catch2::Catch2WithMain should exist
                if (TARGET Catch2::Catch2WithMain OR TARGET Catch2::Catch2)
                    set(CATCH2_FOUND TRUE)
                endif()
            endif()
        endif()
    endif()
endif()
