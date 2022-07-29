import getpass
user_name = getpass.getuser()
print ("User Name : %s" % user_name)
passwd = getpass.getpass("Enter your Password:")
if passwd == 'password':
	print ("Welcome!!!")
else:
	print ("The password you entered is incorrect.")
