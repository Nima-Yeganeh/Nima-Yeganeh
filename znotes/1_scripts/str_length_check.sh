#!/bin/bash
read -p "str1? " str1
if [[ -z "$str1" ]]
then
  echo "zero length"
else
fi
if [[ -n "$str1" ]]
then
  echo "not zero"
else
fi
