#!/bin/bash
read -p "str1? " str1
read -p "str2? " str2
if [ "$str1" = "$str2" ]
then
  echo "equal"
else
  echo "not equal"
fi
