#!/bin/bash
if [[ -f "$1" ]]
then
  echo "file"
  sleep 1
  cat $1
elif [[ -d "$1" ]]
then
  echo "file"
  sleep 1
  ls -l $1
else
  echo "$1"
fi
