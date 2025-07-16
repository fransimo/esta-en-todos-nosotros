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

exit 0

curl -X 'POST' \
  'http://localhost:5555/translate_file' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'file=@tmp.docx;type=application/vnd.openxmlformats-officedocument.wordprocessingml.document' \
  -F 'source=es' \
  -F 'target=en' \
  -F 'api_key=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'

{
  "translatedFileUrl": "http://localhost:5555/download_file/0537aa1f-2271-4026-8c25-c71f4c5a3056.tmp_en.docx"
}




# export API_KEY=...
#
# curl -X POST 'https://api-free.deepl.com/v2/translate' \
  #--header 'Authorization: DeepL-Auth-Key [yourAuthKey]' \
  #--header 'Content-Type: application/json' \
  #--data '{
  #    "text": [
  #        "Hello, world!"
  #    ],
  #    "target_lang": "DE"
  #}'
# curl -X POST 'https://api-free.deepl.com/v2/translate' \
#  --header 'Authorization: DeepL-Auth-Key $API_KEY' \
#  --form 'target_lang=EN' \
#  --form 'file=@tmp.docx'