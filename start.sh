#!/bin/bash
#Set the root password as root if not set as an ENV variable
export PASSWD=${PASSWD:=root}
#Set the root password
echo "root:$PASSWD" | chpasswd
#Spawn dropbear
dropbear -E -F-s &


DIFF=$(diff /app/sketch.ino /data/sketch.ino) 
if [ "$DIFF" != "" -o ! -f /data/sketch.ino] 
then
    echo "New file for programming"

    #use ino
    mkdir /app/lib
    cd /app

    export ardBoard=${ardBoard:=atmega328}

    ino build -m $ardBoard
    ino upload -m $ardBoard

    cp -n /app/sketch.ino /data/
fi

#start your application from here...
python /app/server.py
