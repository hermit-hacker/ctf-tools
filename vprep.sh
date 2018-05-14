#!/bin/bash
INPUTFILE=$1
OUTPUTFILE=$2

echo "<code>" > ${OUTPUTFILE}
base64 ${INPUTFILE} | sed -e "s/$/<br>/" >> ${OUTPUTFILE}
echo "</code>" >> ${OUTPUTFILE}
