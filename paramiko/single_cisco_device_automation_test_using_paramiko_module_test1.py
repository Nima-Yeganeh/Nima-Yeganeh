import my_paramiko_module

router1 = {'server_ip':'192.168.244.101','server_port':'22','user':'cisco','passwd':'password'}
client = my_paramiko_module.connect(**router1)
shell = my_paramiko_module.get_shell(client)

my_paramiko_module.send_command(shell, 'term len 0')
my_paramiko_module.send_command(shell, 'show ip int bri')

output = my_paramiko_module.show(shell)
print(output)

my_paramiko_module.close(client)
