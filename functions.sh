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

if [ $? -ne 0]
then
    echo "Mysql is not installed...going to install"
    dnf install mysql -y
    if [ $? -eq 0]
    then
        echo "MySQl is installing is....SUCCESS"
    else
        echo "MySQL installing is .....FAILURE"
        exit 1
    fi
else
    echo "Mysql is already installed...Nothing to DOOO"
