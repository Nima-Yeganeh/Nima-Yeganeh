import http.client

con_obj = http.client.HTTPConnection('www.google.com', 80, timeout=100)
print(con_obj)
