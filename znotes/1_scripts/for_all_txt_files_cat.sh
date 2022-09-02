#!/bin/bash
for file in *.txt
do
  echo "file>> $file"
  cat $file
done
