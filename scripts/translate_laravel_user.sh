#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE_DIR="$ROOT_DIR/templates/laravel-user-to-go"

. "$SCRIPT_DIR/common.sh"

usage() {
  cat <<'EOF'
Usage:
  translate_laravel_user.sh [--force] <target-dir> <module-name> [source-model-name] [resource-name]

Example:
  translate_laravel_user.sh /tmp/demo-app github.com/acme/demo App\\Models\\User User
  translate_laravel_user.sh --force /tmp/demo-app github.com/acme/demo App\\Models\\User User
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
SOURCE_MODEL_VALUE="${3:-}"
RESOURCE_NAME_VALUE="${4:-}"

require_non_empty "target-dir" "$TARGET_DIR"
require_non_empty "module-name" "$MODULE_NAME_VALUE"
assert_safe_module_name "$MODULE_NAME_VALUE"

if [[ -z "$SOURCE_MODEL_VALUE" ]]; then
  SOURCE_MODEL_VALUE="App\\Models\\User"
fi

if [[ -z "$RESOURCE_NAME_VALUE" ]]; then
  RESOURCE_NAME_VALUE="User"
fi

assert_safe_identifier "resource-name" "$RESOURCE_NAME_VALUE"

RESOURCE_VAR_VALUE="$(printf '%s' "$RESOURCE_NAME_VALUE" | tr '[:upper:]' '[:lower:]')"
RESOURCE_TABLE_VALUE="${RESOURCE_VAR_VALUE}s"
RESOURCE_NAME_PLURAL_VALUE="${RESOURCE_NAME_VALUE}s"

assert_safe_identifier "resource-name-plural" "$RESOURCE_NAME_PLURAL_VALUE"
assert_safe_identifier "resource-var" "$RESOURCE_VAR_VALUE"
assert_safe_identifier "resource-table" "$RESOURCE_TABLE_VALUE"

export MODULE_NAME="$MODULE_NAME_VALUE"
export SOURCE_MODEL="$SOURCE_MODEL_VALUE"
export RESOURCE_NAME="$RESOURCE_NAME_VALUE"
export RESOURCE_NAME_PLURAL="$RESOURCE_NAME_PLURAL_VALUE"
export RESOURCE_VAR="$RESOURCE_VAR_VALUE"
export RESOURCE_TABLE="$RESOURCE_TABLE_VALUE"

require_command python3
assert_directory_exists_or_create "$TARGET_DIR/internal/handler"
assert_directory_exists_or_create "$TARGET_DIR/internal/service"
assert_directory_exists_or_create "$TARGET_DIR/internal/request"
assert_directory_exists_or_create "$TARGET_DIR/internal/router"
assert_directory_exists_or_create "$TARGET_DIR/docs/migration"

log "translate Laravel user templates into $TARGET_DIR"
log "module=$MODULE_NAME"
log "source_model=$SOURCE_MODEL"
log "resource=$RESOURCE_NAME"
log "force_overwrite=$FORCE_OVERWRITE"

while IFS= read -r -d '' src; do
  rel="${src#${TEMPLATE_DIR}/}"
  dest_rel="${rel%.tpl}"
  case "$dest_rel" in
    user_handler.go) dest="$TARGET_DIR/internal/handler/${RESOURCE_VAR}_handler.go" ;;
    user_service.go) dest="$TARGET_DIR/internal/service/${RESOURCE_VAR}_service.go" ;;
    user_request.go) dest="$TARGET_DIR/internal/request/${RESOURCE_VAR}_request.go" ;;
    user_routes.go) dest="$TARGET_DIR/internal/router/${RESOURCE_VAR}_routes.go" ;;
    user_model_mapping.md) dest="$TARGET_DIR/docs/migration/${RESOURCE_VAR}_model_mapping.md" ;;
    *) dest="$TARGET_DIR/$dest_rel" ;;
  esac
  render_template_file "$src" "$dest"
  log "rendered ${dest#$TARGET_DIR/}"
done < <(find "$TEMPLATE_DIR" -type f -print0)

log "laravel user migration templates generated successfully"
log "next steps:"
log "  review docs/migration/${RESOURCE_VAR}_model_mapping.md"
log "  align request fields with your real Laravel model"
log "  wire ${RESOURCE_VAR}_routes.go into your main router"
log "  adapt service methods to your actual auth flow"
