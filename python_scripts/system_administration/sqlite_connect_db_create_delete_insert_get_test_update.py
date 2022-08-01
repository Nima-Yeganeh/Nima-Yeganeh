import sqlite3

con_obj = sqlite3.connect('test.db')
print ("Database connected successfully !!")

####

import sqlite3

con_obj = sqlite3.connect("test.db")
with con_obj:
	cur_obj = con_obj.cursor()

	cur_obj.execute("""CREATE TABLE books(title text, author text)""")
	print ("Table created")

####

import sqlite3

con_obj = sqlite3.connect("test.db")
with con_obj:
	cur_obj = con_obj.cursor()
	sql = """
		DELETE FROM books
		WHERE author = 'John Smith'
		"""
	cur_obj.execute(sql)
print("Data deleted successfully !!")

####

import sqlite3

con_obj = sqlite3.connect("test.db")
with con_obj:
	cur_obj = con_obj.cursor()

	cur_obj.execute("INSERT INTO books VALUES ('Pride and Prejudice', 'Jane Austen')")
	cur_obj.execute("INSERT INTO books VALUES ('Harry Potter', 'J.K Rowling')")
	cur_obj.execute("INSERT INTO books VALUES ('The Lord of the Rings', 'J. R. R. Tolkien')")
	cur_obj.execute("INSERT INTO books VALUES ('Murder on the Orient Express', 'Agatha Christie')")
	cur_obj.execute("INSERT INTO books VALUES ('A Study in Scarlet', 'Arthur Conan Doyle')")
	con_obj.commit()

print("Data inserted Successfully !!")

####

import sqlite3

con_obj = sqlite3.connect('test.db')

cur_obj = con_obj.execute("SELECT title, author from books")
for row in cur_obj:
	print ("Title = ", row[0])
	print ("Author = ", row[1], "\n")

con_obj.close()

####

import sqlite3

con_obj = sqlite3.connect("test.db")
with con_obj:
	cur_obj = con_obj.cursor()
	sql = """
		UPDATE books 
		SET author = 'John Smith' 
		WHERE author = 'J.K Rowling'
		"""
	cur_obj.execute(sql)
print("Data updated Successfully !!")
