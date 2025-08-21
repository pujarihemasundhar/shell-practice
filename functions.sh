#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "ERROR:: Please run the script with root access"
    exit 1
else 
    echo "running the script with root user"