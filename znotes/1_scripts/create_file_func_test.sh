#!/bin/bash
create_files() {
  echo "file >> $1"
  touch $1
  chmod 400 $1
  echo "file >> $2"
  touch $2
  chmod 600 $2
  ls $1 $2
  rm -f $1
  rm -f $2
  return 10
}
create_files aa.txt bb.txt
echo $?
