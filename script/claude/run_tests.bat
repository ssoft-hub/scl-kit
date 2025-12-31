@echo off
setlocal enabledelayedexpansion

:: ============================================================
:: SCL Toolkit — Run all compiled test executables
:: Usage: run_tests.bat [config]
::   config: Debug | Release  (default: Debug)
:: ============================================================

set CONFIG=%~1
if "%CONFIG%"=="" set CONFIG=Debug

:: Resolve project root (script lives in script/claude/)
set "SCL_ROOT=%~dp0..\.."
pushd "%SCL_ROOT%"
set "SCL_ROOT=%CD%"
popd

:: MinGW DLLs needed in PATH
set MINGW_DIR=D:\Tool\Qt\Tools\mingw1310_64\bin
set PATH=%MINGW_DIR%;%PATH%

set TOTAL=0
set ERRORS=0

:: --- MinGW tests ---
for /d %%d in ("%SCL_ROOT%\bin\Windows-GNU*") do (
    echo.
    echo ============================================================
    echo  MinGW Tests [%%~nxd] — %CONFIG%
    echo ============================================================
    for %%f in ("%%d\%CONFIG%\*_gtest.exe") do (
        echo --- %%~nxf ---
        "%%f"
        if errorlevel 1 ( set /a ERRORS+=1 )
        set /a TOTAL+=1
    )
)

:: --- MSVC tests ---
for /d %%d in ("%SCL_ROOT%\bin\Windows-MSVC*") do (
    echo.
    echo ============================================================
    echo  MSVC Tests [%%~nxd] — %CONFIG%
    echo ============================================================
    for %%f in ("%%d\%CONFIG%\*_gtest.exe") do (
        echo --- %%~nxf ---
        "%%f"
        if errorlevel 1 ( set /a ERRORS+=1 )
        set /a TOTAL+=1
    )
)

:: --- Clang tests ---
for /d %%d in ("%SCL_ROOT%\bin\Windows-Clang*") do (
    echo.
    echo ============================================================
    echo  Clang Tests [%%~nxd] — %CONFIG%
    echo ============================================================
    for %%f in ("%%d\%CONFIG%\*_gtest.exe") do (
        echo --- %%~nxf ---
        "%%f"
        if errorlevel 1 ( set /a ERRORS+=1 )
        set /a TOTAL+=1
    )
)

echo.
if !TOTAL!==0 (
    echo === NO TEST EXECUTABLES FOUND ===
    exit /b 1
) else if !ERRORS! GTR 0 (
    echo === !ERRORS! of !TOTAL! TEST SUITE^(S^) FAILED ===
    exit /b 1
) else (
    echo === ALL !TOTAL! TEST SUITE^(S^) PASSED ===
    exit /b 0
)
