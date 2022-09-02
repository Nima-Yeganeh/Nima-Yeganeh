#!/bin/bash
output="$(ping -c 3 $1)"
echo "$output"
if [[ "$output" == *"100% packet loss"* ]]
then
  echo "not working!"
elif [[ "$output" == *"address required"* ]]
then
  echo "not address! try again!"
else
  echo "ok!"
fi
