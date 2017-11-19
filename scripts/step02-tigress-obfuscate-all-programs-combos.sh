#!/bin/bash

# 1st Argument the directory where the unobfuscated C files reside

FILES=${1}/*.c

for FILENAME in $FILES
do
  FILE_W_EXT=${FILENAME##*/}
  F=${FILE_W_EXT%.*}
  echo ${FILE_W_EXT}

  ${HOME}/scripts/generate-obfuscated.sh ${F}
done
