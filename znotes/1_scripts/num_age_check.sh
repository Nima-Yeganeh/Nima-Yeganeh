#!/bin/bash
read -p "your age?" age
if [[ $age -lt 18 ]]
then
  echo "<18"
elif [[ $age -eq 18 ]]
then
  echo "=18"
else
  echo ">18"
fi
