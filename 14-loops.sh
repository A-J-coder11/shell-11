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
PACKAGES=("mysql" "python" "nginx" "httpd")

mkdir -p $LOGS_FOLDER

echo "Script started executing at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
  echo  -e "$R You must be root to run this script$N" | tee -a $LOG_FILE
  exit 1
else
  echo -e "$G You are root, proceeding with installation." | tee -a $LOG_FILE
fi

# validate is a function and takes input as exit status and tries to install 
VALIDATE(){
  if [ $1 -eq 0 ]
   then
    echo -e "$G $2 installed successfully.$N" | tee -a $LOG_FILE
  else
    echo -e "$R Failed to install $2.$N" | tee -a $LOG_FILE
    exit 1
  fi
}

for Package in ${PACKAGES[@]}
do
    dnf list installed $Package &>>$LOG_FILE
    if [ $? -ne 0 ]
     then
      echo  " $package is not installed going to install it." | tee -a $LOG_FILE
      dnf install $package -y &>>$LOG_FILE
      VALIDATE $? "$package" 
    else
      echo -e " $package is already installed." | tee -a $LOG_FILE
    fi
done


