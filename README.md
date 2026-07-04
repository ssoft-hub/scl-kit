# ScL Toolkit

[![GitLab Pipeline](https://gitlab.com/ssoft-scl/scl-kit/badges/dev/pipeline.svg)](https://gitlab.com/ssoft-scl/scl-kit/-/pipelines)
[![GitHub Build](https://github.com/ssoft-hub/scl-kit/actions/workflows/build.yml/badge.svg?branch=dev)](https://github.com/ssoft-hub/scl-kit/actions/workflows/build.yml)

ScL is a free, header-only C++20 toolkit. It bundles small, independent
modules that simplify everyday C++ development. Licensed under
[The Unlicense](LICENSE.md): free for any purpose, commercial or
non-commercial, with no attribution required for binary use.

## Modules

The toolkit is a super-project of independent, header-only modules, each
maintained as a git submodule under `module/`. Modules are added incrementally;
those currently available:

- **[utility](module/utility)** — common C++20 utilities missing from the
  standard library: compile-time meta-programming helpers, preprocessor
  utilities, extended type traits, and non-cryptographic hashing.
  Umbrella header `<scl/utility.h>`.
- **[feature](module/feature)** — `scl::wrapper<Value, Executors...>`, a
  composable proxy that delegates calls to the wrapped value through a chain of
  executor templates, transparently adding cross-cutting behaviour such as
  copy-on-write, thread safety, or deferred invocation.
  Umbrella header `<scl/feature.h>`.

## Usage

Clone the repository together with its submodules:

```sh
git clone --recurse-submodules <repository-url>
```

Each module is header-only: add its `src` directory to your include path and
include the module's umbrella header. All public entities live in namespace
`scl`.

## Building from source

Building is only needed to run the tests and examples or to install the
toolkit as a CMake package — consuming the headers requires no build step.
Requirements: CMake 3.23+ and a C++20 compiler.

```sh
git clone --recurse-submodules <repository-url>
cd scl-kit
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build --parallel
ctest --test-dir build --output-on-failure
```

To install the toolkit and consume it from another CMake project:

```sh
cmake --install build --prefix <install-prefix>
```

```cmake
find_package(scl CONFIG REQUIRED COMPONENTS utility feature)
target_link_libraries(app PRIVATE scl::utility scl::feature)
```

Or use a CMake preset (shared by IDEs and the helper scripts), which keeps a
separate build tree per compiler and architecture:

```sh
cmake --preset clang-x64 && cmake --build --preset clang-x64 --config Debug
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for the full preset list, build options,
and the convenience scripts under `script/ci/`.

## Contributing

Contributions are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for the
workflow and [AGENTS.md](AGENTS.md) for automation and agent instructions.
