#!/bin/bash

# 1st Argument is the name of the C file (without extension) that should be obfuscated
# 2nd Argument is the directory where the C file resides
NUMBER_OPAQUE=(16)

for NUM in "${NUMBER_OPAQUE[@]}"
do
tigress --FilePrefix=obf --Transform=InitOpaque --Functions=main --Transform=AddOpaque --Functions=main --AddOpaqueCount=${NUM} --AddOpaqueKinds=call,bug,true,junk --Transform=CleanUp --CleanUpKinds=annotations --out=${1}-addOpaque${NUM}.c ${2}/${1}.c
done

# EncodeLiterals
tigress --FilePrefix=obf --Transform=EncodeLiterals --Functions=main --out=${1}-encodeLiterals1.c ${2}/${1}.c

# EncodeArithmetic
tigress --FilePrefix=obf --Transform=EncodeArithmetic --Functions=main --out=${1}-encodeArithmetic1.c ${2}/${1}.c

# Flatten
tigress --FilePrefix=obf --Transform=Flatten --Functions=main --out=${1}-flatten1.c ${2}/${1}.c

# Virtualize
tigress --FilePrefix=obf --Transform=Virtualize --Functions=main --out=${1}-virt1.c ${2}/${1}.c
