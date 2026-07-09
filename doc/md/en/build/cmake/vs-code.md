# Building with VS Code

Prerequisites and the preset model: [presets-intro.md](presets-intro.md).

Use the **CMake Tools** extension (`ms-vscode.cmake-tools`); it drives
`CMakePresets.json` natively.

## 1. Open and enable presets

Open the repository folder (**File → Open Folder…**). With CMake Tools
installed, opening a folder that contains `CMakePresets.json` makes the extension
use presets automatically. To force it, set in `.vscode/settings.json`:

```json
{
  "cmake.useCMakePresets": "always"
}
```

## 2. Select presets

From the status bar (or the command palette, `Ctrl+Shift+P`):

- **CMake: Select Configure Preset** — pick e.g. `clang-x64`, `msvc-x64-2026`.
- **CMake: Select Build Preset** — the matching build preset.
- **CMake: Select Test Preset** — the matching test preset.

The chosen presets show in the status bar.

## 3. Configure, build, test

- **CMake: Configure** configures into `build/<preset>/`.
- **CMake: Build** (or the status-bar **Build** button) builds.
- **CMake: Run Tests** runs CTest through the selected test preset; results show
  in the **Test Explorer** and the CMake output channel.

## Choosing the build configuration (multi-config)

The presets use multi-config generators (`Ninja Multi-Config`, Visual Studio),
so the configuration is **not** chosen at configure time — a configure preset
only selects compiler + architecture, and one build tree holds every
configuration. The configuration is picked at *build* time with `--config`.
Multi-config generators expose the four standard CMake configurations —
`Debug`, `Release`, `RelWithDebInfo`, `MinSizeRel` — so `--config` is not limited
to Debug/Release.

In preset mode CMake Tools has no GUI switch for the build configuration (there
is no "Select Build Configuration" command). Rather than multiplying the preset
count with per-config variants, drive the config from a task that reuses the
**active** build preset. Create `.vscode/tasks.json` (the folder is git-ignored —
this stays machine-local). A single task that prompts for the configuration
covers every preset × every config with no per-config duplication:

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Build",
            "type": "shell",
            "command": "cmake",
            "args": ["--build", "--preset", "${command:cmake.activeBuildPresetName}", "--config", "${input:buildConfig}"],
            "group": { "kind": "build", "isDefault": true }
        }
    ],
    "inputs": [
        {
            "id": "buildConfig",
            "type": "pickString",
            "description": "CMake configuration",
            "options": ["Debug", "Release", "RelWithDebInfo", "MinSizeRel"],
            "default": "Debug"
        }
    ]
}
```

- `${command:cmake.activeBuildPresetName}` substitutes the preset you picked in
  the CMake status bar, so this one task covers every preset — configuration
  stays orthogonal to the preset, zero new presets.
- The four options are the standard multi-config configurations. This project
  defines no extra ones (no "Profile" and the like).

Usage:

- Switch compiler/architecture as before — in the CMake status bar.
- `Ctrl+Shift+B` (**Tasks: Run Build Task**) runs **Build** and asks which
  configuration to build. Equivalently `Ctrl+Shift+P` → **Tasks: Run Task**.
  Bind it to a key in `keybindings.json` for a one-press build; for a status-bar
  button, the **Tasks** extension (`actboy168.tasks`) surfaces it.
- Debugging with `F5` stays on the default (Debug) configuration.

No `problemMatcher` is set: the VS Code terminal already turns the `file:line`
paths that CMake, Ninja, and the compilers print into clickable links. Add a
matcher only if you want the errors mirrored into the **Problems** panel —
`$msCompile` for MSVC (built in), and for GCC/Clang either `$gcc` (needs the
**C/C++** extension, `ms-vscode.cpptools`) or an inline `pattern` matcher.

## Gotchas

- On Windows, launch VS Code from the environment the preset needs: an **x86**
  Native Tools prompt for `clang-x86`, or a shell with MinGW on `PATH` for
  `gcc-*`. CMake Tools inherits the environment of the process that launched
  VS Code — see [Gotchas in the intro](presets-intro.md#gotchas).
- If the preset list looks empty, confirm `cmake.useCMakePresets` is not set to
  `"never"` and that CMake Tools points at a CMake ≥ 3.23.
