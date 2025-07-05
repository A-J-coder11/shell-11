#!/bin/bash
# Root user check
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
  echo "You must be root to run this script."
  exit 1
else
  echo "You are root, proceeding with installation."
fi

# validate is a function and takes input as exit status and tries to install 
VALIDATE(){
  if [ $1 -eq 0 ]; then
    echo "$2 installed successfully."
  else
    echo "Failed to install $2."
    exit 1
  fi
}

dnf list installed mysql
if [ $? -eq 0 ]; then
  echo "mysql is not installed going to inbstall it."
  dnf install mysql -y
  VALIDATE $? "MySQL"
else
  echo "mysql is already installed."  
fi

dnf list installed python3
if [ $? -eq 0 ]; then
  echo "python3 is not installed going to install it."
  dnf install python3 -y
  VALIDATE $? "Python3"
else
  echo "python3 is already installed."
fi

dnf list installed nginx
if [ $? -eq 0 ]; then
  echo "nginx is not installed going to install it."
  dnf install nginx -y
  VALIDATE $? "Nginx"
else
  echo "nginx is already installed."
fi