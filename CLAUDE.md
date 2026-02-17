# ScL Toolkit — Developer Notes

## Project Overview
C++20 header-only toolkit (utility, feature, event modules). License: Unlicense.
Must build with MSVC, MinGW, GCC, Clang (whichever are available).

## Build Toolchain (Windows)
Tools located in `D:\Tool\Qt\Tools\`:
- **CMake**: `D:/Tool/Qt/Tools/CMake_64/bin/cmake.exe`
- **Ninja**: `D:/Tool/Qt/Tools/Ninja/ninja.exe`
- **MinGW GCC 13.1**: `D:/Tool/Qt/Tools/mingw1310_64/bin/g++.exe` / `gcc.exe`
- **MSVC**: via `vcvarsall.bat` at `C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat`
- **Clang**: `C:\Program Files\LLVM\bin\clang++.exe` (if installed)

## Build & Test (quick reference)
Scripts are in `script/claude/`. Tool paths are configured at the top of each script.

### Build (all available compilers)
```bash
cmd //c "script\claude\build.bat all Debug build"
```

### Build (specific compiler)
```bash
cmd //c "script\claude\build.bat mingw Debug build"
cmd //c "script\claude\build.bat msvc Debug build"
cmd //c "script\claude\build.bat clang Debug build"
```

### Rebuild from scratch
```bash
cmd //c "script\claude\build.bat all Debug rebuild"
```

### Run tests
```bash
cmd //c "script\claude\run_tests.bat Debug"
```

Build dirs: `build/mingw/`, `build/msvc/`, `build/clang/`

### Manual single-compiler build (bash, MinGW only)
```bash
CMAKE="D:/Tool/Qt/Tools/CMake_64/bin/cmake.exe"
NINJA="D:/Tool/Qt/Tools/Ninja/ninja.exe"
"$CMAKE" -B build/mingw -S . -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_MAKE_PROGRAM="$NINJA" -DCMAKE_CXX_COMPILER="D:/Tool/Qt/Tools/mingw1310_64/bin/g++.exe" -DCMAKE_C_COMPILER="D:/Tool/Qt/Tools/mingw1310_64/bin/gcc.exe"
"$CMAKE" --build build/mingw
```
Note: MSVC requires vcvarsall.bat — use `script/claude/build.bat msvc` instead.

## Output Directory
Binaries: `bin/{TOOLCHAIN}/{CONFIG}/`
- MinGW: `bin/Windows-GNU.13.1.0-x64/Debug/`
- MSVC: `bin/Windows-MSVC.19.32.31328.0-x64/Debug/`

## Known build issue
`gtest_discover_tests` fails for MinGW builds because it tries to run the exe at build time without MinGW DLLs in PATH. Tests themselves work fine — run them via `script/claude/run_tests.bat`.

## Test Naming Convention
- `*gtest.cpp` — GoogleTest (linked with `GTest::gtest_main`)
- `*doctest.cpp` — doctest
- `*catch2.cpp` — Catch2

## CMake Options
| Option | Default | Description |
|--------|---------|-------------|
| SCL_BUILD_EXAMPLES | ON | Build examples |
| SCL_BUILD_TESTS | ON | Build tests |
| SCL_ENABLE_GTEST | ON | Enable GoogleTest |
| SCL_ENABLE_DOCTEST | ON | Enable doctest |
| SCL_ENABLE_CATCH2 | ON | Enable Catch2 |

## Module Structure
- `module/utility/` — meta, preprocessor, type_traits (no deps)
- `module/feature/` — wrappers, thread safety, reflection (depends on utility)
- `module/event/` — event system (C++17, independent)
- `module/scene/` — placeholder

## Key Architectural Notes
- Header-only INTERFACE targets: `scl::utility`, `scl::feature`
- Tests auto-discovered from `module/*/test/` subdirectories
- Examples auto-discovered from `module/*/example/` subdirectories
- Git submodules for each module (separate repos)
- 3rdparty: GoogleTest (bundled), doctest (bundled header-only), Catch2 (system or bundled)
