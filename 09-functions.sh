#!/bin/bash

function abc(){
    echo I am a function
}

abc1(){
    echo Ia m also a function
    return 100
    echo Bye
}

abc
abc1
echo exit status = $?