# ScL Toolkit

ScL is a free, header-only C++20 toolkit. It bundles small, independent
modules that simplify everyday C++ development. Licensed under
[The Unlicense](LICENSE.md): free for any purpose, commercial or
non-commercial, with no attribution required for binary use.

## Modules

The toolkit is a super-project organised as independent, header-only modules,
each maintained as a git submodule under `module/`. Modules are added
incrementally — see the `module/` directory for those currently available.

## Usage

Clone the repository together with its submodules:

```sh
git clone --recurse-submodules <repository-url>
```

Each module is header-only: add its `src` directory to your include path and
include the module's umbrella header. All public entities live in namespace
`scl`.

## Contributing

Contributions are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for the
workflow and [AGENTS.md](AGENTS.md) for automation and agent instructions.
