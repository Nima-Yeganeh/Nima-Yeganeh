from ftplib import FTP

ftp = FTP('192.168.1.1')
ftp.login('admin','admin')

ftp.cwd('/home/')
files = ftp.nlst()

# Print out the files
for file in files:
	print("Downloading..." + file)
	ftp.retrbinary("RETR " + file ,open("/home/" + file, 'wb').write)

ftp.close()
