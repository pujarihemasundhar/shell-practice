#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "ERROR:: Please run the script with root access"
    exit 1
else 
    echo "running the script with root user"
fi


#validate function takes input as exit status, what command they tried to install
VALIDATE(){

    if [ $1 -eq 0 ]
    then
        echo "$2 is installing is....SUCCESS"
    else
        echo "$2 installing is .....FAILURE"
        exit 1
    fi
}


dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql is not installed...going to install"
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo "Mysql is already installed...Nothing to DOOO"
fi



dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed...going to install"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 is already installed...Nothing to DOOO"
fi





dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed...going to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed...Nothing to DOOO"
fi