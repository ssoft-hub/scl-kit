# Building with CLion

Prerequisites and the preset model: [presets-intro.md](presets-intro.md).

CLion (2023.1+) reads `CMakePresets.json` and maps configure presets to CMake
profiles.

## 1. Open the project

**File → Open…** and select the repository root (the folder with the top-level
`CMakeLists.txt`). CLion detects `CMakePresets.json`.

## 2. Enable the presets

**Settings → Build, Execution, Deployment → CMake**. CLion offers to create a
profile from each preset; enable the ones you want (e.g. `clang-x64`,
`msvc-x64-2026`). Each profile configures into that preset's `build/<preset>/`
tree. Use **Reload CMake Presets** if you edited `CMakePresets.json` after
opening.

## 3. Configure, build, test

- Selecting a profile configures it; the **CMake** tool window shows progress.
- **Build → Build Project** (`Ctrl+F9`) builds the active profile.
- CLion discovers the CTest tests; run them from the gutter or a **CTest
  Application** / Google Test run configuration.

## Gotchas

- Match the profile's toolchain (**Settings → Build … → Toolchains**) to the
  preset: a Visual Studio toolchain for `msvc-*`, a MinGW toolchain for `gcc-*`
  on Windows, etc. As with other IDEs, `clang-x86` on Windows needs an x86 VS
  environment and MinGW `gcc` needs MinGW on `PATH` — see
  [Gotchas in the intro](presets-intro.md#gotchas).
- Cross presets (`clang-arm64`/`gcc-arm64`/`osxcross-*`) are build-only; CLion
  cannot run their binaries on the host.
