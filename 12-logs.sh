#!/bin/bash
# Root user check
USERID=$(id -u)
R='\e[31m'
G='\e[32m'
Y='\e[33m'
N='\e[0m'
LOGS_FOLDER="/var/log/shell22-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

echo "Script started executing at: $(date)" &>>$LOG_FILE

if [ $USERID -ne 0 ]; then
  echo  -e "$R You must be root to run this script$N" &>>$LOG_FILE
  exit 1
else
  echo -e "$G You are root, proceeding with installation.$N" &>>$LOG_FILE
fi

# validate is a function and takes input as exit status and tries to install 
VALIDATE(){
  if [ $1 -eq 0 ]; then
    echo -e "$G $2 installed successfully.$N" &>>$LOG_FILE
  else
    echo -e "$R Failed to install $2.$N" &>>$LOG_FILE
    exit 1
  fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -eq 0 ]; then
  echo -e "$Y mysql is not installed going to install it.$N" &>>$LOG_FILE
  dnf install mysql -y &>>$LOG_FILE
  VALIDATE $? "MySQL" 
else
  echo -e "$G mysql is already installed.$N" &>>$LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -eq 0 ]; then
  echo -e "$Y python3 is not installed going to install it.$N" &>>$LOG_FILE
  dnf install python3 -y &>>$LOG_FILE
  VALIDATE $? "Python3"
else
  echo -e "$G python3 is already installed.$N" &>>$LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -eq 0 ]; then
  echo -e "$Y nginx is not installed going to install it.$N" &>>$LOG_FILE
  dnf install nginx -y &>>$LOG_FILE
  VALIDATE $? "Nginx"
else
  echo -e "$G nginx is already installed.$N" &>>$LOG_FILE
fi
