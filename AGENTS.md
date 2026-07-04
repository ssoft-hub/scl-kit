# ScL Toolkit — Agent Instructions

## Overview
ScL Toolkit is a header-only C++20 super-project. Its functionality is split
across independent modules, each maintained as its own git submodule under
`module/`. License: The Unlicense.

## Repository Layout
- `module/` — independent modules (e.g. `utility`, `feature`, more added over time), each its own git submodule
- `3rdparty/` — bundled third-party test frameworks (read-only)
- `script/ci/` — build/test/release scripts shared by GitLab CI and GitHub Actions
- `CMakeLists.txt` / `CMakePresets.json` — build entry point; see CONTRIBUTING.md for the full preset table

```sh
git clone --recurse-submodules git@gitlab.com:ssoft-scl/scl-kit.git && cd scl-kit
cmake --preset default && cmake --build --preset default
```

## Gotchas
- The GitLab project's default branch is `main`, but all work happens on `dev`. `Closes #N` in a commit only auto-closes the issue when merging into the default branch — merging into `dev` does not, close manually.
- No release has happened yet (`CMakeLists.txt` version `0.0.0`, no version tags) — `[Unreleased]` in `CHANGELOG.md` should describe the net current state, not a log of in-progress corrections.
- Submodules are pinned to specific commits, not tracking a branch — update the pin explicitly when a module changes.

## Cross-Module Rules
- Each module is independent. Working in one module does not imply permission to
  change another; edit an adjacent module only when explicitly requested.
- Bundled third-party dependencies are read-only. Never modify them.

## Branching
- Branch name: `{user}/{type}/{tracker-N}/{subject}` — omit `{tracker-N}` when there is no linked issue
- Never commit directly to `dev` or `main`

## Commit Format
- Conventional Commits, English only: `type(scope): subject` (≤72 chars)
- Body is always required — explain why, what problem, how (non-obvious approach)
- One logical change per commit; every commit must build
- No `Co-Authored-By` or any AI-attribution trailers

## Before PR/MR
1. A tracked issue must exist with a test plan before implementing (create one if missing)
2. Update `CHANGELOG.md` under `[Unreleased]` (see Gotchas)
3. If this PR changes repository layout, workflow, or conventions this file describes, update `AGENTS.md` to match
4. Before merging: reconcile every checkbox in the linked issue against what actually shipped; comment on the issue which items it resolves
5. Merge `--no-ff` (no squash); close the issue manually (see Gotchas — merging into `dev` never auto-closes) once its checklist is fully satisfied or unresolved items have a linked follow-up issue/MR

## Do Not
- Modify bundled third-party dependencies.
- Push, merge, or close an issue without explicit approval.
- Edit a module (`module/*`) outside the current task scope.
- Commit code that does not build.
- Bundle unrelated changes into one commit/MR — file a separate issue/MR instead.
