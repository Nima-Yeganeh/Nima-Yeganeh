# pip3 install scp
# pip3 install scpclient
import paramiko
from scp import SCPClient

ssh_client = paramiko.SSHClient()
ssh_client.load_system_host_keys()
ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh_client.connect(hostname='192.168.244.101',port='22',username='cisco',password='password',allow_agent=False,look_for_keys=False)
# scp = SCPClient(ssh_client.get_transport())
# scp.put('temp.txt', '/misc/config')
# scp.get('/misc/config/default_profile.cfg','default_profile.cfg')
# scp.close()
scp = SCPClient(ssh_client.get_transport())
scp.get('/misc/config/config/running/alternate_cfg/router.cfg','router.cfg')
scp.close()
# scp = SCPClient(ssh_client.get_transport())
# scp.get('/misc/config/config/running/alternate_cfg/router_early.cfg','router_early.cfg')
# scp.close()
