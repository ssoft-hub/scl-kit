# Унифицированный поиск тестовых фреймворков.
# Политика:
# 1) Пытаемся find_package (CONFIG).
# 2) Если не найдено, но есть подмодуль в 3rdparty — add_subdirectory.
# 3) В случае header-only (doctest), создаём импортированную INTERFACE цель, если нашли include.

include_guard(GLOBAL)

# ---- GoogleTest ----
set(GTEST_FOUND OFF)
if (SCL_ENABLE_GTEST)
    find_package(GTest QUIET CONFIG)
    if (NOT GTest_FOUND)
        if (EXISTS "${CMAKE_SOURCE_DIR}/3rdparty/googletest/CMakeLists.txt")
            message(STATUS "Using bundled googletest from 3rdparty.")
            add_subdirectory(${CMAKE_SOURCE_DIR}/3rdparty/googletest ${CMAKE_BINARY_DIR}/3rdparty/googletest)
            # После add_subdirectory цели gtest::gtest, gtest::gtest_main обычно доступны
            set(GTEST_FOUND ON)
        endif()
    else()
        set(GTEST_FOUND ON)
    endif()
endif()

# ---- doctest ----
set(DOCTEST_FOUND OFF)
if (SCL_ENABLE_DOCTEST)
    # Попробуем config-пакет
    find_package(doctest QUIET CONFIG)
    if (TARGET doctest::doctest)
        set(DOCTEST_FOUND ON)
    else()
        # Попробуем header-only подключение из 3rdparty
        set(_doctest_guess "${CMAKE_SOURCE_DIR}/3rdparty/doctest/doctest/doctest.h")
        if (EXISTS "${_doctest_guess}")
            add_library(doctest::doctest INTERFACE IMPORTED)
            set_target_properties(doctest::doctest PROPERTIES
                INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_SOURCE_DIR}/3rdparty/doctest"
            )
            message(STATUS "Using header-only doctest from 3rdparty (created doctest::doctest).")
            set(DOCTEST_FOUND ON)
        endif()
    endif()
endif()

# ---- Catch2 ----
set(CATCH2_FOUND OFF)
if (SCL_ENABLE_CATCH2)
    # Сначала v3 (предпочтительнее)
    find_package(Catch2 3 QUIET CONFIG)
    if (TARGET Catch2::Catch2WithMain)
        set(CATCH2_FOUND ON)
    else()
        # Попробуем v2 (будет другой таргет)
        find_package(Catch2 2 QUIET CONFIG)
        if (TARGET Catch2::Catch2)
            # В v2 нет Catch2WithMain, но есть источник main, который можно подключить отдельно.
            set(CATCH2_FOUND ON)
        else()
            # Fallback на подмодуль
            if (EXISTS "${CMAKE_SOURCE_DIR}/3rdparty/Catch2/CMakeLists.txt")
                message(STATUS "Using bundled Catch2 from 3rdparty.")
                add_subdirectory(${CMAKE_SOURCE_DIR}/3rdparty/Catch2 ${CMAKE_BINARY_DIR}/3rdparty/Catch2)
                # У репозитория v3 после add_subdirectory есть Catch2::Catch2 и Catch2::Catch2WithMain
                if (TARGET Catch2::Catch2WithMain OR TARGET Catch2::Catch2)
                    set(CATCH2_FOUND ON)
                endif()
            endif()
        endif()
    endif()
endif()
