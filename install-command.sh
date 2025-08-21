#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "ERROR:: please run this script with root acccess"
else
    echo "you are running with root access"
fi

dnf install mysql -y
