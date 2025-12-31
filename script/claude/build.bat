@echo off
setlocal enabledelayedexpansion

:: ============================================================
:: SCL Toolkit — Multi-compiler build script
:: Usage: build.bat [compiler] [config] [target]
::   compiler: msvc | mingw | clang | all  (default: all)
::   config:   Debug | Release             (default: Debug)
::   target:   build | test | rebuild      (default: build)
:: ============================================================

set COMPILER=%~1
set CONFIG=%~2
set TARGET=%~3

if "%COMPILER%"=="" set COMPILER=all
if "%CONFIG%"==""   set CONFIG=Debug
if "%TARGET%"==""   set TARGET=build

:: Resolve project root (script lives in script/claude/)
set "SCL_ROOT=%~dp0..\.."
pushd "%SCL_ROOT%"
set "SCL_ROOT=%CD%"
popd

:: --- Tool paths (edit these for your machine) ---
set CMAKE_EXE=D:\Tool\Qt\Tools\CMake_64\bin\cmake.exe
set NINJA_EXE=D:\Tool\Qt\Tools\Ninja\ninja.exe
set MINGW_DIR=D:\Tool\Qt\Tools\mingw1310_64\bin
set VCVARSALL=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat
:: ------------------------------------------------

set ERRORS=0

if /I "%COMPILER%"=="all" (
    call :build_mingw
    call :build_msvc
    call :build_clang
) else if /I "%COMPILER%"=="msvc" (
    call :build_msvc
) else if /I "%COMPILER%"=="mingw" (
    call :build_mingw
) else if /I "%COMPILER%"=="clang" (
    call :build_clang
) else (
    echo Unknown compiler: %COMPILER%
    echo Usage: build.bat [msvc^|mingw^|clang^|all] [Debug^|Release] [build^|test^|rebuild]
    exit /b 1
)

if !ERRORS! GTR 0 (
    echo.
    echo === FINISHED WITH !ERRORS! ERROR^(S^) ===
    exit /b 1
) else (
    echo.
    echo === ALL FINISHED SUCCESSFULLY ===
    exit /b 0
)

:: ============================================================
:: MinGW GCC
:: ============================================================
:build_mingw
if not exist "%MINGW_DIR%\g++.exe" (
    echo [SKIP] MinGW not found at %MINGW_DIR%
    goto :eof
)
echo.
echo ============================================================
echo  MinGW GCC — %CONFIG%
echo ============================================================

set BUILD_DIR=%SCL_ROOT%\build\mingw
if /I "%TARGET%"=="rebuild" ( if exist "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%" )

"%CMAKE_EXE%" -B "%BUILD_DIR%" -S "%SCL_ROOT%" -G Ninja -DCMAKE_BUILD_TYPE=%CONFIG% -DCMAKE_MAKE_PROGRAM="%NINJA_EXE%" -DCMAKE_CXX_COMPILER="%MINGW_DIR%\g++.exe" -DCMAKE_C_COMPILER="%MINGW_DIR%\gcc.exe"
if errorlevel 1 ( set /a ERRORS+=1 & goto :eof )

"%CMAKE_EXE%" --build "%BUILD_DIR%" --config %CONFIG%
if errorlevel 1 ( set /a ERRORS+=1 & goto :eof )

if /I "%TARGET%"=="test" call :run_tests_mingw
goto :eof

:: ============================================================
:: MSVC
:: ============================================================
:build_msvc
if not exist "%VCVARSALL%" (
    echo [SKIP] MSVC not found — vcvarsall.bat missing
    goto :eof
)
echo.
echo ============================================================
echo  MSVC — %CONFIG%
echo ============================================================

set BUILD_DIR=%SCL_ROOT%\build\msvc
if /I "%TARGET%"=="rebuild" ( if exist "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%" )

call "%VCVARSALL%" x64 >nul 2>&1

"%CMAKE_EXE%" -B "%BUILD_DIR%" -S "%SCL_ROOT%" -G Ninja -DCMAKE_BUILD_TYPE=%CONFIG% -DCMAKE_MAKE_PROGRAM="%NINJA_EXE%"
if errorlevel 1 ( set /a ERRORS+=1 & goto :eof )

"%CMAKE_EXE%" --build "%BUILD_DIR%" --config %CONFIG%
if errorlevel 1 ( set /a ERRORS+=1 & goto :eof )

if /I "%TARGET%"=="test" call :run_tests "%BUILD_DIR%"
goto :eof

:: ============================================================
:: Clang (standalone)
:: ============================================================
:build_clang
set CLANGXX=
if exist "C:\Program Files\LLVM\bin\clang++.exe" (
    set "CLANGXX=C:\Program Files\LLVM\bin\clang++.exe"
    set "CLANGCC=C:\Program Files\LLVM\bin\clang.exe"
)
if "%CLANGXX%"=="" (
    echo [SKIP] Clang not found
    goto :eof
)
echo.
echo ============================================================
echo  Clang — %CONFIG%
echo ============================================================

set BUILD_DIR=%SCL_ROOT%\build\clang
if /I "%TARGET%"=="rebuild" ( if exist "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%" )

"%CMAKE_EXE%" -B "%BUILD_DIR%" -S "%SCL_ROOT%" -G Ninja -DCMAKE_BUILD_TYPE=%CONFIG% -DCMAKE_MAKE_PROGRAM="%NINJA_EXE%" -DCMAKE_CXX_COMPILER="%CLANGXX%" -DCMAKE_C_COMPILER="%CLANGCC%"
if errorlevel 1 ( set /a ERRORS+=1 & goto :eof )

"%CMAKE_EXE%" --build "%BUILD_DIR%" --config %CONFIG%
if errorlevel 1 ( set /a ERRORS+=1 & goto :eof )

if /I "%TARGET%"=="test" call :run_tests "%BUILD_DIR%"
goto :eof

:: ============================================================
:: Run tests (CTest)
:: ============================================================
:run_tests
echo.
echo --- Running tests ---
"%CMAKE_EXE%" --build "%~1" --target test 2>nul
if errorlevel 1 (
    ctest --test-dir "%~1" --build-config %CONFIG% --output-on-failure
)
if errorlevel 1 set /a ERRORS+=1
goto :eof

:: ============================================================
:: Run tests for MinGW (needs DLLs in PATH)
:: ============================================================
:run_tests_mingw
echo.
echo --- Running MinGW tests ---
set PATH=%MINGW_DIR%;%PATH%
for /d %%d in ("%SCL_ROOT%\bin\Windows-GNU*") do (
    for %%f in ("%%d\%CONFIG%\*_gtest.exe") do (
        echo Running %%~nxf ...
        "%%f"
        if errorlevel 1 set /a ERRORS+=1
    )
)
goto :eof
