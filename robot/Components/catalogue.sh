#!/bin/bash
set -e
COMPONENET=catalogue

source components/common.sh
APPUSER=roboshop

echo -n "configuring the node JS:"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
stat $?

echo -n " installing nodejs:"
yum install nodejs -y
stat $?

echo -n "creating App User"
useradd roboshop
stat $?

echo -n " Downloading $COMPONENT:"
 curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"
stat $?

echo -n " moving $COMPONENT code to $APPUSER home directory"
cd /home/$APPUSER/
unzip -o /tmp/catalogue.zip
mv catalogue-main $COMPONENT
stat $?

echo -n " installing Node JS Dependencies:"
cd /$COMPONENT
npm install
stat $?


