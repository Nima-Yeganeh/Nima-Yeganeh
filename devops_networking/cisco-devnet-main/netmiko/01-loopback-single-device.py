from netmiko import ConnectHandler
import logging

# Optional: Enable global logging
logging.basicConfig(filename='logs/netmiko_global.log', level=logging.DEBUG)
logger = logging.getLogger("netmiko")

# Create a dictionary representing the device.
switch = {
    'device_type': 'cisco_ios',
    'host':   '10.1.1.70',
    'username': 'cisco',
    'password': 'Devnet2021',
    #'port' : 7890, # Optional: defaults to 22
    'secret': 'Cisco2021', # Optional: defaults to ''
    'session_log': 'logs/netmiko_session.log' # Optional: enable session logging
}

# Establish an SSH connection to the device by passing in the device dictionary.
ssh_connect = ConnectHandler(**switch)

# Enter Cisco Privileged EXEC Mode.
ssh_connect.enable()

# Execute show command.
print('=== Before Configuration ===')
output = ssh_connect.send_command('show ip int brief')
print(output)

# Just give new line space for prettier output.
print('\r\n')

# Execute configuration change commands (will automatically enter into config mode).
config_commands = [
    'int lo0',
    'ip address 10.0.0.1 255.255.255.255',
]
ssh_connect.send_config_set(config_commands)

# Execute show command
output = ssh_connect.send_command('show ip int brief')
print('=== After Configuration ===', end='\n')
print(output)

# Terminate the SSH session
ssh_connect.disconnect()
