import paramiko
import time

ssh_client = paramiko.SSHClient()
print(type(ssh_client))

ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
router = {'hostname':'192.168.244.101','port':'22','username':'cisco','password':'password'}

print(f'Connecting to {router["hostname"]}')
ssh_client.connect(**router, look_for_keys=False, allow_agent=False)

print('Connected!')
shell = ssh_client.invoke_shell()
shell.send('terminal length 0\n')
shell.send('conf t\n')
shell.send('router ospf test\n')
shell.send('address-family ipv4\n')
shell.send('area 0\n')
shell.send('authentication-key cisco\n')
shell.send('authentication message-digest\n')
shell.send('message-digest-key 1 md5 cisco\n')
shell.send('network broadcast\n')
shell.send('hello-interval 1\n')
shell.send('interface GigabitEthernet0/0/0/1\n')
shell.send('network broadcast\n')
shell.send('commit\n')
shell.send('end\n')
time.sleep(1)

output = shell.recv(99999)
output = output.decode('utf-8')
print(output)

if ssh_client.get_transport().is_active() == True:
    print('Closing Connection!')
    ssh_client.close()
