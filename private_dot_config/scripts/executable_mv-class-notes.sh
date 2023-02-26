#!/bin/bash

# This will check for the existance of an "Untitled Document.pdf" and then it will convert it to my file naming 
# convention in the class-notes folder

date=$(date -I)
if [ -f "/home/ralldi/Downloads/Untitled document.pdf" ]
then
  touch /home/ralldi/Downloads/class-notes/$@-$date.pdf &&
  mv "/home/ralldi/Downloads/Untitled document.pdf" "/home/ralldi/Downloads/class-notes/$@-$date.pdf"
  exit 0
else
  echo "There is no 'Untitled Document.pdf'."
  echo "Did you download the document?"
  exit 1
fi
