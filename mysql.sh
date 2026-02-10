#!/bin/bash

source ./common.sh

app_name=mysql

check_root



dnf install mysql-server -y &>>$LOGS_FILE
VALIDATE $? "Installing Mysql Server"

systemctl enable mysqld &>>$LOGS_FILE
VALIDATE $? "Enabling mysql server"

systemctl start mysqld   &>>$LOGS_FILE
VALIDATE $? "Start Mysql Server"

mysql_secure_installation --set-root-pass RoboShop@1 &>>$LOGS_FILE
VALIDATE $? "setup root password"