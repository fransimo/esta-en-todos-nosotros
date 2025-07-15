#!/bin/bash


# remove front matter and converto to docx

sed '1{/^---$/!q;};1,/^---$/d' _index.es.md > tmp.md

pandoc tmp.md -t docx -o tmp.docx

pandoc tmp.md  -f gfm -t pdf -o tmp.pdf  \
      --include-in-header pdf_prop.tex \
      -V geometry:"portrait, margin=2cm, a4paper" \
      -V mainfont="DejaVu Serif" \
      -V monofont="DejaVu Sans Mono" \
      -V fontsize=12pt ## --toc
