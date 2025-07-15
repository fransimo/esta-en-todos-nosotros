#!/bin/bash


# remove front matter and converto to docx

sed '1{/^---$/!q;};1,/^---$/d' _index.es.md > tmp.md

pandoc tmp.md -t docx -o tmp.docx

pandoc tmp.md  -f gfm -t pdf -o tmp.pdf  -V geometry:"portrait, margin=2cm, a4paper" -V mainfont="DejaVu Serif" -V monofont="DejaVu Sans Mono"  ## --toc
