# Contributing to ScL Toolkit

Thank you for your interest in contributing to the ScL Toolkit!

## Repository structure

ScL Toolkit is a super-project that aggregates independent modules as git
submodules:

```
scl-kit/                # super-project (this repository)
├── module/             # functional modules, each an independent git submodule
├── 3rdparty/           # bundled third-party dependencies (read-only)
└── script/             # build, test, and maintenance scripts
```

Each module is a separate git repository with its own history, tests, and
contribution guidelines.

## Building

The super-project uses CMake (3.23+) and a C++20 compiler. Clone with
submodules, then configure and build:

```sh
git clone --recurse-submodules <repository-url>
cd scl-kit
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build --parallel
ctest --test-dir build --output-on-failure
```

### Presets

The shipped `CMakePresets.json` is consumed both by IDEs (VS Code, Visual
Studio, Qt Creator, CLion) and by the convenience scripts, so an IDE and a
script that pick the same preset share the **same** build tree.

The build tree is keyed by **compiler + architecture** — `build/<preset>/` —
so different compilers land in different sub-directories while the same
compiler always reuses one tree, no matter what drove the build. The preset
name cannot carry the compiler *version* (CMake only learns it after
configuring); the full version and architecture instead appear on the
artifacts under `bin/<OS>-<Compiler>.<Version>-<arch>/<config>/`.

Presets are gated by host OS, so each machine only sees the ones it can drive
(Windows sees the `clang`/`gcc`/`msvc` presets, macOS sees the `macos` presets).

The compiler itself is picked up from `PATH`: the presets name it by bare
name (`g++`, `clang`...), and CMake resolves that to a full path on the first
configure and caches it. From then on the tree sticks to that install —
later `PATH` changes do not leak another compiler into an existing tree.

### Independent builds — compilers, versions, options, OSes

Four axes can vary between builds, and each is isolated differently:

- **Different operating systems** — free, no setup. Presets are gated by
  `hostSystemName`, so each machine only ever sees the presets it can drive
  (Windows sees `clang-*`/`gcc-*`/`msvc-*`, Linux sees `clang-*`/`gcc-*`,
  macOS sees `macos-*`). Every preset already has its own `build/<preset>/`
  and `bin/<toolchain>/`, so there is nothing to collide across OSes.

- **Different compiler families on the same OS** — also free. `gcc-x64` and
  `clang-x64` are separate presets, hence separate `build/` trees and
  `bin/<toolchain>/` outputs (the triplet encodes the compiler ID). Just
  build both presets; they never touch each other's files.

- **Different versions of the *same* compiler** (e.g. GCC 12 vs. GCC 13) —
  needs one extra step. A shipped preset name only encodes compiler family +
  architecture, not version (CMake only learns the version after
  configuring), so two installs of the same family share one preset name and
  would reconfigure the same tree. Fix: add a preset to
  **[`CMakeUserPresets.json`](project/cmake/CMakeUserPresets.json.example)**
  (git-ignored, machine-local — copy the example into the repository root as
  `CMakeUserPresets.json` and adjust the paths for your machine) that
  inherits a shipped preset and pins the compiler by absolute path:

  ```json
  {
      "version": 4,
      "configurePresets": [
          {
              "name": "gcc-12-x64",
              "inherits": "gcc-x64",
              "cacheVariables": {
                  "CMAKE_C_COMPILER": "/usr/bin/gcc-12",
                  "CMAKE_CXX_COMPILER": "/usr/bin/g++-12"
              }
          }
      ]
  }
  ```

  The new preset name gives it its own `build/gcc-12-x64` tree, independent
  of `build/gcc-x64`. The same trick works for pinning a specific Clang/MSVC
  install instead of whatever bare `clang`/`cl` resolves to on `PATH`.

- **Different options, same compiler and version** (e.g. tests on vs. off) —
  two levels of isolation, pick what you need:

  - *Output only* — set `-DSCL_BUILD_VARIANT=<tag>` at configure time. It is
    appended to the toolchain triplet, so
    `cmake --preset gcc-x64 -DSCL_BUILD_VARIANT=notests -DSCL_BUILD_TESTS=OFF`
    builds into `bin/<toolchain>-notests/` instead of colliding with the
    default `bin/<toolchain>/`. The `build/gcc-x64` cache itself is still
    shared between the plain and `-notests` runs, so only one of them can be
    configured at a time.
  - *Output and build tree* — give the option set its own preset name in
    `CMakeUserPresets.json` too (see
    [`CMakeUserPresets.json.example`](project/cmake/CMakeUserPresets.json.example)),
    setting `SCL_BUILD_VARIANT` and the differing options as `cacheVariables`.
    Both variants then have independent `build/<preset>` trees and can stay
    configured side by side.

These compose: a `CMakeUserPresets.json` preset can pin both a compiler
version *and* a variant tag in the same entry if you need both axes isolated
at once.

| Preset | Host | Build tree | Notes |
|--------|------|------------|-------|
| `default` | any | `build/default` | Portable single-config Debug |
| `clang-x64` / `gcc-x64` | Windows, Linux | `build/{clang,gcc}-x64` | Native 64-bit |
| `clang-x86` / `gcc-x86` | Windows, Linux | `build/{clang,gcc}-x86` | 32-bit; needs 32-bit libs/multilib |
| `clang-arm64` / `gcc-arm64` | Windows, Linux | `build/{clang,gcc}-arm64` | Cross; need `-DSCL_SYSROOT=<path>` (build-only) |
| `msvc-x64-2022` / `msvc-x86-2022` | Windows | `build/msvc-{x64,x86}-2022` | Native, via Visual Studio 2022 |
| `msvc-x64-2026` / `msvc-x86-2026` | Windows | `build/msvc-{x64,x86}-2026` | Native, via Visual Studio 2026 |
| `msvc-arm64-2022` / `msvc-arm64-2026` | Windows | `build/msvc-arm64-{2022,2026}` | Cross on an x64 host (build-only) |
| `macos-arm64` / `macos-x64` | macOS | `build/macos-{arm64,x64}` | AppleClang, single arch |
| `macos-universal` | macOS | `build/macos-universal` | AppleClang, universal binary |
| `osxcross-arm64` / `-x64` / `-universal` | Linux, WSL | `build/osxcross-*` | Cross to Darwin via osxcross; needs `osxcross-conf` on `PATH` (build-only) |

```sh
cmake --preset clang-x64
cmake --build --preset clang-x64 --config Debug
ctest  --preset clang-x64 --build-config Debug
```

The convenience scripts wrap the same presets for local use and CI:

```sh
script/ci/build.sh clang-x64 Debug       # cmake --preset + --build --preset
script/ci/run_tests.sh clang-x64 Debug   # ctest --preset
```

All the scripts default to the `default` preset when no argument is given.

Benchmarks are off by default and have no preset of their own: every preset names a
toolchain, and "build the benchmarks" is a separate axis, so the options go to whichever
preset you want to measure. A benchmark is not a CTest test, so it has its own runner:

```sh
script/ci/build.sh clang-x64 Release -DSCL_BUILD_BENCHMARKS=ON -DSCL_BUILD_TESTS=OFF
script/ci/run_benchmarks.sh clang-x64    # runs every *_gbench in the build tree
```

`run_benchmarks.sh` defaults to `Release` rather than `Debug`, and fixes the repetition
count, so two runs of a suite are directly comparable — which is what a before/after
figure quoted in an issue or MR has to be.

Build artifacts are written under `bin/<toolchain-triplet>/` and are ignored by
git. Useful CMake options:

| Option | Default | Effect |
|--------|---------|--------|
| `SCL_BUILD_TESTS` | `ON` | Build and register the module tests |
| `SCL_BUILD_EXAMPLES` | `ON` | Build the module examples |
| `SCL_BUILD_BENCHMARKS` | `OFF` | Build the module benchmarks |
| `SCL_INSTALL` | `ON` | Generate the install/export package (`find_package(scl)`) |
| `SCL_ENABLE_GTEST` / `SCL_ENABLE_DOCTEST` / `SCL_ENABLE_CATCH2` | `ON` | Toggle a test framework |
| `SCL_ENABLE_GBENCH` | `ON` | Toggle Google Benchmark |

Consuming the installed package from another CMake project:

```cmake
find_package(scl CONFIG REQUIRED COMPONENTS utility feature)
target_link_libraries(app PRIVATE scl::utility scl::feature)
```

## How to contribute

### 1. Choose where to work

Most changes belong to a specific module and follow that module's own
guidelines. Super-project changes — such as the build system, tooling, and
submodule pins — are made in this repository.

### 2. Development workflow

1. Create a topic branch off `dev`.
2. Make focused changes following the relevant code style.
3. Build and run the tests locally before pushing.
4. Commit using Conventional Commits (`feat:`, `fix:`, `docs:`, …).
5. Open a merge request targeting `dev`.

### 3. Merge request guidelines

- Target the `dev` branch, not `main`.
- Keep one logical change per merge request; keep commits focused and atomic.
- Update the relevant documentation.

## Agent and automation instructions

Instructions for automated contributors are described in [AGENTS.md](AGENTS.md).

## Questions?

Open an issue in this repository or in the relevant module repository.
