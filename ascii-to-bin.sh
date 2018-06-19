#!/bin/bash
# Helper functions to allow quick conversion back and forth between binary and ASCII
# Derived from http://unix.stackexchange.com/questions/98948/ascii-binary-tools
# Last modified 2018-06-19
# Author: Hermit

chrbin() {
        echo $(printf \\$(echo "ibase=2; obase=8; $1" | bc))
}

ordbin() {
  a=$(printf '%d' "'$1")
  echo "obase=2; $a" | bc
}

ascii2bin() {
    echo -n $* | while IFS= read -r -n1 char
    do
        ordbin $char | tr -d '\n'
        echo -n " "
    done
}

bin2ascii() {
    for bin in $*
    do
        chrbin $bin | tr -d '\n'
    done
    echo
}
