#!/usr/bin/env bash
# Concatenates the numbered NN-*.md source files into a single deck.md
# for reveal-md: each file becomes a horizontal slide (separated by ---),
# each "## " heading inside a file becomes a vertical slide (separated by ----).
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root_dir"

out="deck.md"
: > "$out"

first=true
shopt -s nullglob
for f in [0-9][0-9]-*.md; do
  if [ "$first" = true ]; then
    first=false
  else
    printf '\n\n---\n\n' >> "$out"
  fi
  awk '
    NR==1 { print; next }
    /^## / { print ""; print "----"; print "" }
    { print }
  ' "$f" >> "$out"
done
shopt -u nullglob

echo "Wrote $out from $(ls [0-9][0-9]-*.md | wc -l | tr -d ' ') source files."
