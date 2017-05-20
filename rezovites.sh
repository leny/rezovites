#!/bin/sh
# leny/rezovites
#
# /rezovites.sh - Test LAN speed with dd & netcat (simple wrapper)
#
# coded by leny@flatLand!
# started at 20/05/2017

version=0.0.1

# reset colors
NONE="\033[0m"

# regular colors
K="\033[0;30m"    # black
R="\033[0;31m"    # red
G="\033[0;32m"    # green
Y="\033[0;33m"    # yellow
B="\033[0;34m"    # blue
M="\033[0;35m"    # magenta
C="\033[0;36m"    # cyan
W="\033[0;37m"    # white

# emphasized (bolded) colors
EMK="\033[1;30m"
EMR="\033[1;31m"
EMG="\033[1;32m"
EMY="\033[1;33m"
EMB="\033[1;34m"
EMM="\033[1;35m"
EMC="\033[1;36m"
EMW="\033[1;37m"

if [ $# == 0 ] ; then
    echo "${EMR}error:${NONE} missing mode."
fi

case $1 in
    "listen")
        echo "${EMY}listen ${W}on port ${C}49999${W}."
        echo "${EMW}Current IP addresses:${NONE}"
        ifconfig | awk '$1 == "inet" {print $2}'
        nc -lk 49999 > /dev/null
        ;;
    "send")
        ADDRESS=${2:-"127.0.0.1"}
        AMOUNT=${3:-128}
        echo "${EMY}send ${C}$AMOUNT MB ${W}of data to ${C}$ADDRESS ${W}on port ${C}49999${W}.${NONE}"
        dd if=/dev/zero bs=MB count=$AMOUNT | nc $ADDRESS 49999
        ;;
    *)
        echo "${EMR}error:${NONE} unknown mode."
        ;;
esac
