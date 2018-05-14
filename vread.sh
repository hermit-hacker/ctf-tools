#!/bin/bash
ARTICLE=$1
TMPFILE=`mktemp`
OUTFILE=`mktemp`

wget -O - https://vectivus.com/${ARTICLE} 2>/dev/null > ${TMPFILE}

grep '<br/>' ${TMPFILE}  | sed -e 's/<.*p>//g' -e 's/<.*code>//' -e 's/<br\/>//' > ${OUTFILE}

echo "====================================================="
base64 -d ${OUTFILE}
echo ""
echo "====================================================="

rm -f ${TMPFILE}
rm -f ${OUTFILE}
