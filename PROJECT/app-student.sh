#!/bin/bash

LOG=/tmp/app-student.log
rm -f $LOG
source `pwd`/.deps

## Variables
APPUSER=student
TOMCAT_VERSION=$(curl -s https://tomcat.apache.org/download-80.cgi | grep 8.5 | grep -v http | sed -e 's|"| |g' | grep -v href | xargs -n1 | grep ^8)
CONFIG='<Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource" maxTotal="100" maxIdle="30" maxWaitMillis="10000" username="student" password="student1" driverClassName="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/studentapp"/>'

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
curl -s https://archive.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz 2>>$LOG| tar -xz &>>$LOG 
Stat $? "Downloading Tomcat"

BPerform "Download Student App"
cd /home/$APPUSER/apache-tomcat-${TOMCAT_VERSION}
curl -s https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war -o webapps/student.war &>>$LOG
Stat $? "Downaloding Student App"


BPerform "Download JDBC Jar"
cd /home/$APPUSER/apache-tomcat-${TOMCAT_VERSION}
curl -s  https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar -o lib/mysql-connector.jar &>>$LOG
Stat $? "Downloading JDBC Jar"

BPerform "Configure JDBC"
cd /home/$APPUSER/apache-tomcat-${TOMCAT_VERSION}
sed -i -e '/TestDB/ d' -e "$ i $CONFIG" conf/context.xml &>>$LOG
Stat $? "Cnfiguring JDBC"

chown -R ${APPUSER}:${APPUSER} /home/$APPUSER/apache-tomcat-${TOMCAT_VERSION}

BPerform "Download Tomcat Init script"
curl -v -s -o /etc/init.d/tomcat https://s3-us-west-2.amazonaws.com/studentapi-cit/tomcat-init &>>$LOG
Stat $? "Downloading Tomcat Init script"

chmod -x /etc/init.d/tomcat

BPerform "Start Tomcat Server"
systemctl daemon-reload &>>$LOG
systemctl enable tomcat &>>$LOG
systemctl restart tomcat &>>$LOG
Stat $? "Starting Tomcat Server"