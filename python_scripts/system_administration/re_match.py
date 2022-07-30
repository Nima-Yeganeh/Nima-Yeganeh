import re

str_line = "This is python test. Do you enjoy testing python ?"

obj = re.match(r'(.*) enjoy (.*?) .*', str_line)

if obj:
	print(obj.groups())
