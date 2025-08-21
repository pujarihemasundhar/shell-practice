#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "ERROR:: Please run the script with root access"
    exit 1
else 
    echo "running the script with root user"
fi

dnf install mysql -y

VALIDATE(){

    if [ $1 -eq 0]
    then
        echo "$2 is installing is....SUCCESS"
    else
        echo "$2 installing is .....FAILURE"
        exit 1
    fi
}

if [ $? -ne 0]
then
    echo "Mysql is not installed...going to install"
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo "Mysql is already installed...Nothing to DOOO"
fi