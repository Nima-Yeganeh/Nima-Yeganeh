import requests

link = "http://www.somesite.com/details.pl?urn=2344"
f = requests.get(link)
print(f.text)
