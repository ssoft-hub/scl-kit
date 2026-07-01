# Contributing to ScL Toolkit

Thank you for your interest in contributing to the ScL Toolkit!

## Repository structure

ScL Toolkit is a super-project that aggregates independent modules as git
submodules:

```
scl-kit/                # super-project (this repository)
├── module/             # functional modules, each an independent git submodule
├── 3rdparty/           # bundled third-party dependencies (read-only)
└── script/             # build, test, and maintenance scripts
```

Each module is a separate git repository with its own history, tests, and
contribution guidelines.

## How to contribute

### 1. Choose where to work

Most changes belong to a specific module and follow that module's own
guidelines. Super-project changes — such as the build system, tooling, and
submodule pins — are made in this repository.

### 2. Development workflow

1. Create a topic branch off `dev`.
2. Make focused changes following the relevant code style.
3. Build and run the tests locally before pushing.
4. Commit using Conventional Commits (`feat:`, `fix:`, `docs:`, …).
5. Open a merge request targeting `dev`.

### 3. Merge request guidelines

- Target the `dev` branch, not `main`.
- Keep one logical change per merge request; keep commits focused and atomic.
- Update the relevant documentation.

## Agent and automation instructions

Instructions for automated contributors are described in [AGENTS.md](AGENTS.md).

## Questions?

Open an issue in this repository or in the relevant module repository.
