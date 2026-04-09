#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE_DIR="$ROOT_DIR/templates/gin-gorm-crud-resource"

. "$SCRIPT_DIR/common.sh"

usage() {
  cat <<'EOF'
Usage:
  generate_crud.sh [--force] <target-internal-dir> <ResourceName> [resource_table] [resource_name_plural] [resource_var]

Example:
  generate_crud.sh /tmp/demo-app/internal Product products Products product
  generate_crud.sh --force /tmp/demo-app/internal Product products Products product
EOF
}

FORCE_OVERWRITE=0
if [[ "${1:-}" == "--force" ]]; then
  FORCE_OVERWRITE=1
  shift
fi
export FORCE_OVERWRITE

TARGET_INTERNAL_DIR="${1:-}"
RESOURCE_NAME_VALUE="${2:-}"
RESOURCE_TABLE_VALUE="${3:-}"
RESOURCE_NAME_PLURAL_VALUE="${4:-}"
RESOURCE_VAR_VALUE="${5:-}"

require_non_empty "target-internal-dir" "$TARGET_INTERNAL_DIR"
require_non_empty "resource-name" "$RESOURCE_NAME_VALUE"
assert_safe_identifier "resource-name" "$RESOURCE_NAME_VALUE"

if [[ -z "$RESOURCE_VAR_VALUE" ]]; then
  RESOURCE_VAR_VALUE="$(printf '%s' "$RESOURCE_NAME_VALUE" | tr '[:upper:]' '[:lower:]')"
fi

if [[ -z "$RESOURCE_TABLE_VALUE" ]]; then
  RESOURCE_TABLE_VALUE="${RESOURCE_VAR_VALUE}s"
fi

if [[ -z "$RESOURCE_NAME_PLURAL_VALUE" ]]; then
  RESOURCE_NAME_PLURAL_VALUE="${RESOURCE_NAME_VALUE}s"
fi

assert_safe_identifier "resource-name-plural" "$RESOURCE_NAME_PLURAL_VALUE"
assert_safe_identifier "resource-var" "$RESOURCE_VAR_VALUE"
assert_safe_identifier "resource-table" "$RESOURCE_TABLE_VALUE"

export RESOURCE_NAME="$RESOURCE_NAME_VALUE"
export RESOURCE_NAME_PLURAL="$RESOURCE_NAME_PLURAL_VALUE"
export RESOURCE_VAR="$RESOURCE_VAR_VALUE"
export RESOURCE_TABLE="$RESOURCE_TABLE_VALUE"

require_command python3
assert_directory_exists_or_create "$TARGET_INTERNAL_DIR"

log "generate crud module into $TARGET_INTERNAL_DIR"
log "resource=$RESOURCE_NAME"
log "resource_plural=$RESOURCE_NAME_PLURAL"
log "resource_var=$RESOURCE_VAR"
log "resource_table=$RESOURCE_TABLE"
log "force_overwrite=$FORCE_OVERWRITE"

while IFS= read -r -d '' src; do
  rel="${src#${TEMPLATE_DIR}/internal/}"
  dest_rel="${rel%.tpl}"
  dest_rel="${dest_rel//resource/${RESOURCE_VAR}}"
  dest="$TARGET_INTERNAL_DIR/$dest_rel"
  render_template_file "$src" "$dest"
  log "rendered $dest_rel"
done < <(find "$TEMPLATE_DIR/internal" -type f -print0)

log "crud module generated successfully"
log "next steps:"
log "  review generated request / response / service / handler / router files"
log "  mount router entries into your main router"
log "  fill model fields and business logic"
