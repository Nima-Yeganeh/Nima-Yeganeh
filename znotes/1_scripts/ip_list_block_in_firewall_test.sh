#!/bin/bash
DROPPED_IPS="1.2.3.1 1.2.3.2 1.2.3.3"
for ip in $DROPPED_IPS
do
  echo "Dropping packets from $ip"
  sudo iptables -I INPUT -s $ip -j DROP
done
sudo iptables --list | grep DROP
