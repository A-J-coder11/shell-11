#!/bin/bash

echo "All variables passed to the script are :: $@"
echo "Number of Variables: $#"
echo "Script Name: $0"
echo "current directory: $PWD"
echo "current user: $USER"
echo "current shell: $SHELL"
echo "current process ID: $$"
sleep 10 &
PID of th last running process: $!
echo "Exit status of the last command: $?"
echo "Home directory: $HOME"
echo "Terminal device: $-"
echo "Shell options: $-"
echo "Current date and time: $(date)"