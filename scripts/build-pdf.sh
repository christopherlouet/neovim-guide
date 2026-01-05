#!/usr/bin/env bash

set -euo pipefail

# ----------------------------------------
# Configuration
# ----------------------------------------
PROJECT_ROOT="$(pwd)"
TMP_DIR="/tmp/neovim-guide-pdf"
OUT_PDF="guide-neovim.pdf"

STATIC_PDF_DIR="$PROJECT_ROOT/static/pdf"

# ----------------------------------------
# Préparation
# ----------------------------------------
echo "📦 Préparation…"
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"
mkdir -p "$STATIC_PDF_DIR"

# ----------------------------------------
# Ordre pédagogique strict des chapitres
# ----------------------------------------
FILES=(
  docs/index.md

  docs/fondations/mental-model.md

  docs/productivite/navigation.md
  docs/productivite/edition.md

  docs/ecosysteme/lsp.md
  docs/ecosysteme/qualite.md

  docs/workflow/diagnostics.md
  docs/workflow/git.md
  docs/workflow/terminal.md
  docs/workflow/sessions.md

  docs/personnalisation/react-workflow.md
  docs/personnalisation/config.md
  docs/personnalisation/customisation.md
  docs/personnalisation/autonomie.md

  docs/annexes/cheatsheet.md
)

# ----------------------------------------
# Copie + nettoyage Markdown (XeLaTeX safe)
# ----------------------------------------
echo "🧹 Copie et nettoyage des fichiers Markdown…"

for src in "${FILES[@]}"; do
  filename="$(basename "$src")"
  dest="$TMP_DIR/$filename"

  cp "$src" "$dest"

  # Suppression caractères problématiques (emojis, symboles)
  sed -i \
    -e 's/👉/->/g' \
    -e 's/➡️/->/g' \
    -e 's/➡/->/g' \
    -e 's/🧭//g' \
    -e 's/📘//g' \
    -e 's/✅//g' \
    -e 's/❌//g' \
    "$dest"
done

# ----------------------------------------
# Génération du PDF
# ----------------------------------------
echo "📘 Génération du PDF (ordre pédagogique garanti)…"

pandoc \
  "$TMP_DIR/index.md" \
  "$TMP_DIR/mental-model.md" \
  "$TMP_DIR/navigation.md" \
  "$TMP_DIR/edition.md" \
  "$TMP_DIR/lsp.md" \
  "$TMP_DIR/qualite.md" \
  "$TMP_DIR/diagnostics.md" \
  "$TMP_DIR/git.md" \
  "$TMP_DIR/terminal.md" \
  "$TMP_DIR/sessions.md" \
  "$TMP_DIR/react-workflow.md" \
  "$TMP_DIR/config.md" \
  "$TMP_DIR/customisation.md" \
  "$TMP_DIR/autonomie.md" \
  "$TMP_DIR/cheatsheet.md" \
  -o "$TMP_DIR/$OUT_PDF" \
  --toc \
  --toc-depth=3 \
  --pdf-engine=xelatex \
  -V geometry:margin=2.5cm \
  -V fontsize=11pt \
  -V mainfont="DejaVu Serif" \
  -V monofont="DejaVu Sans Mono"

# ----------------------------------------
# Copie finale vers Docusaurus (statique)
# ----------------------------------------
echo "🚚 Copie du PDF vers static/pdf…"

cp "$TMP_DIR/$OUT_PDF" "$STATIC_PDF_DIR/$OUT_PDF"

echo "✅ PDF prêt et publiable"
echo "   → static/pdf/$OUT_PDF"
