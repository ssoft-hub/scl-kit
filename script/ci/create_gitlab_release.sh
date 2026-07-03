#!/usr/bin/env bash
# Create a GitLab Release for the current CI_COMMIT_TAG, using the matching
# CHANGELOG.md section (see changelog_section.sh) as the release description.
#
# Runs in CI only: relies on the predefined CI_COMMIT_TAG, CI_API_V4_URL,
# CI_PROJECT_ID, and CI_JOB_TOKEN variables. Requires curl and jq.

set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
cd "${SCRIPT_DIR}/../.."

TAG="${CI_COMMIT_TAG:?CI_COMMIT_TAG is not set}"
VERSION="${TAG#v}"

NOTES_FILE="$(mktemp)"
trap 'rm -f "$NOTES_FILE"' EXIT
script/ci/changelog_section.sh "$VERSION" > "$NOTES_FILE"

jq -n --rawfile desc "$NOTES_FILE" --arg tag "$TAG" '{tag_name: $tag, description: $desc}' \
    | curl --fail --show-error --request POST \
        --header "JOB-TOKEN: ${CI_JOB_TOKEN}" \
        --header "Content-Type: application/json" \
        --data @- \
        "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/releases"
