#!/usr/bin/env bash
# MVP-Execution-Engine — Phase 1 initializer
# Usage: ./skills/mvp-execution-engine/init-mvp.sh "Product Name"
# Instantiates docs/ from skills/mvp-execution-engine/templates/, substituting
# {{PRODUCT_NAME}} and {{DATE}} tokens. Refuses to overwrite an existing docs/.

set -euo pipefail

if [[ $# -lt 1 || -z "${1// }" ]]; then
  echo "Usage: $0 \"Product Name\"" >&2
  exit 1
fi

PRODUCT_NAME="$1"
DATE="$(date +%Y-%m-%d)"
SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SKILL_DIR/../.." && pwd)"
TEMPLATES="$SKILL_DIR/templates"
DOCS="$ROOT/docs"

if [[ ! -d "$TEMPLATES" ]]; then
  echo "Error: blueprint folder not found: $TEMPLATES" >&2
  exit 1
fi

if [[ -d "$DOCS" ]]; then
  echo "Error: $DOCS already exists. Remove it or work from the existing specs." >&2
  exit 1
fi

mkdir -p "$DOCS"

for template in "$TEMPLATES"/*.md; do
  target="$DOCS/$(basename "$template")"
  sed -e "s/{{PRODUCT_NAME}}/$(printf '%s' "$PRODUCT_NAME" | sed 's/[&/\]/\\&/g')/g" \
      -e "s/{{DATE}}/$DATE/g" \
      "$template" > "$target"
  echo "  created $target"
done

cat <<EOF

✔ Spec scaffold ready for: $PRODUCT_NAME

Next steps:
  Phase 0 — docs/00-research.md (market & competitors) and docs/01-vision.md (PR-FAQ)
  Phase 1 — docs/02-product-spec.md → 03-design-system.md → 04-engineering-architecture.md
            → 05-quality-security.md → 06-launch.md → 07-foundation.md
  Then resolve all TBDs in Must-have sections and approve the gate in
  docs/README.md to unlock Phase 2 (code generation).

Or let the agent do everything: /mvp-execution-engine $PRODUCT_NAME — <full product brief>
EOF
