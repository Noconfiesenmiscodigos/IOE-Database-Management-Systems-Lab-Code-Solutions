C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p
Enter password: *******
Enter password: dbms123

########################################################################################################################################################################

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 27
Server version: 8.0.27 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>

########################################################################################################################################################################

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
6 rows in set (0.22 sec)

########################################################################################################################################################################

mysql>  create database db_bct031;
Query OK, 1 row affected (0.11 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| db_bct031          |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.00 sec)

########################################################################################################################################################################

mysql> use db_bct031;
Database changed
mysql> show tables;
Empty set (0.05 sec)

########################################################################################################################################################################

mysql> help

For information about MySQL products and services, visit:
   http://www.mysql.com/
For developer information, including the MySQL Reference Manual, visit:
   http://dev.mysql.com/
To buy MySQL Enterprise support, training, or other products, visit:
   https://shop.mysql.com/

List of all MySQL commands:
Note that all text commands must be first on line and end with ';'
?         (\?) Synonym for `help'.
clear     (\c) Clear the current input statement.
connect   (\r) Reconnect to the server. Optional arguments are db and host.
delimiter (\d) Set statement delimiter.
ego       (\G) Send command to mysql server, display result vertically.
exit      (\q) Exit mysql. Same as quit.
go        (\g) Send command to mysql server.
help      (\h) Display this help.
notee     (\t) Don't write into outfile.
print     (\p) Print current command.
prompt    (\R) Change your mysql prompt.
quit      (\q) Quit mysql.
rehash    (\#) Rebuild completion hash.
source    (\.) Execute an SQL script file. Takes a file name as an argument.
status    (\s) Get status information from the server.
system    (\!) Execute a system shell command.
tee       (\T) Set outfile [to_outfile]. Append everything into given outfile.
use       (\u) Use another database. Takes database name as argument.
charset   (\C) Switch to another charset. Might be needed for processing binlog with multi-byte charsets.
warnings  (\W) Show warnings after every statement.
nowarning (\w) Don't show warnings after every statement.
resetconnection(\x) Clean session context.
query_attributes Sets string parameters (name1 value1 name2 value2 ...) for the next query to pick up.

For server side help, type 'help contents'

########################################################################################################################################################################

mysql> CREATE TABLE Student ( Sid integer(3),
    -> Sname Varchar(30),
    -> Sphone integer(10),
    ->  Primary key(sid));

########################################################################################################################################################################

mysql> describe student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| Sid    | int         | NO   | PRI | NULL    |       |
| Sname  | varchar(30) | YES  |     | NULL    |       |
| Sphone | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

########################################################################################################################################################################

mysql> mysql> Alter Table Student
    -> Add email varchar(30)
    -> not null;

########################################################################################################################################################################

mysql> describe student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| Sid    | int         | NO   | PRI | NULL    |       |
| Sname  | varchar(30) | YES  |     | NULL    |       |
| Sphone | int         | YES  |     | NULL    |       |
| email  | varchar(30) | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.05 sec)

########################################################################################################################################################################

mysql> Alter Table Student
    -> Modify Column email varchar(40)
    -> ;

########################################################################################################################################################################

mysql> describe student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| Sid    | int         | NO   | PRI | NULL    |       |
| Sname  | varchar(30) | YES  |     | NULL    |       |
| Sphone | int         | YES  |     | NULL    |       |
| email  | varchar(40) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

########################################################################################################################################################################

mysql> Alter Table Student
    -> Modify Column email varchar(40)
    -> not null;
Query OK, 0 rows affected (0.63 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe Student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| Sid    | int         | NO   | PRI | NULL    |       |
| Sname  | varchar(30) | YES  |     | NULL    |       |
| Sphone | int         | YES  |     | NULL    |       |
| email  | varchar(40) | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

########################################################################################################################################################################

mysql> Alter Table Student
    -> Rename column email to semail
    -> ;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe Student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| Sid    | int         | NO   | PRI | NULL    |       |
| Sname  | varchar(30) | YES  |     | NULL    |       |
| Sphone | int         | YES  |     | NULL    |       |
| semail | varchar(40) | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

########################################################################################################################################################################

mysql> Alter Table Student
    -> drop column semail;
Query OK, 0 rows affected (0.41 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| Sid    | int         | NO   | PRI | NULL    |       |
| Sname  | varchar(30) | YES  |     | NULL    |       |
| Sphone | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.05 sec)

########################################################################################################################################################################

mysql> Drop Table Student;
Query OK, 0 rows affected (0.40 sec)

mysql> Drop Database db_bct031
    -> ;
Query OK, 1 row affected (0.26 sec)

########################################################################################################################################################################

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
6 rows in set (0.00 sec)

########################################################################################################################################################################