#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE_DIR="$ROOT_DIR/templates/gin-gorm-jwt-starter"

. "$SCRIPT_DIR/common.sh"

usage() {
  cat <<'EOF'
Usage:
  init_gin_gorm_jwt.sh [--force] <target-dir> <module-name> [app-name] [db-name]

Example:
  init_gin_gorm_jwt.sh /tmp/demo-app github.com/acme/demo demo-app demo_app
  init_gin_gorm_jwt.sh --force /tmp/demo-app github.com/acme/demo demo-app demo_app
EOF
}

FORCE_OVERWRITE=0
if [[ "${1:-}" == "--force" ]]; then
  FORCE_OVERWRITE=1
  shift
fi
export FORCE_OVERWRITE

TARGET_DIR="${1:-}"
MODULE_NAME_VALUE="${2:-}"
APP_NAME_VALUE="${3:-}"
DB_NAME_VALUE="${4:-}"

require_non_empty "target-dir" "$TARGET_DIR"
require_non_empty "module-name" "$MODULE_NAME_VALUE"
assert_safe_module_name "$MODULE_NAME_VALUE"

if [[ -z "$APP_NAME_VALUE" ]]; then
  APP_NAME_VALUE="$(basename "$TARGET_DIR")"
fi

if [[ -z "$DB_NAME_VALUE" ]]; then
  DB_NAME_VALUE="$(basename "$TARGET_DIR" | tr '-' '_')"
fi

assert_safe_identifier "db-name" "$DB_NAME_VALUE"

export MODULE_NAME="$MODULE_NAME_VALUE"
export APP_NAME="$APP_NAME_VALUE"
export DB_NAME="$DB_NAME_VALUE"

require_command python3
assert_directory_exists_or_create "$TARGET_DIR"

log "render starter into $TARGET_DIR"
log "module=$MODULE_NAME"
log "app=$APP_NAME"
log "db=$DB_NAME"
log "force_overwrite=$FORCE_OVERWRITE"

while IFS= read -r -d '' src; do
  rel="${src#${TEMPLATE_DIR}/}"
  dest_rel="${rel%.tpl}"
  dest="$TARGET_DIR/$dest_rel"
  render_template_file "$src" "$dest"
  log "rendered $dest_rel"
done < <(find "$TEMPLATE_DIR" -type f -print0)

log "starter project generated successfully"
log "next steps:"
log "  cd $TARGET_DIR"
log "  cp .env.example .env"
log "  go mod tidy"
log "  go run ./cmd/api"
