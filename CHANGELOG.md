# Changelog

All notable changes to the ScL Toolkit super-project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Project skeleton: README, license, contribution guide, changelog, agent
  instructions, and baseline ignore rules.
- Git submodules wiring the `utility` and `feature` modules and the bundled
  `googletest` and `doctest` test frameworks under `module/` and `3rdparty/`.
- Cross-platform CMake build system aggregating the modules, their tests, and
  examples, with a toolchain-triplet output layout and an installable
  `find_package(scl)` package. Configurable via `SCL_BUILD_TESTS`,
  `SCL_BUILD_EXAMPLES`, `SCL_INSTALL`, and per-framework test toggles.
- `script/ci/build.sh` and `script/ci/run_tests.sh` helpers for building and
  testing locally and in CI.
- `CMakePresets.json` with configure/build/test presets keyed by compiler and
  architecture, gated per host OS: `clang`/`gcc` (`x64`, `x86`, cross `arm64`),
  `msvc` (`x64`, `x86`, `arm64`) on Windows, and `macos` (`arm64`, `x64`,
  `universal`) on macOS. IDEs and the helper scripts share the same
  `build/<preset>/` tree, so one compiler builds in one place regardless of what
  drove the build, while different compilers stay isolated. An optional
  `-DSCL_BUILD_VARIANT=<tag>` and machine-local `CMakeUserPresets.json` entries
  keep builds independent across compiler versions or option sets too.
- `.gitlab-ci.yml` build matrix (`clang-x64`, `gcc-x64`) on GitLab's free Linux
  runners, and `.github/workflows/build.yml` covering macOS (Apple Silicon and
  Intel) on GitHub's free hosted runners instead. Tag-triggered `release` jobs
  on both publish a Release with the matching `CHANGELOG.md` section as notes
  — the toolkit is header-only, so there is no binary artifact to attach.
  README badges report the GitLab pipeline and GitHub build status.
