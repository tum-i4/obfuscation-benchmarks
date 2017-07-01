#!/bin/bash

FILES=./*.c

for FILENAME in $FILES
do
  FILE_W_EXT=${FILENAME##*/}
  F=${FILE_W_EXT%.*}
  echo ${FILE_W_EXT}
  
  ./generate-obfuscated.sh ${F}
done
