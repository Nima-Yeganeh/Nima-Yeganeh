import re

str_line = 'Nima Piper picked a peck of pickled peppers. How many pickled peppers did Nima Piper pick?'
print("Original: ", str_line)

p = re.sub('Nima', 'Mary', str_line)
print("Replaced: ", p)

p = re.sub('Nima', 'Mary', str_line, count=1)
print("Replacing only one occurrence of Nima... ")
print("Replaced: ", p)
