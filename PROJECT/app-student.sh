#!/bin/bash

LOG=/tmp/app-student.log
rm -f $LOG
source `pwd`/.deps

## Variables
APPUSER=student
TOMCAT_VERSION=$( curl -s https://tomcat.apache.org/download-80.cgi | grep 8.5 | grep -v http | sed -e 's|"| |g' | grep -v href | xargs -n1 | grep ^8
)

Head "STUDENT APP SETUP"
BPerform "Create Application User"
id $APPUSER &>>$LOG
if [ $? -eq 0 ]; then
    Stat 0 "Application User Creation"
else
    useradd $APPUSER &>>$LOG
    Stat $? "Application User Creation"
fi

BPerform "Install Java"
yum install java -y &>>$LOG
Stat $? "Installing Java"

BPerform "Downloading Tomcat"
cd /home/$APPUSER
curl -s https://archive.apache.org/dist/tomcat/tomcat-8/v${TOMCAT-VERSION}/bin/apache-tomcat-${TOMCAT-VERSION}.tar.gz 2>>&LOG| tar -xz &>>$LOG 
Stat $? "Downloading Tomcat"