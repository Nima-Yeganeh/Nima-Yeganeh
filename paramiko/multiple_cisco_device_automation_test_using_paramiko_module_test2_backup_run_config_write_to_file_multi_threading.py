import my_paramiko_module
import threading

def task(router):
    client = my_paramiko_module.connect(**router)
    shell = my_paramiko_module.get_shell(client)
    my_paramiko_module.send_command(shell, 'term len 0')
    my_paramiko_module.send_command(shell, 'show ip int bri')
    output = my_paramiko_module.show(shell)
    with open('router-backup.txt', 'w') as f:
        f.write(output)
    print(output)
    my_paramiko_module.close(client)

router1 = {'server_ip':'192.168.244.101','server_port':'22','user':'cisco','passwd':'password'}
router2 = {'server_ip':'192.168.244.105','server_port':'22','user':'cisco','passwd':'password'}

routers = [router1, router2]

threads = list()
for router in routers:  
    th = threading.Thread(target=task, args=(router,))
    threads.append(th)

for th in threads:
    th.start()

for th in threads:
    th.join()
