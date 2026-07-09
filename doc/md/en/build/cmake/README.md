# Build & setup — CMake presets per IDE

Step-by-step guides for building, testing, and running the ScL Toolkit from
each supported IDE (and the command line) using the shipped CMake presets.

Start with the shared background, then follow your IDE:

| Guide | Covers |
|-------|--------|
| [Presets intro](presets-intro.md) | The preset model, prerequisites per toolchain, and cross-cutting gotchas. **Read this first.** |
| [Qt Creator](qt-creator.md) | Import presets per kit; fixing the default compiler/debugger; the `.user` cache. |
| [VS Code](vs-code.md) | CMake Tools extension; selecting configure/build/test presets. |
| [Visual Studio](visual-studio.md) | Open-folder CMake; picking the `-2022` vs `-2026` preset for your VS version. |
| [CLion](clion.md) | Preset → profile mapping; matching toolchains. |
| [Command line](cli.md) | `cmake --preset` and the `script/ci/` wrappers. |

The authoritative preset table (name → host → build tree → notes) lives in
[CONTRIBUTING.md](../../../../../CONTRIBUTING.md#presets).
