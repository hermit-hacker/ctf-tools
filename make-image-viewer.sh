#!/bin/bash

read -p "What is the prefix for the files? " PREFIX
read -p "What extension of the files? " FILEEXT

echo "Processing... hopefully you won't see any errors below this!"
echo "------------------------------------------------------------"
echo "<HTML>" > image-viewer.html
echo "<BODY>" >> image-viewer.html
ls -la ${PREFIX}* | awk '{print $9}' | sed -e "s/${PREFIX}/\<img src=\"${PREFIX}/" | sed -e "s/${FILEEXT}/${FILEEXT}\" height=\"25\%\"\>/" >> image-viewer.html
echo "</BODY></HTML>" >> image-viewer.html
echo "------------------------------------------------------------"
echo "Done!"
firefox image-viewer.html
