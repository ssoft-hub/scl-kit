#!/bin/sh
# Manual mirror trigger for scl-kit → GitHub.
# Usage: sh script/ci/mirror_github_manual.sh

set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

CI_PROJECT_PATH="ssoft-scl/complex/scl-kit" \
CI_SERVER_HOST="gitlab.com" \
GITHUB_MIRROR_URL="git@github.com:ssoft-hub/scl-kit.git" \
GITHUB_URL_MAP="git@gitlab.com:ssoft-scl/module/=git@github.com:ssoft-hub/scl-
git@gitlab.com:ssoft-scl/complex/=git@github.com:ssoft-hub/
git@gitlab.com:ssoft-tool/=git@github.com:ssoft-hub/" \
GITHUB_REMOVE_SUBMODULES="script/git-modules" \
sh "$DIR/mirror_github_transform.sh"
