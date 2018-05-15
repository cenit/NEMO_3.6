#!/bin/bash

sed -i -e 's#\\documentclass#%\\documentclass#' -e '/{document}/ s/^/%/' TexFiles/Chapters/*.tex
sed -i    '30,${s#\\subfile{#\\include{#g}'                                    NEMO_book.tex
latex NEMO_book && makeindex NEMO_book && bibtex NEMO_book
mkdir -p html
latex2html -local_icons -no_footnode -split 4 -link 2 -dir html $*
sed -i -e 's#%\\documentclass#\\documentclass#' -e '/{document}/ s/^%//' TexFiles/Chapters/*.tex
sed -i    '30,${s#\\include{#\\subfile{#g}'                                    NEMO_book.tex

exit 0
