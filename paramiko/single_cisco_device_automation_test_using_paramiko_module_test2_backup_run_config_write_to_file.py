import my_paramiko_module

router1 = {'server_ip':'192.168.244.101','server_port':'22','user':'cisco','passwd':'password'}
client = my_paramiko_module.connect(**router1)
shell = my_paramiko_module.get_shell(client)

my_paramiko_module.send_command(shell, 'term len 0')
my_paramiko_module.send_command(shell, 'show run')

output = my_paramiko_module.show(shell)
with open('router-backup.txt', 'w') as f:
    f.write(output)
print(output)

my_paramiko_module.close(client)
