import paramiko
import time
import getpass

ssh_client = paramiko.SSHClient()
print(type(ssh_client))

ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
password = getpass.getpass('Enter password:')
router = {'hostname':'192.168.244.101','port':'22','username':'cisco','password':password}

print(f'Connecting to {router["hostname"]}')
ssh_client.connect(**router, look_for_keys=False, allow_agent=False)

print('Connected!')
shell = ssh_client.invoke_shell()
shell.send('terminal length 0\n')
shell.send('show version\n')
shell.send('show ip int bri\n')
time.sleep(1)

output = shell.recv(99999)
output = output.decode('utf-8')
print(output)

if ssh_client.get_transport().is_active() == True:
    print('Closing Connection!')
    ssh_client.close()
