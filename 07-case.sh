#! /bin/bash

ACTION=$1

case $ACTION in
    start)
        echo -e "Starting Service"
        ;;
    stop)
        echo -e "Stopping service"
        ;;
    *)
        echo -e "Invalid Input"
        echo -e "Expected inputs are \e [1mstart/stop\e[0m"
        exit 1
        ;;
esae