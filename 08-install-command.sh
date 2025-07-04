#!/bin/bash


# This script checks if the user is root and installs MySQL if it is not already installed.
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
  echo "You must be root to run this script."
  exit 1
else
  echo "You are root, proceeding with installation."
fi

dnf list installed mysql 

# Check if MySQL is installed or not if it is installed then code status is zero
# if not installed then it is not zero
if [ $? -eq 0 ]; then
  echo "mysql is not installed going to inbstall it."
  dnf install mysql -y

# Check if MySQL installation was successful
    if [ $? -eq 0 ]; then
      echo "MySQL installed successfully."
    else
      echo "Failed to install MySQL."
      exit 1
    fi
else
  echo "mysql is already installed."
  
fi

# dnf install mysql -y

# # if [ $? -eq 0 ]; then
# #   echo "MySQL installed successfully."
# # else
# #   echo "Failed to install MySQL."
# #   exit 1
# # fi