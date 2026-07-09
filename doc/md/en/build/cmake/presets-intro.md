# CMake presets — model and prerequisites

This is the shared background for the per-IDE build guides. Read it once, then
follow the guide for [your IDE](README.md).

## What the presets are

`CMakePresets.json` at the repository root ships a matrix of **configure**,
**build**, and **test** presets, keyed by compiler and target architecture. An
IDE and the `script/ci` helpers that pick the same preset share the exact same
build tree, so a configure in the IDE and a build from the terminal never fight
over the same directory.

- Each preset configures into its own `build/<preset>/` tree, so different
  compilers and architectures never collide.
- Artifacts land under `bin/<OS>-<Compiler>.<Version>-<arch>/<config>/`.
- Presets are gated by host OS: Windows sees `clang-*`/`gcc-*`/`msvc-*`, Linux
  sees `clang-*`/`gcc-*` (+ `osxcross-*`), macOS sees `macos-*`.

List what your machine can drive:

```sh
cmake --list-presets          # configure presets
cmake --build --list-presets  # build presets
ctest --list-presets          # test presets
```

The authoritative preset table (name → host → build tree → notes) lives in
[CONTRIBUTING.md](../../../../../CONTRIBUTING.md#presets) — this page does not
duplicate it.

## Prerequisites

- **CMake ≥ 3.23** and a **C++20 compiler**.
- **Ninja** for the `clang-*`/`gcc-*`/`osxcross-*`/`macos-*` presets (they use
  the `Ninja Multi-Config` generator). The `msvc-*` presets use the Visual
  Studio generator and need no separate Ninja.
- The compiler is resolved from `PATH` by bare name (`clang`/`clang++`,
  `gcc`/`g++`, `cl` via the VS generator). CMake caches the resolved path on the
  first configure — later `PATH` changes do not leak another compiler into an
  existing tree.

Toolchain-specific extras:

| Preset family | Needs |
|---------------|-------|
| `msvc-*-2022` / `msvc-*-2026` | Visual Studio 2022 (v17) / 2026 (v18); ARM64 presets need the "C++ ARM64/ARM64EC build tools" component |
| `clang-x86` / `gcc-x86` | a 32-bit runtime (`-m32`): `gcc-multilib`/`g++-multilib` on Linux; an x86 VS environment on Windows (see Gotchas) |
| `clang-arm64` / `gcc-arm64` | an aarch64 cross toolchain; pass `-DSCL_SYSROOT=<path>` when the sysroot is not the compiler default. Build-only. |
| `osxcross-*` | an [osxcross](https://github.com/tpoechtrager/osxcross) install with `osxcross-conf` and the `<triple>-clang` tools on `PATH`. Build-only. |

## Pinning a specific compiler version

A shipped preset names the compiler by family, not version. To pin an exact
install (GCC 12 vs 13, a specific Clang, …), add a machine-local
`CMakeUserPresets.json` at the repository root that inherits a shipped preset —
see [`project/cmake/CMakeUserPresets.json.example`](../../../../../project/cmake/CMakeUserPresets.json.example)
and the "Independent builds" section of
[CONTRIBUTING.md](../../../../../CONTRIBUTING.md#presets).

## Gotchas

These bite regardless of IDE:

- **Windows `clang-x86`** — configure and build from an **x86** Visual Studio
  environment (an "x86 Native Tools" prompt, `vcvarsall.bat x86`, or
  `Enter-VsDevShell -Arch x86`). Otherwise the linker resolves the **x64** CRT
  and fails with `machine type x64 conflicts with x86`.
- **MinGW `gcc` on Windows** — put your MinGW-w64 `bin` directory (a standalone
  install, or the one bundled with Qt under `Tools/mingw*/bin`) on `PATH` before
  configuring. `gcc-x86` needs a multilib MinGW; a plain 64-bit MinGW cannot
  satisfy `-m32`.
- **`osxcross-*`** — `source` your osxcross environment so `osxcross-conf` and
  the `<triple>-clang` tools are on `PATH`; the linker (`ld64`) may also need its
  shared libs on `LD_LIBRARY_PATH`. Cross binaries do not run on the build host,
  so there is no test preset — build only.
- **Parallelism** — the `msvc-*` presets inject `/MP` (per-file parallelism, via
  the preset `CFLAGS`/`CXXFLAGS` environment so CMake's default MSVC flags are
  kept) and pass `/m` to MSBuild for cross-project parallelism. The `/m` reaches
  MSBuild through `cmake --build --preset`; an IDE that builds by directory
  instead relies on `/MP` alone.
