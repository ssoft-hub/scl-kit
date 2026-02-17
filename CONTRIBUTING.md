# Contributing to ScL Toolkit

Thank you for your interest in contributing to the ScL Toolkit!

## Repository structure

ScL Toolkit is organized as a super-project with git submodules:

```
scl-kit/
├── module/
│   ├── utility/    # Meta-programming utilities (this repo as submodule)
│   ├── feature/    # Feature wrappers (separate submodule)
│   └── event/      # Event system (separate submodule)
├── 3rdparty/       # Bundled dependencies
└── script/         # Build and test scripts
```

Each module is a separate git repository with its own CI, tests, and documentation.

## How to contribute

### 1. Choose a module

Each module has its own `CONTRIBUTING.md` with specific guidelines:
- [module/utility/CONTRIBUTING.md](module/utility/CONTRIBUTING.md)
- [module/feature/CONTRIBUTING.md](module/feature/CONTRIBUTING.md)

### 2. Development workflow

1. Fork the specific module repository (not the super-project)
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes following the module's code style
4. Run tests and linters locally (see module's CONTRIBUTING.md)
5. Commit with conventional commit messages: `feat:`, `fix:`, `docs:`, etc.
6. Push to your fork and create a Pull Request

### 3. Pull Request guidelines

- Target the `dev` branch (not `main`)
- Ensure all CI checks pass (clang-format, clang-tidy, cppcheck, tests)
- Update relevant documentation
- Add tests for new functionality
- Keep commits focused and atomic

## Build and test

See [CLAUDE.md](CLAUDE.md) for detailed build instructions for Windows development environment.

Quick build:
```bash
# All compilers
cmd //c "script\claude\build.bat all Debug build"

# Run tests
cmd //c "script\claude\run_tests.bat Debug"
```

## Questions?

For questions or discussions, please open an issue in the relevant module repository.
