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

Stat $? "Nginx Installation"

BPerform "Clean Old Web Content"
rm -rf /usr/share/nginx/html/* &>>$LOG
Stat $? "Clean Old Web Content"

cd /usr/share/nginx/html/
BPerform "Download Web Content"
curl -s https://studentapi-cit.s3-us-west-2.amazonaws.com/studentapp-frontend.tar.gz 2>>$LOG | tar -xz &>>$LOG
Stat $? "Download Nginx Web Content"

BPerform "Updating Nginx Config"
sed -i -e '/location \/student/,+2 d' /etc/nginx/nginx.conf
sed -i.bak -e '/^        error_page 404 /i \\tlocation /student {\n\t\tproxy_pass http://localhost:8080/student;\n\t}\n ' /etc/nginx/nginx.conf
Stat $? "Update Nginx Config"

BPerform "Start Nginx Service"
systemctl enable nginx &>>$LOG
systemctl start nginx &>>$LOG
Stat $? "Start Nginx Service"