#!/bin/bash
read -p "firewall >> ip to drop? " ip
sudo iptables -I INPUT -s $ip -j DROP
sudo iptables --list | grep $ip
