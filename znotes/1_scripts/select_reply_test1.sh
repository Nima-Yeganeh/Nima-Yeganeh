#!/bin/bash
PS3="Your country:"
select COUNTRY in Germany France USA "United Kingdom"
do
    if [[ $REPLY -le 4 && $REPLY -ge 1 ]]
    then
        echo "COUNTRY is $COUNTRY"
        echo "REPLY is $REPLY"
    else
        exit
    fi
done
