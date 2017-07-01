#!/bin/bash

FILENAMES=${1}/*.bc

for FILE in ${FILENAMES}
do
  FILE_NO_EXT=${FILE%.*}
  for ARG in $(seq 5)
  do
    klee --optimize --emit-all-errors --libc=uclibc --posix-runtime --only-output-states-covering-new --write-smt2s --use-query-log=solver:smt2 --output-dir=klee-out-${FILE_NO_EXT##*/}-KleeSymArg_${ARG} ./${FILE} --sym-arg ${ARG}
    wait
  done
done


