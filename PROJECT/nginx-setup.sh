#!/bin/bash

LOG=/tmp/web.log 
rm -f $LOG

source `pwd`/.deps

<<COMMENT
echo -e "${RB} Hello from Nginx ${N}"
echo -e "\e[1;33m Hello from Nginx \e[0m"
echo -e "\e[33m Hello from Nginx"
COMMENT

Head "NGINX/ WEB SETUP"
BPerform "Installing Nginx WebServer"
yum install nginx -y &>>$LOG

if [ $? -eq 0 ]; then
    echo -e "${GB}Successfully installed Nginx Server${N}"
else
    echo -e "${RB}Failed to install Nginx Server${N}"
    exit 1
fi