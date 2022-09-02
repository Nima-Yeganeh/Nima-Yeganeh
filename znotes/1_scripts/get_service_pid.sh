#!/bin/bash
#get_service_pid
systemctl status $1 | grep PID
