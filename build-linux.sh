#!/bin/bash

rm -f *.pdf

files=("resume-cn" "cv" "resume")
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

for f in "${files[@]}"; do
  echo "Building $f.typ"
  typst compile "$f.typ"
  rm "$f.typ"
done
