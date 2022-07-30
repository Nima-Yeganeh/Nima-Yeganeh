import textwrap

sample_string = '''Hello everyone! Python is an interpreted high-level programming language.'''

w = textwrap.fill(text=sample_string, width=50) 
  
print(w)
