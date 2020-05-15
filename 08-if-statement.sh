#!/bin/bash

ACTION=$1

if [ "$ACTION" == "start" ]; then
    echo "starting service"
elif [ "$ACTION" == "stop" ]; then
    echo "stop service"
else
    echo "invalid input"
    echo -e "accepted values are \e[31mstart/stop\e[0m"
    exit 1
fi