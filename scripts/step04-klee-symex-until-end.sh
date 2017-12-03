#!/bin/bash

# 1st Argument the name of the directory where the C files that must be symbolically executed resides.
# 2nd Argument is the maximum length of the symbolic input

FILENAMES=${1}/*.bc

for FILE in ${FILENAMES}
do
  FILE_NO_EXT=${FILE%.*}
  for ARG in $(seq ${2})
  do
    klee --optimize --emit-all-errors --libc=uclibc --posix-runtime --only-output-states-covering-new --write-smt2s --use-query-log=solver:smt2 --output-dir=klee-out-${FILE_NO_EXT##*/}-KleeSymArg_${ARG} ./${FILE} --sym-arg ${ARG}
    wait
  done
done


