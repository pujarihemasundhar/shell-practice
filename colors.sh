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
else
    echo "You are running with root user"
fi
