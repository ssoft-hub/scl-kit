# ScL Toolkit — Agent Instructions

## Overview
ScL Toolkit is a header-only C++20 super-project. Its functionality is split
across independent modules, each maintained as its own git submodule under
`module/`. License: The Unlicense.

## Cross-Module Rules
- Each module is independent. Working in one module does not imply permission to
  change another; edit an adjacent module only when explicitly requested.
- Bundled third-party dependencies are read-only. Never modify them.

## Commit Format
- Conventional Commits, English only.
- One logical change per commit; every commit must build.

## Do Not
- Modify bundled third-party dependencies.
- Push without explicit approval.
- Edit a module outside the current task scope.
- Commit code that does not build.
