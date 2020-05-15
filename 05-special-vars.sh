#!/bin/bash

<<COMMENT
echo Variable 0 = $0    # first value is file name always
echo Variable 1 = $1    # first argument that we are passing from cmd to script
echo Variable 2 = $2    # second arguement that we are passing from cmd to script

echo "Variable * = $*"
echo "Variable @ = $@"  # to get the all the arguments at once in the script, we use $@ or $*
echo "Variable # = $#"  # the no. of args that we passed
COMMENT
echo -e "Student Name = $1 \n Student Age  = $2"