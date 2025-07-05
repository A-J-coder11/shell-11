#!/bin/bash
# Root user check
USERID=$(id -u)
R='\e[31m'
G='\e[32m'
Y='\e[33m'
N='\e[0m'

if [ $USERID -ne 0 ]; then
  echo  -e "$R You must be root to run this script$N"
  exit 1
else
  echo -e "$G You are root, proceeding with installation.$N"
fi

# validate is a function and takes input as exit status and tries to install 
VALIDATE(){
  if [ $1 -eq 0 ]; then
    echo -e "$G $2 installed successfully.$N"
  else
    echo -e "$R Failed to install $2.$N"
    exit 1
  fi
}

dnf list installed mysql
if [ $? -eq 0 ]; then
  echo -e "$Y mysql is not installed going to install it.$N"
  dnf install mysql -y
  VALIDATE $? "MySQL"
else
  echo -e "$G mysql is already installed.$N"
fi

dnf list installed python3
if [ $? -eq 0 ]; then
  echo -e "$Y python3 is not installed going to install it.$N"
  dnf install python3 -y
  VALIDATE $? "Python3"
else
  echo -e "$G python3 is already installed.$N"
fi

dnf list installed nginx
if [ $? -eq 0 ]; then
  echo -e "$Y nginx is not installed going to install it.$N"
  dnf install nginx -y
  VALIDATE $? "Nginx"
else
  echo -e "$G nginx is already installed.$N"
fi
