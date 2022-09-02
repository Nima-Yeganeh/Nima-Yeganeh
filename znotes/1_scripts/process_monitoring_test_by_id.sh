#!/bin/bash
#process_monitoring_test_by_id
while :
do
  output="$(pgrep -l $1)"
  if [[ -n "$output" ]]
  then
    echo "$1 >> running"
  else
    echo "$1 >> not running"
  fi
  sleep 3
done
