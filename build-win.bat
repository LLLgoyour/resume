@echo off
del *.pdf

set files=resume-cn,resume,resume-elab
echo Generating...

for %%f in (%files%) do (
  (
    echo #import "main.typ": *;
    echo #show: chicv
  ) > %%f.typ
)

echo #runReader(Chinese) >> resume-cn.typ
echo #runReader(Simplified) >> cv.typ
echo #runReader(EnglishFull) >> resume.typ

for %%f in (%files%) do (
  echo Building %%f.typ
  typst compile %%f.typ
  del %%f.typ
)
