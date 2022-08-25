#!/usr/bin/env python2.7

from netmiko import ConnectHandler
import getpass
import os
import sys

allips = open('iplist')
ciscoips = allips.read().splitlines()
allips.close()

print("""
        Write CDP neighbor hostname and portid description to the local interface using SSH...
        Please enter needed credentials

        username: username used for the authentication
        password: password used for the authentication
        enable_secret: enable secret

        """)

username = raw_input('Please enter username: ')
password = getpass.getpass('Please enter password for '+username+': ')
enable_secret = getpass.getpass('Please enter secret: ')

if username == "" or password == "" or enable_secret == "":
    print('username, password or enable_secret cannot be empty. Please enter valid credentials!!!')
    sys.exit()

if os.path.isdir(os.getcwd()+'/temps/'):
    pass

else:
    print('The "temps" folder is not exists. Script will create automatically.')
    os.system('mkdir '+os.getcwd()+'/temps/')

def get_cdp_neighbors(ip, username, password, enable_secret):
    ssh_connection = ConnectHandler(
        device_type = 'cisco_ios',
        ip = ip,
        username = username,
        password = password,
        secret = enable_secret
    )
    ssh_connection.enable()
    result = ssh_connection.find_prompt() + "\n"
    result = ssh_connection.send_command("show cdp neighbors", delay_factor=0)

    with open(os.getcwd()+'/temps/'+ip, 'w') as outfile:
        outfile.write(result)
    ssh_connection.disconnect()

def write_descr(ip, username, password, enable_secret, localint, descr):
    ssh_connection = ConnectHandler(
        device_type = 'cisco_ios',
        ip = ip,
        username = username,
        password = password,
        secret = enable_secret
    )
    ssh_connection.enable()
    rt = ssh_connection.find_prompt() + "\n"
    rt = ssh_connection.send_command("conf t", delay_factor=0)
    rt = ssh_connection.send_command("int "+localint, delay_factor=0)
    rt = ssh_connection.send_command("description "+descr, delay_factor=0)
    rt = ssh_connection.send_command("do write", delay_factor=0)
    ssh_connection.disconnect()

for ip in ciscoips:
    get_cdp_neighbors(ip, username, password, enable_secret)
    ctfls = os.popen('cat temps/'+ip+' | grep / | wc -l').read()

    for i in range(1, int(ctfls)+1):
        descr = os.popen('cat temps/'+ip+' | grep -A 1 "bvim.lan" | awk \'NR%2{printf $0" ";next;}1\' | tail -n '+str(i)+' | awk -F\' \' \'BEGIN{OFS="-"} {print $1,$8,$9}\'').readline().strip()
        localint = os.popen('cat temps/'+ip+'| grep -A 1 "bvim.lan" | awk \'NR%2{printf $0" ";next;}1\' | tail -n '+str(i)+' | awk \'{print $2,$3}\'').readline().strip()
        write_descr(ip, username, password, enable_secret, localint, descr)
