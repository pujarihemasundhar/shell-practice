#!/bin/bash

#echo -e "\e[31m Hello Colors \e[0m"

#echo "Hi, Good Morning"

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

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

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo "MySQL is not installed.....Going to install" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySQL"
else
    echo -e "$Y MySQL is already installed..... NOTHING TO DO" | tee -a $LOG_FILE
fi

dnf  list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo  "Python is not installed ...GOING to install" | tee -a $LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "PYTHON3"
else
    echo -e "$Y Python3 is already installed.......NOTHING TO DO" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo "NGINX is not installed....GOING to install" | tee -a $LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "NGINX"
else
    echo -e "$Y NGINx is already installed...NOTHING TO DO" | tee -a $LOG_FILE
fi
