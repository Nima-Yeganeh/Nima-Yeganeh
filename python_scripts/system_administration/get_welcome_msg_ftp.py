from ftplib import FTP

ftp = FTP('192.168.7.234')
ftp.login('admin','admin')

welcome_msg = ftp.getwelcome()
print(welcome_msg)

ftp.close()
