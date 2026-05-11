#!/bin/sh
# Build unified Sphinx docs for CI deployment.
# Must be run from the scl-kit root directory.
#
# Usage: sh script/ci/deploy_sphinx_docs.sh [output_dir]
#   output_dir — defaults to public/ (GitLab/GitHub Pages artifact)

exec sh script/sphinx/build.sh "${1:-public}"
