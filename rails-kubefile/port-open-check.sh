#!/bin/bash

if [ $UID -eq 0 ];
then
    var=lsof -ti:3000
    $var
    echo $?
    if [ $var ];
    then
        netstat -tunlp
    fi
    sudo kill -9 $var
fi