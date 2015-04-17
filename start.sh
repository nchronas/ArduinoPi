#!/bin/bash
#Set the root password as root if not set as an ENV variable
export PASSWD=${PASSWD:=root}
#Set the root password
echo "root:$PASSWD" | chpasswd
#Spawn dropbear
dropbear -E -F-s &

#use ino
mkdir /app/lib
cd /app

${ardBoard:=atmega328}

ino build -m $ardBoard
ino upload -m $ardBoard

#start your application from here...
python /app/server.py
