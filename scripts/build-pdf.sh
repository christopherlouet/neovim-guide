#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(pwd)"
TMP_DIR="/tmp/neovim-guide-pdf"
OUT_PDF="guide-neovim.pdf"

STATIC_PDF_DIR="$PROJECT_ROOT/static/pdf"
BUILD_PDF_DIR="$PROJECT_ROOT/build/neovim-guide/pdf"

echo "📦 Préparation…"
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

echo "📁 Création des dossiers de destination…"
mkdir -p "$STATIC_PDF_DIR"
mkdir -p "$BUILD_PDF_DIR"

# --------------------------------------------------
# ORDRE PÉDAGOGIQUE STRICT (NE PAS MODIFIER À LA VOLÉE)
# --------------------------------------------------
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

echo "🧹 Copie et nettoyage des fichiers Markdown…"

for src in "${FILES[@]}"; do
  filename="$(basename "$src")"
  dest="$TMP_DIR/$filename"

  cp "$src" "$dest"

  # Nettoyage caractères problématiques pour XeLaTeX / PDF
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

echo "📘 Génération du PDF (ordre strict garanti)…"

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

echo "🚚 Copie du PDF vers les emplacements attendus…"

# Pour Docusaurus (fichiers statiques)
cp "$TMP_DIR/$OUT_PDF" "$STATIC_PDF_DIR/$OUT_PDF"

# Pour le link checker Docusaurus (build output)
cp "$TMP_DIR/$OUT_PDF" "$BUILD_PDF_DIR/$OUT_PDF"

echo "✅ PDF généré et copié avec succès"
echo "   - static/pdf/$OUT_PDF"
echo "   - build/neovim-guide/pdf/$OUT_PDF"
