#!/bin/bash

# 1st Argument the name of the directory where the C files that must be symbolically executed resides.
# 2nd Argument must be a unique random executable name. The name must be unique such that it can be found by the pkill utility.
# 3rd Argument is the maximum length of the symbolic input

FILES=${1}/*.c

for FILENAME in $FILES
do
  file_with_extension=${FILENAME##*/}
  file_name=${file_with_extension%.*}
  echo ${file_name}

#  if [ -e "${file_name}.bc" ]
#  then
#    continue
#  fi

  if [ -d "klee-out-${file_name}" ]
  then
    continue
  fi

  if [ -e "${file_name}.c" ]
  then
  clang-3.4 -emit-llvm -c ${file_name}.c

  echo "Successfully compiled ${file_name}.c"

  rm file.log
  start_time=$(date +"%s%N")

  klee --optimize --emit-all-errors --libc=uclibc --posix-runtime --only-output-states-covering-new --max-time=3600 --write-smt2s --output-dir=klee-out-${file_name} ./${file_name}.bc --sym-arg ${3} &> file.log &
  klee_pid=$!
  now=$(date -u)
  echo "Started symex at $now"
#  tail -f "$file_name.log" | while read LOGFILE
#  do
#    [[ "${LOGFILE}" == *"win"* ]] && pkill -P $$ tail
#  done
  found=0
  while true
  do
    if grep -q "You win!" file.log
    then
      found=1
      break
    fi
    if grep -q "StackTrace" file.log
    then
      break
    fi
    if grep -q "KLEE: done: generated" file.log
    then
      break
    fi
    if grep -q "HaltTimer" file.log
    then
      break
    fi
    if grep -q "error: STP did not return a recognized code" file.log
    then
      break
    fi
  done

  end_time=$(date +"%s%N")
  sleep 5
  kill -9 ${klee_pid}
  total_time=$((end_time - start_time)) # time in nanoseconds
  echo "$file_name  $total_time $found" >> klee-time-to-win.txt
  D=klee-out-${file_name}

  echo "Finished KLEE execution. Starting replay"
  ## delete all smt2 files that do not lead to win!
  D=klee-out-${file_name}
  for smt_file in `ls -S ${D}/*.smt2`; do
    FILE_W_EXT=${smt_file##*/} # with extensions
    F=${FILE_W_EXT%.*}         # without extension
    gcc ./${file_name}.c -o ./${2}
    rm smt.log
    klee-replay ./${2} ${D}/${F}.ktest &> smt.log &
    replay_pid=$!
    sleep 1
    #wait
    kill -9 ${replay_pid}
    pkill ${2}
    if grep -q "You win!" smt.log
    then
      cp ${D}/${F}.smt2 ${D}/${file_name}.smt
      cp ${D}/${F}.ktest ${D}/${file_name}.test
      break
    fi
  
  done
  rm -r ${D}/*.smt2
  rm -r ${D}/*.err
  rm -r ${D}/*.pc
  rm -r ${D}/*.ktest

  fi
done

