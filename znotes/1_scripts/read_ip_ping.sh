#!/bin/bash
read -p "ip to ping? " ip
echo $ip
ping -c 1 $ip
