#!/bin/bash
#system_admin_script_test
PS3="your choice:"
select ITEM in "add_user" "list_proc" "kill_proc" "install_prog" "quit"
do
if [[ $REPLY -eq 1 ]]
then
  read -p "username: " username
  output="$(grep -w $username /etc/passwd)"
  if [[ -n "$output" ]]
  then
    echo "$username >> exist err"
  else
    sudo useradd -m -d /bin/bash "$username"
    if [[ $? -eq 0 ]]
    then
      echo "$username >> added >> done!"
      tail -n 1 /etc/passwd
    else
      echo "user add >> err"
    fi
  fi
elif [[ $REPLY -eq 2 ]]
then
  echo "proc >> listing"
  sleep 1
  ps -ef | more
elif [[ $REPLY -eq 3 ]]
then
  read -p "proc id to kill: " process
  pkill $process
elif [[ $REPLY -eq 4 ]]
then
  read -p "prog to install: " app
  sudo apt update && sudo apt install $app
elif [[ $REPLY -eq 5 ]]
then
  echo "quit"
  sleep 1
  exit
else
  echo "invalid"
fi
done
