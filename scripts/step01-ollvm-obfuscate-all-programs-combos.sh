#!/bin/bash
# 1st argument is directory where all the original C files are located
# 2nd argument is the full path to your OLLVM installation

FILENAMES=${1}/*.c
OLLVM=${2}

for FILE in ${FILENAMES}
do
  FILE_NO_EXT=${FILE%.*}
    ${OLLVM} -emit-llvm -c -mllvm -fla ${FILE} -o "${FILE_NO_EXT}-fla.bc" 
    ${OLLVM} -emit-llvm -c -mllvm -sub ${FILE} -o "${FILE_NO_EXT}-sub.bc"
    ${OLLVM} -emit-llvm -c -mllvm -bcf ${FILE} -o "${FILE_NO_EXT}-bcf.bc"
    ${OLLVM} -emit-llvm -c -mllvm -fla -mllvm -sub ${FILE} -o "${FILE_NO_EXT}-fla_sub.bc"
    ${OLLVM} -emit-llvm -c -mllvm -fla -mllvm -bcf ${FILE} -o "${FILE_NO_EXT}-fla_bcf.bc"
    ${OLLVM} -emit-llvm -c -mllvm -sub -mllvm -fla ${FILE} -o "${FILE_NO_EXT}-sub_fla.bc"
    ${OLLVM} -emit-llvm -c -mllvm -bcf -mllvm -fla ${FILE} -o "${FILE_NO_EXT}-bcf_fla.bc"    
    ${OLLVM} -emit-llvm -c -mllvm -sub -mllvm -bcf ${FILE} -o "${FILE_NO_EXT}-sub_bcf.bc"
    ${OLLVM} -emit-llvm -c -mllvm -bcf -mllvm -sub ${FILE} -o "${FILE_NO_EXT}-bcf_sub.bc"
done


