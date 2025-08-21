#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "ERROR:: please run this script with root acccess"
    exit 1
else
    echo "you are running with root access"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "MySQL is not installed.....GOING to INSTALL..."
    dnf install mysql -y
    if [ $? -eq 0 ] 
    then 
        echo "Installing MySQL is .......SUCCESS"
    else
        echo "Installing MySQL is ........FAILURE"
        exit 1
    fi
else
    echo "MySQL is already installed.NOTHING TO DO"
fi