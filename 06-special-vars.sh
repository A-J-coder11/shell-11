#!/bin/bash

echo "All variables passed to the script are :: $@"
echo "Number of Variables: $#"
echo "Script Name: $0"
echo "current directory: $PWD"
echo "current user: $USER"
echo "current shell: $SHELL"
echo "current process ID: $$"
sleep 10 &
