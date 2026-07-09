# Building with Qt Creator

Prerequisites and the preset model: [presets-intro.md](presets-intro.md).

Qt Creator reads `CMakePresets.json` directly — each configure preset becomes a
build configuration you can select per kit.

## 1. Open the project

**File → Open File or Project…** and select the repository's top-level
`CMakeLists.txt`. Qt Creator detects `CMakePresets.json` and offers the presets
your host can drive during the **Configure Project** step.

## 2. Select presets

On the **Configure Project** screen, tick the presets you want (e.g.
`msvc-x64-2026`, `clang-x64`). Each becomes a build configuration under
**Projects → Build & Run**. Switch between them from the kit selector
(bottom-left) or the **Build Settings** page.

## 3. Configure, build, test

- **Build → Run CMake** configures the selected preset into `build/<preset>/`.
- **Build → Build Project** (`Ctrl+B`) builds.
- Tests: **Tools → Tests** (Autotests) discovers the CTest targets; run them from
  the **Test Results** pane, or add a **CTest** run step.

## Gotchas

- **Presets import with a default toolchain, not the preset's.** After loading,
  Qt Creator assigns *its own default compiler and debugger* to every imported
  preset/kit — it does **not** infer them from the preset. Open **Projects →
  Build & Run → (kit) → Manage Kits…** (or the kit's CMake settings) and fix the
  compiler and debugger for each preset by hand: point `msvc-*-2022` at the
  VS 2022 toolchain, `msvc-*-2026` at VS 2026, `clang-*` at Clang, and so on.
  Skipping this silently builds every preset with the same default compiler.
- **Stale build-step arguments.** Qt Creator bakes the build configuration
  (including CMake/native build arguments) into `.qtcreator/CMakeLists.txt.user`.
  If a preset's build settings change after the first import, re-run **Run CMake**
  or re-import the presets — otherwise the cached value in the `.user` file wins.
  If a build step still shows a stale argument, clear it in **Build Settings** or
  delete `.qtcreator/CMakeLists.txt.user` (Qt Creator closed) to regenerate it.
- Windows `clang-x86` and MinGW `gcc` still need the right environment on `PATH`
  — see [Gotchas in the intro](presets-intro.md#gotchas).
