#!/usr/bin/env bash
set -euo pipefail

log() {
  printf '[php-to-go-helper] %s\n' "$*"
}

die() {
  printf '[php-to-go-helper] ERROR: %s\n' "$*" >&2
  exit 1
}

require_command() {
  command -v "$1" >/dev/null 2>&1 || die "missing required command: $1"
}

ensure_dir() {
  mkdir -p "$1"
}

require_non_empty() {
  local name="$1"
  local value="$2"
  [[ -n "$value" ]] || die "$name is required"
}

assert_safe_identifier() {
  local name="$1"
  local value="$2"
  [[ "$value" =~ ^[A-Za-z][A-Za-z0-9_]*$ ]] || die "$name must match ^[A-Za-z][A-Za-z0-9_]*$"
}

assert_safe_module_name() {
  local value="$1"
  [[ "$value" =~ ^[A-Za-z0-9._/-]+$ ]] || die "module name contains unsafe characters"
}

assert_directory_exists_or_create() {
  local dir="$1"
  ensure_dir "$dir"
}

ensure_writable_target() {
  local dest="$1"
  local force="${FORCE_OVERWRITE:-0}"
  if [[ -e "$dest" && "$force" != "1" ]]; then
    die "target already exists: $dest (use --force to overwrite)"
  fi
}

render_template_file() {
  local src="$1"
  local dest="$2"

  ensure_dir "$(dirname "$dest")"
  ensure_writable_target "$dest"

  python3 - "$src" "$dest" <<'PY'
from pathlib import Path
import os
import sys

src = Path(sys.argv[1])
dest = Path(sys.argv[2])
text = src.read_text()

replacements = {
    '{{MODULE_NAME}}': os.environ.get('MODULE_NAME', ''),
    '{{APP_NAME}}': os.environ.get('APP_NAME', ''),
    '{{DB_NAME}}': os.environ.get('DB_NAME', ''),
    '{{RESOURCE_NAME}}': os.environ.get('RESOURCE_NAME', ''),
    '{{RESOURCE_NAME_PLURAL}}': os.environ.get('RESOURCE_NAME_PLURAL', ''),
    '{{RESOURCE_VAR}}': os.environ.get('RESOURCE_VAR', ''),
    '{{RESOURCE_TABLE}}': os.environ.get('RESOURCE_TABLE', ''),
    '{{SOURCE_MODEL}}': os.environ.get('SOURCE_MODEL', ''),
}

for old, new in replacements.items():
    text = text.replace(old, new)

dest.write_text(text)
PY
}
