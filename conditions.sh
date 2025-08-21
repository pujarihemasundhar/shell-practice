#!/bin/bash

number=$1
if [$number -lt 10]
then
    echo "Given number $number is less than 10"
else
    echo "Given number $number is greater than 10"
fi