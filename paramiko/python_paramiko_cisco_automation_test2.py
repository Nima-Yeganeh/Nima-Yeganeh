# pip install paramiko
import paramiko
ssh_client = paramiko.SSHClient()
print(type(ssh_client))
ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
router = {'hostname':'192.168.244.101','port':'22','username':'cisco','password':'password'}
print('Connecting to Router...')
ssh_client.connect(**router, look_for_keys=False, allow_agent=False)
print(ssh_client.get_transport().is_active())
print('Closing Connection!')
ssh_client.close()
