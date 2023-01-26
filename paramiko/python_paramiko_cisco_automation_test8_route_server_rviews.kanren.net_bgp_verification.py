import paramiko
import time

ssh_client = paramiko.SSHClient()
print(type(ssh_client))

ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
router = {'hostname':'rviews.kanren.net','port':'22','username':'rviews','password':'rviews'}

print(f'Connecting to {router["hostname"]}')
ssh_client.connect(**router, look_for_keys=False, allow_agent=False)

print('Connected!')
shell = ssh_client.invoke_shell()
shell.send('terminal length 0\n')
shell.send('show bgp summary\n')
time.sleep(2)

output = shell.recv(99999)
output = output.decode('utf-8')
print(output)

if ssh_client.get_transport().is_active() == True:
    print('Closing Connection!')
    ssh_client.close()
