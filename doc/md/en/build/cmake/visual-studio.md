# Building with Visual Studio

Prerequisites and the preset model: [presets-intro.md](presets-intro.md).

Visual Studio 2022 (v17) and 2026 (v18) both read `CMakePresets.json` natively
when you open the repository as a folder — no `.sln` needed.

## 1. Open the folder

**File → Open → Folder…** and select the repository root. Visual Studio parses
`CMakePresets.json` and lists the presets it can drive in the configuration
dropdown on the toolbar.

## 2. Pick the generation matching your VS version

The `msvc` presets come in two flavours, one per VS generation:

- Visual Studio **2022** → `msvc-x64-2022`, `msvc-x86-2022`, `msvc-arm64-2022`
- Visual Studio **2026** → `msvc-x64-2026`, `msvc-x86-2026`, `msvc-arm64-2026`

Pick the flavour that matches the VS version you opened the folder in;
selecting a 2026 preset in VS 2022 (or vice-versa) fails because the generator
(`Visual Studio 17 2022` vs `Visual Studio 18 2026`) will not match the
installed toolset.

## 3. Configure, build, test

- Selecting a preset in the dropdown configures it into `build/<preset>/`.
- **Build → Build All** (`Ctrl+Shift+B`) builds.
- **Test → Test Explorer** discovers and runs the CTest targets.

## Gotchas

- `msvc-arm64-*` cross-compiles on an x64 host — it builds, but the ARM64
  binaries only run (and test) on a real ARM64 machine.
- `msvc-x86-*` needs no special environment inside Visual Studio (the generator
  selects the 32-bit toolset via the preset's `architecture`), unlike the
  `clang-x86` preset — see [Gotchas in the intro](presets-intro.md#gotchas).
- The Visual Studio generator does not emit `compile_commands.json`; that is
  expected and harmless here.
