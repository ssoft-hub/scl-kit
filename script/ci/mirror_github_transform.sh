#!/bin/sh
# Mirror all branches and tags to GitHub, transforming .gitmodules URLs on each branch tip.
#
# Required variables:
#   GITHUB_MIRROR_URL        - git@github.com:org/repo.git  (manual, SSH)
#                            - https://github.com/org/repo.git  (CI, HTTPS)
#   GITHUB_TOKEN             - GitHub PAT, required only for HTTPS
#   GITHUB_URL_MAP           - newline-separated prefix mapping (see transform_gitmodules.py)
#   GITHUB_REMOVE_SUBMODULES - newline-separated submodule paths to remove (optional)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -n "$GITHUB_TOKEN" ]; then
    GITHUB_AUTH_URL="https://oauth2:${GITHUB_TOKEN}@${GITHUB_MIRROR_URL#https://}"
else
    GITHUB_AUTH_URL="$GITHUB_MIRROR_URL"
fi

GIT_AUTHOR_NAME="GitLab Mirror"
GIT_AUTHOR_EMAIL="ci-mirror@gitlab"
GIT_COMMITTER_NAME="GitLab Mirror"
GIT_COMMITTER_EMAIL="ci-mirror@gitlab"
export GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL

# Save original position (branch name or SHA for detached HEAD)
ORIGINAL_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [ "$ORIGINAL_BRANCH" = "HEAD" ]; then
    ORIGINAL_SHA="$(git rev-parse HEAD)"
fi

cleanup() {
    # Restore original position
    if [ -n "$ORIGINAL_SHA" ]; then
        git checkout --detach "$ORIGINAL_SHA" 2>/dev/null || true
    else
        git checkout "$ORIGINAL_BRANCH" 2>/dev/null || true
    fi
    # Discard any leftover working tree changes
    git checkout -- . 2>/dev/null || true
    # Remove github remote if it exists
    git remote remove github 2>/dev/null || true
}
trap cleanup EXIT

git fetch --all --tags --prune

BRANCHES=$(git branch -r | grep -v 'HEAD' | sed 's|[[:space:]]*origin/||')

for branch in $BRANCHES; do
    git checkout -B "$branch" "origin/$branch"

    if [ -f .gitmodules ]; then
        python3 "$SCRIPT_DIR/transform_gitmodules.py"
        if ! git diff --quiet .gitmodules; then
            git add .gitmodules
            GIT_COMMITTER_DATE=$(git log -1 --format=%cI) \
            GIT_AUTHOR_DATE=$(git log -1 --format=%aI)   \
            git commit --amend --no-edit
        fi
    fi
done

git remote add github "$GITHUB_AUTH_URL"

for branch in $BRANCHES; do
    git push github "refs/heads/$branch:refs/heads/$branch" --force
done

git push github --tags --prune
