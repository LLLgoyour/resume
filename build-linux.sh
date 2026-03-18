#!/bin/bash

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
  typst compile "$f.typ"
  rm "$f.typ"
done
