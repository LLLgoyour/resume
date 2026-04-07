#!/bin/bash

set -e

# Resolve Typst even when PATH is limited (e.g., some VS Code runners).
TYPST_BIN="$(command -v typst || true)"
if [ -z "$TYPST_BIN" ] && [ -x "/opt/homebrew/bin/typst" ]; then
  TYPST_BIN="/opt/homebrew/bin/typst"
fi
if [ -z "$TYPST_BIN" ] && [ -x "/usr/local/bin/typst" ]; then
  TYPST_BIN="/usr/local/bin/typst"
fi
if [ -z "$TYPST_BIN" ]; then
  echo "Error: typst command not found."
  echo "Install Typst (e.g., 'brew install typst') or add it to PATH."
  exit 127
fi

rm -f *.pdf

files=("resume-cn" "cv" "resume" "resume-job")
echo "Generating..."

for f in "${files[@]}"; do
  {
    echo '#import "main.typ": *;'
    echo '#show: chicv'
  } > "$f.typ"
done

echo '#runReader(Chinese)' >> "resume-cn.typ"
echo '#runReader(Simplified)' >> "cv.typ"
echo '#runReader(EnglishFull)' >> "resume.typ"
echo '#runReader(JobApplication)' >> "resume-job.typ"

for f in "${files[@]}"; do
  echo "Building $f.typ"
  "$TYPST_BIN" compile "$f.typ"
  rm "$f.typ"
done
