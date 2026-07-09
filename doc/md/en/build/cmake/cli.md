# Building from the command line

Prerequisites and the preset model: [presets-intro.md](presets-intro.md).

No IDE required — the presets drive CMake directly.

## Configure, build, test

```sh
cmake --preset clang-x64                          # configure into build/clang-x64/
cmake --build --preset clang-x64 --config Debug   # build
ctest  --preset clang-x64 --build-config Debug    # run the tests
```

`--config` / `--build-config` selects the configuration for the multi-config
presets (`Ninja Multi-Config`, Visual Studio); the test presets default to
`Debug`, so `ctest --preset <name>` works without `-C`.

For a cross preset, pass the sysroot at configure time:

```sh
cmake --preset gcc-arm64 -DSCL_SYSROOT=/opt/aarch64-sysroot
cmake --build --preset gcc-arm64 --config Debug   # build-only, no test preset
```

For an osxcross preset, put the osxcross tools on `PATH` first, then:

```sh
cmake --preset osxcross-arm64
cmake --build --preset osxcross-arm64 --config Debug   # build-only
```

## Convenience wrappers

`script/ci/build.sh` and `script/ci/run_tests.sh` wrap the same presets for
local use and CI:

```sh
script/ci/build.sh clang-x64 Debug        # cmake --preset + cmake --build --preset
script/ci/run_tests.sh clang-x64 Debug     # ctest --preset

script/ci/build.sh gcc-arm64 -DSCL_SYSROOT=/opt/aarch64-sysroot   # extra args forwarded
```

Both default to the `default` preset when given no argument. The scripts'
header comments document their full argument handling.

## Gotchas

- Windows `clang-x86` must run from an **x86** VS environment; MinGW `gcc` needs
  MinGW on `PATH` — see [Gotchas in the intro](presets-intro.md#gotchas).
- The bare compiler name is resolved from `PATH` on the first configure and then
  cached in `build/<preset>/`. To switch to a different install of the same
  compiler family, use a `CMakeUserPresets.json` entry (see the intro) rather
  than editing `PATH`.
