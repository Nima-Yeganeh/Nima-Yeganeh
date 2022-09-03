#!/bin/bash
function lines_in_file() {
  grep -c "$1" "$2"
}
n=$(lines_in_file "usb" "/var/log/dmesg")
echo $n
