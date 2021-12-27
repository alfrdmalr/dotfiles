#!bin/bash

#"compile latex"
cl() {
  local FILENAME=${1}
  pdflatex $FILENAME.tex
  biber $FILENAME
  pdflatex $FILENAME.tex
}
