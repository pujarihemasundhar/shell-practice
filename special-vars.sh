#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "Current Directory: $PWD"
echo "User running this script: $USER"
echo "Home directory of the user: $HOME"
echo "PID of the script: $$"
sleep 20 &
echo "PID of last command in background: $!"