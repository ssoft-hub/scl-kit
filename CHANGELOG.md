# Changelog

All notable changes to the ScL Toolkit super-project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed
- The cached `HAVE_STD_REGEX` probe that keeps Google Benchmark from configuring
  is documented.
- The macOS job builds with a pinned Homebrew LLVM, the bundled Xcode clang having
  crashed on it.
- The `msvc-*` presets build in parallel again, `/MP` reaching the compiler through the
  preset.
- `ctest --preset <name>` runs without `-C`, the test presets defaulting to `Debug`.

### Added
- `SCL_ENABLE_RTTI` and `SCL_ENABLE_EXCEPTIONS` options, both `ON`.
- `--no-rtti`, `--no-exceptions` and `--benchmarks` on the `script/ci/` helpers, each
  isolated.
- Google Benchmark under `3rdparty/benchmark`, behind `SCL_BUILD_BENCHMARKS`, off by
  default.
- `script/ci/run_benchmarks.sh`, which fixes the repetition count and keeps each run
  as JSON.
- An `arm-none-eabi` preset and toolchain file, cross-compiling to bare metal to
  measure code size.
- `script/ci/run_size.sh`, reporting the `.text` figure of a bare-metal build.
- Project skeleton: README, license, contribution guide, changelog, ignore rules,
  `AGENTS.md`.
- Git submodules wiring the `utility` and `feature` modules, `googletest` and
  `doctest`.
- A CMake build aggregating the modules, their tests and examples, installable as a
  package.
- `script/ci/build.sh` and `script/ci/run_tests.sh` for building and testing locally
  and in CI.
- `CMakePresets.json`: `clang`, `gcc`, `msvc` and `macos` presets keyed by compiler and
  arch.
- `-DSCL_BUILD_VARIANT=<tag>` and `CMakeUserPresets.json`, isolating a version or option
  set.
- `osxcross-*` presets cross-compiling to Darwin from Linux, so macOS is verifiable
  without a Mac.
- `.gitlab-ci.yml` building `clang-x64` and `gcc-x64`, required to pass before a merge.
- `.github/workflows/build.yml` covering `msvc`, `macos`, the Linux matrix and
  `mingw-w64`.
- Tag-triggered `release` jobs publishing the matching `CHANGELOG.md` section as
  release notes.
- A one-way mirror of every branch and tag to GitHub, with a workflow closing a pull
  request there.
- A build-time mirror of `compile_commands.json` to the source root, so clangd finds
  it unaided.

### CI
- Every job builds and tests `Release`, not `Debug`.
- `.github/workflows/build.yml` builds every branch and cancels superseded runs.
- Linux entries for the RTTI-off build, and a Windows clang entry that builds without
  tests.
