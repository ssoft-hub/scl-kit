#!/usr/bin/env python3
"""Transform .gitmodules for a target platform mirror.

Resolves relative submodule URLs to absolute ones using the GitLab project
path, applies a prefix-based URL mapping, and optionally removes submodule
sections that have no equivalent on the target platform.

Environment variables:
    CI_SERVER_HOST          GitLab hostname          (default: gitlab.com)
    CI_PROJECT_PATH         GitLab project path      e.g. ssoft-scl/complex/scl-kit
    GITHUB_URL_MAP          Newline-separated mapping:
                                <gitlab-prefix>=<github-prefix>
                            Example:
                                git@gitlab.com:ssoft-scl/module/=git@github.com:ssoft-hub/scl-
                                git@gitlab.com:ssoft-scl/complex/=git@github.com:ssoft-hub/
                                git@gitlab.com:ssoft-tool/=git@github.com:ssoft-hub/
    GITHUB_REMOVE_SUBMODULES  Newline-separated submodule paths to remove entirely.
                            Example:
                                script/git-modules
"""

import os
import re
import sys


# ---------------------------------------------------------------------------
# URL helpers
# ---------------------------------------------------------------------------

def resolve_relative_url(base_path: str, relative_url: str) -> str:
    """Resolve a relative submodule URL against the GitLab project path.

    Git resolves submodule relative URLs against the repo URL itself:
    each '..' goes up one path component.

    Example:
        base_path    = 'ssoft-scl/complex/scl-kit'
        relative_url = '../../module/utility.git'
        result       = 'ssoft-scl/module/utility.git'
    """
    has_git = relative_url.endswith('.git')
    url = relative_url[:-4] if has_git else relative_url

    parts = base_path.strip('/').split('/')
    for component in url.split('/'):
        if component == '..':
            if parts:
                parts.pop()
        elif component and component != '.':
            parts.append(component)

    result = '/'.join(parts)
    return (result + '.git') if has_git else result


def parse_url_map(raw: str) -> dict[str, str]:
    mapping: dict[str, str] = {}
    for line in raw.strip().splitlines():
        line = line.strip()
        if not line or line.startswith('#'):
            continue
        if '=' not in line:
            print(f'Warning: skipping malformed mapping: {line!r}', file=sys.stderr)
            continue
        gitlab_prefix, _, github_prefix = line.partition('=')
        mapping[gitlab_prefix.strip()] = github_prefix.strip()
    return mapping


def parse_remove_list(raw: str) -> set[str]:
    return {line.strip() for line in raw.strip().splitlines() if line.strip()}


# ---------------------------------------------------------------------------
# .gitmodules transformations
# ---------------------------------------------------------------------------

def remove_submodule_sections(content: str, paths: set[str]) -> str:
    """Remove entire [submodule "..."] sections whose 'path' is in *paths*."""
    # Split on section boundaries, keeping the delimiter attached to each section.
    sections = re.split(r'(?=^\[)', content, flags=re.MULTILINE)
    kept = []
    for section in sections:
        if section.startswith('[submodule '):
            m = re.search(r'^\s*path\s*=\s*(.+)$', section, re.MULTILINE)
            if m and m.group(1).strip() in paths:
                print(f'  Removing submodule: {m.group(1).strip()}')
                continue
        kept.append(section)
    return ''.join(kept)


def remap_urls(content: str, gitlab_host: str, project_path: str,
               url_map: dict[str, str]) -> str:
    """Resolve relative URLs and apply prefix mapping."""

    def replace(match: re.Match) -> str:
        indent = match.group(1)
        url    = match.group(2)

        abs_url = url
        if url.startswith('.'):
            resolved = resolve_relative_url(project_path, url)
            abs_url  = f'git@{gitlab_host}:{resolved}'

        for gitlab_prefix, github_prefix in url_map.items():
            if abs_url.startswith(gitlab_prefix):
                new_url = github_prefix + abs_url[len(gitlab_prefix):]
                print(f'  {url!r:50s} -> {new_url!r}')
                return f'{indent}url = {new_url}'

        return match.group(0)   # no mapping → keep as-is

    return re.sub(r'^([ \t]*)url\s*=\s*(\S+)', replace, content, flags=re.MULTILINE)


def transform(path: str, gitlab_host: str, project_path: str,
              url_map: dict[str, str], remove_paths: set[str]) -> bool:
    """Transform *path* in-place.  Returns True if the file changed."""
    if not os.path.exists(path):
        print(f'{path} not found, nothing to transform')
        return False

    with open(path, encoding='utf-8', newline='') as f:
        original = f.read()

    # Normalize line endings so regexes work regardless of OS
    content = original.replace('\r\n', '\n').replace('\r', '\n')
    if remove_paths:
        content = remove_submodule_sections(content, remove_paths)
    if url_map:
        content = remap_urls(content, gitlab_host, project_path, url_map)

    if content == original.replace('\r\n', '\n').replace('\r', '\n'):
        return False

    with open(path, 'w', encoding='utf-8', newline='\n') as f:
        f.write(content)
    return True


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

if __name__ == '__main__':
    gitlab_host   = os.environ.get('CI_SERVER_HOST', 'gitlab.com')
    project_path  = os.environ.get('CI_PROJECT_PATH', '')
    raw_map       = os.environ.get('GITHUB_URL_MAP', '')
    raw_remove    = os.environ.get('GITHUB_REMOVE_SUBMODULES', '')

    if not project_path:
        print('CI_PROJECT_PATH is not set', file=sys.stderr)
        sys.exit(1)

    url_map      = parse_url_map(raw_map)
    remove_paths = parse_remove_list(raw_remove)

    changed = transform('.gitmodules', gitlab_host, project_path, url_map, remove_paths)
    print('.gitmodules transformed' if changed else '.gitmodules: no changes needed')
