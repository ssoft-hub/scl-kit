#!/usr/bin/env sh
# Extract one version's release notes from CHANGELOG.md.
#
# Prints the body between the "## [<version>]" heading and the next "## ["
# heading (or EOF), with the heading line itself stripped. Shared by the
# GitLab and GitHub release jobs so both publish the same notes.
#
# Usage:
#   script/ci/changelog_section.sh <version>   # e.g. 0.1.0, no leading 'v'

set -eu

VERSION="${1:?usage: changelog_section.sh <version>}"

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
cd "${SCRIPT_DIR}/../.."

awk -v heading="[$VERSION]" '
    /^## \[/ {
        if (found) exit
        if (index($0, heading)) { found = 1 }
        next
    }
    found { print }
    END { exit !found }
' CHANGELOG.md || { echo "No '## [$VERSION]' heading found in CHANGELOG.md" >&2; exit 1; }
