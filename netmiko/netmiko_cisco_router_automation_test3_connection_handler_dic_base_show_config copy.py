from netmiko import ConnectHandler
cisco_device = {
    'device_type': 'cisco_xr',
    'host': '192.168.244.101',
    'username': 'cisco',
    'password': 'password',
    'port': '22',
    'secret': 'cisco',
    'verbose': 'true'
}
connection = ConnectHandler(**cisco_device)
connection.enable()
output = connection.send_command('show run')
print(output)
connection.disconnect()
