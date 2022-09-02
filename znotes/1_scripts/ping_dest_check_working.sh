#!/bin/bash
output="$(ping -c 3 $1)"
echo "$output"
if [[ "$output" == *"100% packet loss"* ]]
then
  echo "not working!"
else
  echo "ok!"
fi
