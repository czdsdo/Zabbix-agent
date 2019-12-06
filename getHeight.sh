#!/bin/bash
function getHeight(){
    RESULT=$(curl -s 'http://127.0.0.1：8080/getheight')
    SUCCESS=$(echo $RESULT | jq ".Message" | sed "s/\"//g")
    if [ $SUCCESS == "success" ]
    then
        HEIGHT=$(echo $RESULT | jq ".Data" | sed "s/\"//g")
        echo $HEIGHT > /height
        cat /height
    else
        return
    fi
}

getHeight

