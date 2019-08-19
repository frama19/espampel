#!/bin/bash

LUATOOL=./luatool/luatool.py

DEVICE=$1

# check the serial connection

if [ ! -c $DEVICE ]; then
 echo "$DEVICE does not exist"
 exit 1
fi


if [ $# -ne 1 ]; then
    echo ""
    echo "e.g. usage $0 <device>"
    exit 1
fi

FILES="wlancfg.lua init.lua wifi_config.lua webserver.lua"
for f in $FILES; do
    echo "------------- $f ------------"
    $LUATOOL -p $DEVICE -b 115200 -f $f -t $f
    if [ $? -ne 0 ]; then
        echo "STOOOOP"
        exit 1
    fi
done

exit 0
