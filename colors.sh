#!/bin/bash

#echo -e "\e[31m Hello Colors \e[0m"

#echo "Hi, Good Morning"

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $userid -ne 0 ]
then
    echo -e " $R ERROR:: Please run the script with root user"
    exit 1
else
    echo "You are running with root user"
fi

VALIDATE(){

    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is..........$G SUCCCESS $N"
    else
        echo -e "Installing $2 is...........$R FAILURE $N"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "MySQL is not installed.....Going to install"
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo "$Y MySQL is already installed..... NOTHING TO DO"
fi
