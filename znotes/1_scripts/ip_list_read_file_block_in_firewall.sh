#!/bin/bash
for ip in $(cat ips_to_block.txt)
do
  echo "Dropping packets from $ip"
  sudo iptables -I INPUT -s $ip -j DROP
done
sudo iptables --list | grep DROP
