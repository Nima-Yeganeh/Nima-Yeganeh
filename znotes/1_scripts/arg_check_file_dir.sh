#!/bin/bash
if [[ $# -eq 1 ]]
then
  if [[ -f "$1" ]]
  then
    cat $1
  elif [[ -d "$1" ]]
  then
    ls -l $1
  else
    echo "$1 >> not file or dir"
  fi
else
  echo "argument?"
fi
