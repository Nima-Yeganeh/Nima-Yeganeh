import getpass
passwd = getpass.getpass(prompt='Enter your password: ')
if passwd.lower() == 'password':
	print('Welcome!!')
else:
	print('The password entered is incorrect!!')
