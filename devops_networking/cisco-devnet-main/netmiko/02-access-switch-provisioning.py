from os import sys
from netmiko import ConnectHandler
import logging

# Optional: Enable global logging
logging.basicConfig(filename='netmiko_global.log', level=logging.DEBUG)
logger = logging.getLogger("netmiko")

# Create a dictionary representing the device.
aceess_switches = [
    {
        'device_type': 'cisco_ios',
        'host':   '10.1.1.61',
        'username': 'cisco',
        'password': 'Switch1',
        'secret': 'Cisco2021',
        'session_log': 'logs/sw1.log'
    },
    {
        'device_type': 'cisco_ios',
        'host':   '10.1.1.62',
        'username': 'cisco',
        'password': 'Switch2',
        'secret': 'Cisco2021',
        'session_log': 'logs/sw2.log'
    },
    {
        'device_type': 'cisco_ios',
        'host':   '10.1.1.63',
        'username': 'cisco',
        'password': 'Switch3',
        'secret': 'Cisco2021',
        'session_log': 'logs/sw3.log'
    },
]

config_commands = [
    'int g0/1',
    'switchport trunk encapsulation dot1q',
    'switchport mode trunk',
    'switchport trunk allowed vlan 10,20',
    'vtp version 2',
    'vtp mode client',
    'vtp domain cisco',
    'vtp password vtpcisco123'
]

# Fetch all access_switches
for switch in aceess_switches:
    try:
        # Establish an SSH connection.
        ssh_connect = ConnectHandler(**switch)

        # Enter Cisco Privileged EXEC Mode.
        ssh_connect.enable()

        # Send configuration.
        ssh_connect.send_config_set(config_commands)

        # Save config to startup-config.
        ssh_connect.save_config()

        # Terminate the SSH session.
        ssh_connect.disconnect()

        print('[INFO] ' + switch['host'] + ' configured successfully!')

    except:
        print('[INFO] ' +  switch['host'] + ' failed!')

        # Print detail exception.
        for error in sys.exc_info():
            print(error)
        continue