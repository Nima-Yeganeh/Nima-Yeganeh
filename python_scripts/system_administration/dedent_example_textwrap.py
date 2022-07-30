import textwrap

str1 = '''
	Hello World \tThis is Python a test
	Scripting language\n
	Python is a high-level programming language.
	'''
print("Original: \n", str1)
print()
t = textwrap.dedent(str1)
print("Dedented: \n", t)
