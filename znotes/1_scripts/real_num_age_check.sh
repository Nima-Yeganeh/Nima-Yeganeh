#!/bin/bash
read -p "age? " age
if [[ $age -lt 18 ]] && [[ $age -ge 0 ]]
then
  echo "from 0 to 18"
elif [[ $age -eq 18 ]]
then
  echo "equal 18"
elif [[ $age -gt 18 ]] && [[ $age -le 100 ]]
then
  echo "from 18 to 100"
else
  echo "not valid"
fi
