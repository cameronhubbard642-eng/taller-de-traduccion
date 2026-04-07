#!/bin/bash
set -e

# Taller de Traducción — Update Script
# Copies taller-de-traduccion.html to all deployment targets.
# Usage: ./update.sh          (copy only)
#        ./update.sh --push   (copy + git push gh-pages)

ROOT="/Users/cameronhubbard/Documents/Claude/Projects/Spanish"
HTML="$ROOT/taller-de-traduccion.html"

if [ ! -f "$HTML" ]; then
  echo "ERROR: Source file not found: $HTML"
  exit 1
fi

echo "Updating from: $HTML"

# 1. gh-pages-deploy
TARGET="$ROOT/gh-pages-deploy/index.html"
cp "$HTML" "$TARGET"
echo "  → gh-pages-deploy/index.html"

# 2. Share folder HTML
TARGET="$ROOT/Taller de Traducción Share/taller-de-traduccion.html"
cp "$HTML" "$TARGET"
echo "  → Share folder HTML"

# 3. Single-arch app Resources (if exists)
TARGET="$ROOT/Taller de Traducción.app/Contents/Resources/taller-de-traduccion.html"
if [ -d "$ROOT/Taller de Traducción.app" ]; then
  cp "$HTML" "$TARGET"
  echo "  → Taller de Traducción.app/Contents/Resources/"
else
  echo "  · Taller de Traducción.app not found (skipped)"
fi

# 4. Universal app Resources (if exists)
TARGET="$ROOT/Taller de Traducción (Universal).app/Contents/Resources/taller-de-traduccion.html"
if [ -d "$ROOT/Taller de Traducción (Universal).app" ]; then
  cp "$HTML" "$TARGET"
  echo "  → Universal app Resources/"
else
  echo "  · Universal app not found (skipped)"
fi

# 5. Share folder's universal app Resources (if exists)
TARGET="$ROOT/Taller de Traducción Share/Taller de Traducción (Universal).app/Contents/Resources/taller-de-traduccion.html"
if [ -d "$ROOT/Taller de Traducción Share/Taller de Traducción (Universal).app" ]; then
  cp "$HTML" "$TARGET"
  echo "  → Share folder universal app Resources/"
else
  echo "  · Share folder universal app not found (skipped)"
fi

# 6. Stage and commit in gh-pages-deploy
cd "$ROOT/gh-pages-deploy"
if git rev-parse --git-dir > /dev/null 2>&1; then
  git add -A
  if ! git diff --cached --quiet; then
    git commit -m "Update app $(date +%Y-%m-%d_%H%M)"
    echo "  → Committed in gh-pages-deploy"
  else
    echo "  · No changes to commit in gh-pages-deploy"
  fi
else
  echo "  · gh-pages-deploy is not a git repo (skipping commit)"
fi

# 7. Push if --push flag
if [ "$1" = "--push" ]; then
  if git rev-parse --git-dir > /dev/null 2>&1; then
    git push
    echo "  → Pushed to GitHub"
  else
    echo "  · Cannot push: gh-pages-deploy is not a git repo"
  fi
fi

echo "Done."
