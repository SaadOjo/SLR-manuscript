#!/usr/bin/env bash
set -euo pipefail

TEXBIN="$HOME/Library/TinyTeX/bin/universal-darwin"
TEXLIVE_ROOT="$HOME/Library/TinyTeX"
ZSHRC="$HOME/.zshrc"
PATH_LINE='export PATH="$HOME/Library/TinyTeX/bin/universal-darwin:$PATH"'

if [[ ! -x "$TEXBIN/pdflatex" ]]; then
  echo "Installing TinyTeX to $TEXLIVE_ROOT ..."
  curl -sL https://yihui.org/tinytex/install-bin-unix.sh | sh
else
  echo "TinyTeX already installed at $TEXLIVE_ROOT"
fi

export PATH="$TEXBIN:$PATH"

if [[ -f "$ZSHRC" ]]; then
  if ! grep -Fq "$PATH_LINE" "$ZSHRC"; then
    printf '\n%s\n' "$PATH_LINE" >> "$ZSHRC"
    echo "Added TinyTeX to PATH in $ZSHRC"
  fi
else
  printf '%s\n' "$PATH_LINE" > "$ZSHRC"
  echo "Created $ZSHRC with TinyTeX PATH"
fi

echo "Installing required TeX Live collections ..."
tlmgr install \
  collection-latexrecommended \
  collection-latexextra \
  collection-fontsrecommended \
  collection-pictures

echo "Setup complete. Open a new shell or run:"
echo "  export PATH=\"$TEXBIN:\$PATH\""
echo "Then build with:"
echo "  scripts/build-pdf.sh main-ijim-di.tex"
