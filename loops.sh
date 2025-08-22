#!/bin/bash

#echo -e "\e[31m Hello Colors \e[0m"

#echo "Hi, Good Morning"

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
M="\e[35m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGEs=("MysQL" "Python3" "NGINX" "HTTPD")

mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" &>>$LOG_FILE


if [ $userid -ne 0 ]
then
    echo -e " $R ERROR:: Please run the script with root user" | tee -a $LOG_FILE
    exit 1
else
    echo "You are running with root user"
fi

VALIDATE(){

    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is..........$G SUCCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is...........$R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}

#for package in ${PACKAGE[@]}
for package in ${PACKAGE[@]}
do
        dnf list installed package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo -e "$M package is not installed.....Going to install $N" | tee -a $LOG_FILE
        dnf install package -y &>>$LOG_FILE
        VALIDATE $? "package"
    else
        echo -e "$Y package is already installed..... NOTHING TO DO $N" | tee -a $LOG_FILE
    fi
done




