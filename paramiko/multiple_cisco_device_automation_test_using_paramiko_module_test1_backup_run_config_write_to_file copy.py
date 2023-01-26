import my_paramiko_module

router1 = {'server_ip':'192.168.244.101','server_port':'22','user':'cisco','passwd':'password'}
router2 = {'server_ip':'192.168.244.102','server_port':'22','user':'cisco','passwd':'password'}
router3 = {'server_ip':'192.168.244.103','server_port':'22','user':'cisco','passwd':'password'}
router4 = {'server_ip':'192.168.244.104','server_port':'22','user':'cisco','passwd':'password'}

routers = [router1, router2, router3, router4]

for router in routers:  
    client = my_paramiko_module.connect(**router)
    shell = my_paramiko_module.get_shell(client)
    my_paramiko_module.send_command(shell, 'term len 0')
    my_paramiko_module.send_command(shell, 'show ip int bri')
    output = my_paramiko_module.show(shell)
    with open('router-backup.txt', 'w') as f:
        f.write(output)
    print(output)
    my_paramiko_module.close(client)
