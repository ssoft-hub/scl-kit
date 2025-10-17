#!/usr/bin/env bash
set -euo pipefail

# format-all.sh — format all project files with clang-format (21.x friendly)
# This version avoids 'eval' and builds a proper argv array for 'find' to fix
# "syntax error near unexpected token (`(')" issues on some shells.
#
# Usage examples:
#   ./format-all.sh                 # format in-place
#   ./format-all.sh --check         # only check; exit 1 if reformat needed
#   ./format-all.sh --staged        # operate on git-staged files
#   ./format-all.sh --root path/to/project --extensions cpp,hpp --exclude-dirs build,out
#   CLANG_FORMAT=/custom/clang-format ./format-all.sh

CF_BIN="${CLANG_FORMAT:-clang-format}"
MODE="fix"       # fix | check
ROOT="."
STAGED="0"
EXTS="c,h,cc,hh,cpp,hpp,cxx,ixx,ipp,inl,cu,cuh,m,mm"
EXCLUDE_DIRS=".git,build,out,dist,.venv,venv,node_modules,third_party"

usage() {
  cat <<USAGE
format-all.sh — format all project files with clang-format

Options:
  --check                    Run in check mode (no writes); non-zero exit if changes needed
  --fix                      Run in fix mode (in-place) [default]
  --staged                   Use only git-staged files instead of scanning the tree
  --root <dir>               Project root (default: .)
  --extensions <csv>         File extensions (comma-separated, no dots). Default:
                             ${EXTS}
  --exclude-dirs <csv>       Directories (names or paths) to exclude from scan. Default:
                             ${EXCLUDE_DIRS}
  --clang-format <path>      Path to clang-format binary (or set $CLANG_FORMAT)
  -h, --help                 Show this help
USAGE
}

# Parse args
while [[ $# -gt 0 ]]; do
  case "$1" in
    --check) MODE="check"; shift;;
    --fix) MODE="fix"; shift;;
    --staged) STAGED="1"; shift;;
    --root) ROOT="$2"; shift 2;;
    --extensions) EXTS="$2"; shift 2;;
    --exclude-dirs) EXCLUDE_DIRS="$2"; shift 2;;
    --clang-format) CF_BIN="$2"; shift 2;;
    -h|--help) usage; exit 0;;
    *) echo "Unknown option: $1" >&2; usage; exit 2;;
  esac
done

# Ensure clang-format is available
if ! command -v "$CF_BIN" >/dev/null 2>&1; then
  echo "Error: clang-format not found at '$CF_BIN'. Set CLANG_FORMAT or use --clang-format." >&2
  exit 127
fi

# Report version
CF_VER=$("$CF_BIN" --version 2>/dev/null || true)
echo "Using: $CF_VER"

# Arrays from CSV
IFS=',' read -r -a arr_ext <<<"$EXTS"
IFS=',' read -r -a arr_ex <<<"$EXCLUDE_DIRS"

# Build 'find' argv array safely, with grouping parentheses
build_find_args() {
  local -n _out=$1  # name reference
  _out=("$ROOT" -type f)

  # ( -name '*.cpp' -o -name '*.hpp' -o ... )
  if [[ ${#arr_ext[@]} -gt 0 ]]; then
    _out+=( '(' )
    local first=1
    for e in "${arr_ext[@]}"; do
      e=${e// /}
      [[ -z "$e" ]] && continue
      if [[ $first -eq 1 ]]; then
        first=0
      else
        _out+=( -o )
      fi
      _out+=( -name "*.${e}" )
    done
    _out+=( ')' )
  fi

  # -not ( -path '*/.git/*' -o -path '*/build/*' ... )
  if [[ ${#arr_ex[@]} -gt 0 ]]; then
    _out+=( -not '(' )
    local first=1
    for d in "${arr_ex[@]}"; do
      d=${d// /}
      [[ -z "$d" ]] && continue
      if [[ $first -eq 1 ]]; then
        first=0
      else
        _out+=( -o )
      fi
      _out+=( -path "${ROOT%/}/${d}/*" -o -path "*/${d}/*" )
    done
    # The previous loop adds an extra -o between two -path clauses; wrap them into a group:
    # find ... -not \( -path root/d/* -o -path */d/* -o -path root/d2/* -o -path */d2/* \)
    _out+=( ')' )
  fi
}

list_all_files() {
  local args
  build_find_args args
  # Use -print0 for safe filenames, and read into an array
  mapfile -d '' -t files < <(find "${args[@]}" -print0)
  printf '%s\n' "${files[@]}"
}

list_staged_files() {
  if ! command -v git >/dev/null 2>&1; then
    echo "Error: --staged requires git" >&2
    exit 2
  fi
  # Start from staged list, then filter by ext and excludes
  git -C "$ROOT" diff --name-only --cached --diff-filter=ACM | awk 'NF' |
  while IFS= read -r f; do
    # filter extensions
    ok=0
    for e in "${arr_ext[@]}"; do
      [[ "$f" == *."$e" ]] && { ok=1; break; }
    done
    [[ $ok -eq 0 ]] && continue
    # filter excludes
    for d in "${arr_ex[@]}"; do
      [[ "$f" == */"$d"/* || "$f" == "$d"/* ]] && { ok=0; break; }
    done
    [[ $ok -eq 1 ]] && printf '%s\n' "$f"
  done
}

# Collect files
if [[ "$STAGED" == "1" ]]; then
  mapfile -t files < <(list_staged_files)
else
  mapfile -t files < <(list_all_files)
fi

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No files matched."
  exit 0
fi

echo "Found ${#files[@]} file(s). Mode: $MODE"

if [[ "$MODE" == "check" ]]; then
  needs_fix=0
  for f in "${files[@]}"; do
    # Use process substitution to avoid temp files
    if ! diff -q "$f" <("$CF_BIN" --style=file --fallback-style=LLVM "$f") >/dev/null 2>&1; then
      echo "Needs format: $f"
      needs_fix=1
    fi
  done
  if [[ $needs_fix -ne 0 ]]; then
    echo -e "\nSome files need formatting. Re-run without --check to fix."
    exit 1
  fi
  echo "All files are properly formatted."
  exit 0
else
  for f in "${files[@]}"; do
    "$CF_BIN" -i --style=file --fallback-style=LLVM "$f"
  done
  echo "Formatted ${#files[@]} file(s)."
fi
