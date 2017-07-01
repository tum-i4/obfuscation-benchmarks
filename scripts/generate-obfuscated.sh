#!/bin/bash

NUMBER_OPAQUE=(4 16)

for NUM in "${NUMBER_OPAQUE[@]}"
do
tigress --Transform=InitOpaque --Functions=main --Transform=AddOpaque --Functions=main --AddOpaqueCount=${NUM} --AddOpaqueKinds=call,bug,true,junk --Transform=CleanUp --CleanUpKinds=annotations --out=${1}-addOpaque${NUM}.c ${1}.c
tigress --Transform=InitOpaque --Functions=main --Transform=UpdateOpaque --Functions=main --UpdateOpaqueCount=${NUM} --Transform=AddOpaque --Functions=main --AddOpaqueCount=${NUM} --AddOpaqueKinds=call,bug,true,junk --Transform=CleanUp --CleanUpKinds=annotations,constants --out=${1}-addOpaque-updateOpaque${NUM}.c ${1}.c
done

# EncodeLiterals
tigress --Transform=EncodeLiterals --Functions=main --out=${1}-encodeLiterals1.c ${1}.c
# EncodeLiterals x Virtualize
tigress --Transform=EncodeLiterals --Functions=main --Transform=Virtualize --Functions=main --out=${1}-encodeLiterals1-virt1.c ${1}.c
# Virtualize x EncodeLiterals
tigress --Transform=Virtualize --Functions=main --Transform=EncodeLiterals --Functions=main --out=${1}-virt1-encodeLiterals1.c ${1}.c
# EncodeLiterals x Flatten
tigress --Transform=EncodeLiterals --Functions=main --Transform=Flatten --Functions=main --out=${1}-encodeLiterals1-flatten1.c ${1}.c
# Flatten x EncodeLiterals
tigress --Transform=Flatten --Functions=main --Transform=EncodeLiterals --Functions=main --out=${1}-flatten1-encodeLiterals1.c ${1}.c
# EncodeLiterals x AddOpaque16
tigress --Transform=EncodeLiterals --Functions=main --Transform=InitOpaque --Functions=main --Transform=AddOpaque --Functions=main --AddOpaqueCount=16 --AddOpaqueKinds=call,bug,true,junk --Transform=CleanUp --CleanUpKinds=annotations --out=${1}-encodeLiterals1-addOpaque16.c ${1}.c
# AddOpaque16 x EncodeLiterals
tigress --Transform=InitOpaque --Functions=main --Transform=AddOpaque --Functions=main --AddOpaqueCount=16 --AddOpaqueKinds=call,bug,true,junk --Transform=EncodeLiterals --Functions=main --Transform=CleanUp --CleanUpKinds=annotations --out=${1}-addOpaque16-encodeLiterals1.c ${1}.c
# EncodeLiterals x EncodeArithmetic
tigress --Transform=EncodeLiterals --Functions=main --Transform=EncodeArithmetic --Functions=main --out=${1}-encodeLiterals1-encodeArithmetic1.c ${1}.c
# EncodeLiterals x EncodeArithmetic
tigress --Transform=EncodeArithmetic --Functions=main --Transform=EncodeLiterals --Functions=main --out=${1}-encodeArithmetic1-encodeLiterals1.c ${1}.c

# EncodeArithmetic
tigress --Transform=EncodeArithmetic --Functions=main --out=${1}-encodeArithmetic1.c ${1}.c
# EncodeArithmetic x Virtualize
tigress --Transform=EncodeArithmetic --Functions=main --Transform=Virtualize --Functions=main --out=${1}-encodeArithmetic1-virt1.c ${1}.c
# Virtualize x EncodeArithmetic
tigress --Transform=Virtualize --Functions=main --Transform=EncodeArithmetic --Functions=main --out=${1}-virt1-encodeArithmetic1.c ${1}.c
# EncodeArithmetic x Flatten
tigress --Transform=EncodeArithmetic --Functions=main --Transform=Flatten --Functions=main --out=${1}-encodeArithmetic1-flatten1.c ${1}.c
# Flatten x EncodeArithmetic
tigress --Transform=Flatten --Functions=main --Transform=EncodeArithmetic --Functions=main --out=${1}-flatten1-encodeArithmetic1.c ${1}.c
# EncodeArithmetic x AddOpaque16
tigress --Transform=EncodeArithmetic --Functions=main --Transform=InitOpaque --Functions=main --Transform=AddOpaque --Functions=main --AddOpaqueCount=16 --AddOpaqueKinds=call,bug,true,junk --Transform=CleanUp --CleanUpKinds=annotations --out=${1}-encodeArithmetic1-addOpaque16.c ${1}.c
# AddOpaque16 x EncodeArithmetic
tigress --Transform=InitOpaque --Functions=main --Transform=AddOpaque --Functions=main --AddOpaqueCount=16 --AddOpaqueKinds=call,bug,true,junk --Transform=EncodeArithmetic --Functions=main --Transform=CleanUp --CleanUpKinds=annotations --out=${1}-addOpaque16-encodeArithmetic1.c ${1}.c

# Flatten
tigress --Transform=Flatten --Functions=main --out=${1}-flatten1.c ${1}.c
# Flatten x Flatten
tigress --Transform=Flatten --Functions=main  --Transform=Flatten --Functions=main --out=${1}-flatten2.c ${1}.c
# Flatten x Virtualize
tigress --Transform=Flatten --Functions=main --Transform=Virtualize --Functions=main --out=${1}-flatten1-virt1.c ${1}.c
# Virtualize x Flatten
tigress --Transform=Virtualize --Functions=main --Transform=Flatten --Functions=main --out=${1}-virt1-flatten1.c ${1}.c
# Flatten x AddOpaque16
tigress --Transform=Flatten --Functions=main --Transform=InitOpaque --Functions=main --Transform=AddOpaque --Functions=main --AddOpaqueCount=16 --AddOpaqueKinds=call,bug,true,junk --Transform=CleanUp --CleanUpKinds=annotations --out=${1}-flatten1-addOpaque16.c ${1}.c
# AddOpaque16 x Flatten
tigress --Transform=InitOpaque --Functions=main --Transform=AddOpaque --Functions=main --AddOpaqueCount=16 --AddOpaqueKinds=call,bug,true,junk --Transform=CleanUp --CleanUpKinds=annotations --Transform=Flatten --Functions=main --out=${1}-addOpaque16-flatten1.c ${1}.c

# Virtualize
tigress --Transform=Virtualize --Functions=main --out=${1}-virt1.c ${1}.c
# Virtualize x Virtualize
tigress --Transform=Virtualize --Functions=main --Transform=Virtualize --Functions=main --out=${1}-virt2.c ${1}.c
# Virtualize x AddOpaque16
tigress --Transform=Virtualize --Functions=main --Transform=InitOpaque --Functions=main --Transform=AddOpaque --Functions=main --AddOpaqueCount=16 --AddOpaqueKinds=call,bug,true,junk --Transform=CleanUp --CleanUpKinds=annotations --out=${1}-virt1-addOpaque16.c ${1}.c
# AddOpaque16 x Virtualize
tigress --Transform=InitOpaque --Functions=main --Transform=AddOpaque --Functions=main --AddOpaqueCount=16 --AddOpaqueKinds=call,bug,true,junk --Transform=CleanUp --CleanUpKinds=annotations --Transform=Virtualize --Functions=main --out=${1}-addOpaque16-virt1.c ${1}.c
