#!/usr/bin/python

import MySQLdb as mdb
import sys
import threading

# open a database connection
con = mdb.connect(
        host = 'localhost',
        user = 'root', passwd = '',
        db = 'test'
    )

# prepare a cursor object using cursor() method
cursor = con.cursor ()

table = 'new_tab_aby'

input_data      = 1     # 1 -> input data;
                        # 0 -> use data that already exists
number_of_rows  = 3
commit_after    = number_of_rows

if input_data == 1 :
    # input data to the database
    for x in xrange(number_of_rows):
        query = 'insert into '+table+' values('+str(x)+',100)'
        cursor.execute(query)

        if x%commit_after == 0 :             # commit every n rows
            con.commit()

perform_update  = 1      # 1 -> perform update on the data
update_by       = str(5) # all the values are incremented by this number
threads         = number_of_rows*50
maximum_id      = 0

def update_method():
    # each thread is an update_method instance;
    # we want each thread to perfom an update on
    # each row of the table
    small_con = mdb.connect(
            host = 'localhost',
            user = 'root', passwd = '',
            db = 'test'
        )
    small_con.autocommit(True)
    small_cursor = small_con.cursor()
    # finding the largest 'id' in the table

    for x in xrange(int(maximum_id)):
        query = 'update '+table+' set id=id+'+update_by+' where s = '+str(x)
        small_cursor.execute(query)
        if x%10 == 0:
            small_con.commit()

if perform_update == 1 :
    thread_set = []

    cursor.execute ('select max(s) from '+table)
    data = cursor.fetchall()
    maximum_id = data[0][0]

    for x in xrange(threads):
        th = threading.Thread(target=update_method)
        th.start()
        thread_set.append(th)

    for th in thread_set:
        th.join()

    print 'all other threads are done'
    con.commit()

# execute the SQL query using execute() method.
cursor.execute ('select s, id from '+table)

# fetch all of the rows from the query
data = cursor.fetchall ()

# print the rows
for row in data :
    print row[0], row[1]

cursor.execute ('select COUNT(*) from '+table)
data = cursor.fetchall()
print data[0][0]

# close the cursor object
cursor.close ()
# close the connection
con.close ()
# exit the program
sys.exit()
