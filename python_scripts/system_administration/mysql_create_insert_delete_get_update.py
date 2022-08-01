
import MySQLdb as mdb

con_obj = mdb.connect('localhost', 'test_user', 'test123', 'test')

with con_obj:
    
	cur_obj = con_obj.cursor()
	cur_obj.execute("DROP TABLE IF EXISTS books")

	cur_obj.execute("CREATE TABLE books(Id INT PRIMARY KEY AUTO_INCREMENT, Name VARCHAR(100))")

	cur_obj.execute("INSERT INTO books(Name) VALUES('Harry Potter')")
	cur_obj.execute("INSERT INTO books(Name) VALUES('Lord of the rings')")
	cur_obj.execute("INSERT INTO books(Name) VALUES('Murder on the Orient Express')")
	cur_obj.execute("INSERT INTO books(Name) VALUES('The adventures of Sherlock Holmes')")
	cur_obj.execute("INSERT INTO books(Name) VALUES('Death on the Nile')")

print("Table Created !!")
print("Data inserted Successfully !!")

####

import MySQLdb as mdb

con_obj = mdb.connect('localhost', 'test_user', 'test123', 'test');

cur_obj = con_obj.cursor()

cur_obj.execute("DELETE FROM books WHERE Id = 5");

try:
	con_obj.commit()
except:
	con_obj.rollback()

####

import MySQLdb as mdb
import sys

con_obj = mdb.connect('localhost', 'test_user', 'test123', 'test');

cur_obj = con_obj.cursor()
cur_obj.execute("SELECT VERSION()")

version = cur_obj.fetchone()
   
print ("Database version : %s " % version)

con_obj.close()

####

import MySQLdb as mdb

con_obj = mdb.connect('localhost', 'test_user', 'test123', 'test')

with con_obj: 

	cur_obj = con_obj.cursor()
	cur_obj.execute("SELECT * FROM books")

	records = cur_obj.fetchall()

	for r in records:
		print(r)

####

import MySQLdb as mdb

con_obj = mdb.connect('localhost', 'test_user', 'test123', 'test');

cur_obj = con_obj.cursor()

cur_obj.execute("UPDATE books SET Name = 'Fantastic Beasts' WHERE Id = 1")

try:
	con_obj.commit()
except:
	con_obj.rollback()

    