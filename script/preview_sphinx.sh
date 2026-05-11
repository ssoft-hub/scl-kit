#!/bin/sh
# Compatibility wrapper — use script/sphinx/preview.sh instead.
exec "$(dirname "$0")/sphinx/preview.sh" "$@"
