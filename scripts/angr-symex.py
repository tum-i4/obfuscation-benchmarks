#import logging
#logging.getLogger('angr.surveyor').setLevel(logging.DEBUG)

import angr
import simuvex
import claripy
import os
import sys
import string
import subprocess
import datetime

def get_byte(s, i):
    pos = s.size() / 8 - 1 - i
    return s[pos * 8 + 7 : pos * 8]

def main():
    print sys.argv[1]
    f = open(sys.argv[3], "a")
    start_time = datetime.datetime.now()
    p = angr.Project(sys.argv[1]) # input program path
    sym_input_len = int(sys.argv[2])
    flag = claripy.BVS('arg1', sym_input_len * 8)
    argv = ['name', flag.concat(claripy.BVV(0, 8))]
    state = p.factory.entry_state(remove_options={simuvex.s_options.LAZY_SOLVES}, args=argv)

    #for i in xrange(5):
        # We want those flags to be printable characters
    #    state.add_constraints(flag[i * 8 + 7 : i * 8] >= 0x20)
    #    state.add_constraints(flag[i * 8 + 7 : i * 8] <= ord('}'))

    path = p.factory.path(state)

    disas = subprocess.check_output(['objdump', '-d', sys.argv[1]])
    disas = disas.split('\n')
    #print disas
    in_main = False
    found_first_print = False
    
    for line in disas:
        if "<main>" in line:
           in_main = True
        if in_main:
           if "<puts@plt>" in line:
               if not found_first_print:
                   found_first_print = True
                   first_addr = line.split(":")[0].strip()
                   print first_addr
               
    ex = p.surveyors.Explorer(
        start=path,
        find=(int("0x"+first_addr,16)))
  
    ex.run()
    end_time = datetime.datetime.now()
    total_time = end_time - start_time
    total_time = total_time.total_seconds() * 1000 + total_time.microseconds/1000
    f.write(sys.argv[1] + " %s %s %s %s %s %s %s %s\n"%(sys.argv[2], total_time, len(ex.active), len(ex.spilled), len(ex.suspended), len(ex.errored), len(ex.deadended), len(ex.found)))
    f.close()
    possible_flags = ex.found[0].state.se.any_n_int(flag, 1)
    for i, f in enumerate(possible_flags):
        stringbase = hex(f)[2:-1]
        if len(stringbase) % 2 == 1:
            stringbase = '0' + stringbase
        print "Flag %d:" % i, stringbase.decode("hex")

def test():
    # This test method intentionally does nothing, since there are multiple solutions
    pass

if __name__ == "__main__":
    main()
