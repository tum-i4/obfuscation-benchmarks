#!/bin/bash
#!/bin/bash

FILES=${1}/*.c

#cd ${1} # directory where the source code files are located
rm ${2} # file where to write the list of CNF files/instances
rm experiment-stats.csv
mkdir ./obfuscated-cnf-instances

for FILENAME in $FILES
do
    FILE_W_EXT=${FILENAME##*/}
    F=${FILE_W_EXT%.*}
    #clang-3.4 -emit-llvm -c ${FILE_W_EXT}
    #wait
    #klee --optimize --output-dir=klee-out-${F} --check-overshift=false --libc=uclibc --emit-all-errors --write-smt2s --use-query-log=solver:smt2 --posix-runtime ./${F}.bc --sym-arg 16
    #wait
    D=klee-out-${F}
    sed -i 's/(check-sat)/(check-sat-using (then simplify solve-eqs bit-blast sat tseitin-cnf))/g' ${1}/${D}/*.smt 2> /dev/null
    wait
    SMT_FILES=*.smt
    MAX_SIZE=0
    NR_SMT_FILES=0
    for SMTF in $D/$SMT_FILES
    do
        if grep -F "*" <<< $SMTF; then
          continue
        fi
        if [ "$MAX_SIZE" -lt "$(wc -c < ${SMTF})" ]; then
          MAX_SIZE="$(wc -c < ${SMTF})"
        fi
        NR_SMT_FILES=$( expr $NR_SMT_FILES + 1)
        #echo ${SMTF}
        z3 -smt2 ${SMTF} > ${SMTF}.tmp
        CNF="${SMTF%.*}.cnf"
        head -n -2 ${SMTF}.tmp > ${CNF}
        echo ${CNF} >> ${2}
        cp ${CNF} ./obfuscated-cnf-instances/ 
    done
    wait
    
    #SIZE=$(wc -c < ${F}.bc)
    echo "$F $NR_SMT_FILES $MAX_SIZE" >> experiment-stats.csv
done 
