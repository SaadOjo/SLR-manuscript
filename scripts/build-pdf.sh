#!/usr/bin/env bash
set -euo pipefail

TEXBIN="$HOME/Library/TinyTeX/bin/universal-darwin"
if [[ -d "$TEXBIN" ]]; then
  export PATH="$TEXBIN:$PATH"
fi

if ! command -v latexmk >/dev/null 2>&1; then
  echo "latexmk not found. Run scripts/setup-tex.sh first." >&2
  exit 1
fi

MAIN_TEX="${1:-main-ijim-di.tex}"

if [[ ! -f "$MAIN_TEX" ]]; then
  echo "TeX source not found: $MAIN_TEX" >&2
  echo "Usage: scripts/build-pdf.sh [main-ijim-di.tex]" >&2
  exit 1
fi

latexmk -pdf -interaction=nonstopmode -file-line-error "$MAIN_TEX"

echo "Built ${MAIN_TEX%.tex}.pdf"
