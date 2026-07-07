# Changelog

All notable changes to the ScL Toolkit super-project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed
- Fixed the macOS CI job (`build`, GitHub Actions), which was failing on
  every push: the bundled Xcode clang crashes compiling an NTTP example,
  blocking everything after it in the build. The job now builds with a
  pinned Homebrew LLVM instead.
- Fixed the `msvc-x64`/`msvc-x86`/`msvc-arm64` presets building
  single-threaded: MSBuild needs `/MP` for per-project file parallelism
  and an explicit job count for parallelism across projects, neither of
  which was set.

### Added
- Project skeleton: README, license, contribution guide, changelog, baseline
  ignore rules, and `AGENTS.md` documenting repository layout, branching,
  commit format, and the issue/PR workflow for automated contributors.
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
- `.gitlab-ci.yml` build matrix (`clang`/`gcc`, each `x64`, `x86`, and cross
  `arm64`) on GitLab's free Linux runners, and `.github/workflows/build.yml`
  covering `msvc` (`x64`, `x86`, `arm64`) and `macos` (`arm64`, `universal`)
  on GitHub's free hosted Windows and macOS runners instead. Linux `arm64` is
  build-only (cross-compiled, cannot execute on an x64 runner); `msvc-arm64`
  configures, builds, and tests like the other Windows jobs, on GitHub's
  native `windows-11-arm` runner. 32-bit (`x86`) jobs configure, build, and
  test like their 64-bit siblings. No native `macos-x64` job: GitHub's
  Intel-hosted macOS runners are retired, so `x86_64` is covered at the
  binary level through `macos-universal` instead.
  `.github/workflows/build.yml` also duplicates the `clang`/`gcc` Linux
  matrix (redundant coverage independent of GitLab), and adds a `mingw-w64`
  matrix (`gcc` and `clang` targeting the mingw-w64/GNU ABI on Windows, via
  MSYS2) — a genuinely different environment from `msvc-*`, not a duplicate
  of it.
  Tag-triggered `release` jobs on both publish a Release with the matching
  `CHANGELOG.md` section as notes — the toolkit is header-only, so there is
  no binary artifact to attach. README badges report the GitLab pipeline and
  GitHub build status.
- `mirror:github` GitLab CI job pushing a one-way, force-pruned mirror of every
  branch and tag to `https://github.com/ssoft-hub/scl-kit`, plus a
  `close-mirror-prs.yml` GitHub workflow that closes any PR opened there with
  a pointer back to GitLab.
- A build-time mirror of `compile_commands.json` to the source root, so
  clangd finds it without a build-dir argument: `CMAKE_EXPORT_COMPILE_COMMANDS`
  writes into `build/<toolchain>/`, which clangd and IDE shadow builds don't
  search. Last build wins; a no-op (not an error) on generators that don't
  produce the database at all (`msvc-*`'s Visual Studio generator).
