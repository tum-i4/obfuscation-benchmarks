#!/bin/bash

# 1st argument the directory of the obfuscated binaries (should have the same names as the C files)
# 2nd argument the name of the text/CSV file where the results of the run will be stored
# 3rd Argument is the maximum length of the symbolic input

FILES=${1}/*.c

FOUND=0

for FILENAME in $FILES
do
  FILE_W_EXT=${FILENAME##*/} # with extensions
  F=${FILE_W_EXT%.*}         # without extension
  echo ${FILENAME}

  gcc ${FILENAME} -o ${F}
  now=$(date)
  echo "Started symex at ${now}"
  timeout 3600s ipython ./angr-symex.py ${F} ${3} ${2}
done

