########################################################################################################################################################################

-- 1. Login to your MySQL server through command line

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p
Enter password: *******
Enter password: dbms123

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

-- 2. View existing databases in your database server

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sql_hr             |
| sql_inventory      |
| sql_invoicing      |
| sql_store          |
| sys                |
+--------------------+
8 rows in set (0.06 sec)

########################################################################################################################################################################

-- 3. Create your own database DB_YourCRN

mysql> create database db_bct031;
Query OK, 1 row affected (0.14 sec)

########################################################################################################################################################################

-- 4. Use your database and Create the following table with the given schema Employee (eid, ename, eaddress)

mysql> use db_bct031
Database changed
mysql> Create Table Employee(eid integer(5),
    -> ename varchar(20),
    -> eaddress varchar(20));

########################################################################################################################################################################

-- 5. Add a new attribute ???department_name??? to the Employee table

mysql> Alter Table Employee
    -> Add department_name varchar(20);
Query OK, 0 rows affected (0.74 sec)
Records: 0  Duplicates: 0  Warnings: 0

########################################################################################################################################################################

-- 6. Rename column name ???eaddress??? to ???eprovince??? and change its datatype from varchar to integer

mysql> Alter Table Employee
    -> Rename Column eaddress to eprovince;
Query OK, 0 rows affected (0.77 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> Alter Table Employee
    -> Modify Column eprovince integer(1);
Query OK, 0 rows affected, 1 warning (1.09 sec)
Records: 0  Duplicates: 0  Warnings: 1

########################################################################################################################################################################

-- 7. Show existing tables in your database

mysql> describe Employee;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| eid             | int         | YES  |     | NULL    |       |
| ename           | varchar(20) | YES  |     | NULL    |       |
| eprovince       | int         | YES  |     | NULL    |       |
| department_name | varchar(20) | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
4 rows in set (0.05 sec)

########################################################################################################################################################################

-- 8. View schema of the table ???Employee???

-- See Screen Snips

########################################################################################################################################################################

-- first time

create database db_bct031;
use db_bct031;
create Table Employee(eid integer(5), ename varchar(20), eaddress varchar(20));

 Alter Table Employee
     Add department_name varchar(20);


Alter Table Employee
Rename Column eaddress to eprovince;

Alter Table Employee
     Modify Column eprovince integer(1);


describe Employee;

########################################################################################################################################################################

-- multiple times

drop database db_bct031;
create database db_bct031;
use db_bct031;
create Table Employee(eid integer(5), ename varchar(20), eaddress varchar(20));

 Alter Table Employee
     Add department_name varchar(20);


Alter Table Employee
Rename Column eaddress to eprovince;

Alter Table Employee
     Modify Column eprovince integer(1);


describe Employee;

########################################################################################################################################################################



