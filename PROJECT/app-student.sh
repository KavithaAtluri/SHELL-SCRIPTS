#!/bin/bash

LOG=/tmp/app-student.log
rm -f $LOG
source `pwd`/.deps

## Variables
APPUSER=student

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