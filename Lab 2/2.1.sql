########################################################################################################################################################################

-- 1. Create the tables as mentioned in the above schema. Show the use of primary key and foreign key, unique key and not null constraints
-- Account ((u)account_number, branch_name, balance)
-- Branch ((p)branch_name, branch_city, assets)
-- Customer ((p)customer_name, customer_street, customer_city)
-- Loan ((p)loan_number, branch_name, amount)
-- Depositor (customer_name, account_number)
-- Borrower (customer_name, loan_number)

-- drop database db_bct031;

create database db_bct031;

use db_bct031;

create table Branch (branch_name varchar(20) not null primary key,
                     branch_city varchar(20),
                     assets varchar(20));
                     
create table Account_ (account_number integer(20) not null unique,
					   branch_name varchar(20),
                       foreign key (branch_name) references Branch(branch_name), 
                       balance integer(15));
              
create table Customer (customer_name varchar(30) not null primary key, 
                       customer_street varchar(20),
                       customer_city varchar(20));
                       
create table Loan (loan_number integer(15) not null primary key,
				   branch_name varchar(20),
                   foreign key (branch_name) references Branch (branch_name), 
                   amount integer(15));
                   
create table Depositor (customer_name varchar(30),
                       foreign key (customer_name) references Customer(customer_name),
                       account_number integer(20),
                       foreign key (account_number) references Account_(account_number));
                       
create table Borrower (customer_name varchar(30),
                       foreign key (customer_name) references Customer(customer_name), 
                       loan_number integer(15),
                       foreign key (loan_number) references Loan(loan_number));

########################################################################################################################################################################

-- 2. Insert at least five records in each relations

insert into Branch(branch_name, branch_city, assets)
values
("Thapathali", "Kathmandu","Car"),
("Pulchowk", "Lalitpur","House"),
("Baneshor", "Kathmandu","Land"),
("Tirpureshor", "Kathmandu","Car"),
("Gongabu", "Kathmandu","House");

insert into Account_(account_number,branch_name,balance)
values 
(6002,"Gongabu",90000),
(6003,"Tirpureshor",500000),
(6004,"Baneshor",200000),
(6005,"Pulchowk",40000),
(6006,"Thapathali",80000);

insert into Customer(customer_name,customer_street,customer_city)
values 
("Nathen","Gongabu","Kathmandu"),
("John","Baneshor","Kathmandu"),
("Ella","Pulchoek","Lalitpur"),
("Adam","Samakushi","Kathmandu"),
("Samanta","Lagankhel","Kathmandu");

insert into Loan(loan_number,branch_name,amount)
values 
(1999,"Gongabu",99000),
(2000,"Baneshor",160000),
(2001,"Pulchowk",200000),
(2002,"Thapathali",90000),
(2003,"Tirpureshor",60000);

insert into Depositor(customer_name,account_number)
values 
("Nathen",6002),
("Adam",6006),
("Ella",6003),
("John",6004),
("Samanta",6005);

insert into Borrower(customer_name,loan_number)
values 
("Nathen",1999),
("Adam",2000),
("Ella",2001),
("John",2002),
("Samanta",2003);

SELECT * FROM Branch;
SELECT * FROM Account_;
SELECT * FROM Customer;
SELECT * FROM Loan;
SELECT * FROM Depositor;
SELECT * FROM Borrower;

########################################################################################################################################################################

-- 3. Write an SQL query to list the names of all depositors along with their account number and balance

Select customer_name,
        A.account_number,
        balance
 
From Depositor as D,
      Account_ as  A
      
where D.account_number= A.account_number;

########################################################################################################################################################################

-- 4. Write an SQL query to find the names of all customers who have a loan of over 150,000

select customer_name

From Loan,
     Borrower
     
where  amount>=150000 and Loan.loan_number=Borrower.loan_number;   


########################################################################################################################################################################

-- 5. Write a query in SQL to increase all accounts with balances over 100,000 by 6% and all other accounts by 5%

set sql_safe_updates=0;

update Account_
set balance = balance*1.06
where balance>=100000;

update Account_
set balance=balance*1.05
where balance<100000;

set sql_safe_updates=1;

SELECT * FROM Account_;

########################################################################################################################################################################

-- 6. Show all the constraints used in the table ‘Account’

SHOW CREATE TABLE Account_;

select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = Account_;

/*
'Account_', 'CREATE TABLE `account_` (\n  `account_number` int NOT NULL,\n  
`branch_name` varchar(20) DEFAULT NULL,\n  `balance` int DEFAULT NULL,\n  
UNIQUE KEY `account_number` (`account_number`),\n  KEY `branch_name` (`branch_name`),\n  
CONSTRAINT `account__ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `branch` (`branch_name`)\n) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'
*/

########################################################################################################################################################################

-- 7. Delete foreign key constraint that is used on ‘account_number’ field of the table ‘Depositor’

-- First see inormation schema and find constrain
 
 SHOW CREATE TABLE Depositor;

select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME =  Depositor;
 
 /*
'Depositor', 'CREATE TABLE `depositor` (\n  `customer_name` varchar(30) DEFAULT NULL,\n 
 `account_number` int DEFAULT NULL,\n  KEY `customer_name` (`customer_name`),\n  
 KEY `account_number` (`account_number`),\n  
 CONSTRAINT `depositor_ibfk_1` FOREIGN KEY (`customer_name`) REFERENCES `customer` (`customer_name`),
 \n  CONSTRAINT `depositor_ibfk_2` FOREIGN KEY (`account_number`) REFERENCES `account_` 
 (`account_number`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'
 */

Alter Table Depositor
Drop Foreign Key depositor_ibfk_2;

SELECT * FROM Depositor;

-- Check again

 SHOW CREATE TABLE Depositor;

select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME =  Depositor;

/*
 'Depositor', 'CREATE TABLE `depositor` (\n  `customer_name` varchar(30) DEFAULT NULL,\n 
 `account_number` int DEFAULT NULL,\n  KEY `customer_name` (`customer_name`),\n 
 KEY `account_number` (`account_number`),\n  CONSTRAINT `depositor_ibfk_1` FOREIGN KEY (`customer_name`) 
 REFERENCES `customer` (`customer_name`)\n) ENGINE=InnoDB 
 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'
*/

########################################################################################################################################################################

-- 8. Add a foreign key constraint ‘fk_depositor_1’ on field ‘account_number’ of the table ‘Depositor’.

SHOW CREATE TABLE Depositor;

select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME =  Depositor;

/*
'Depositor', 'CREATE TABLE `depositor` (\n  `customer_name` varchar(30) DEFAULT NULL,\n 
 `account_number` int DEFAULT NULL,\n  KEY `customer_name` (`customer_name`),\n  
 KEY `account_number` (`account_number`),\n  CONSTRAINT `depositor_ibfk_1` 
 FOREIGN KEY (`customer_name`) REFERENCES `customer` (`customer_name`),\n 
 CONSTRAINT `depositor_ibfk_2` FOREIGN KEY (`account_number`) REFERENCES `account_` 
 (`account_number`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'
*/

-- Check before Adding

Alter Table Depositor
Add constraint fk_depositor_1 
foreign key (account_number) references Account_(account_number);

-- Check again

SHOW CREATE TABLE Depositor;

select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME =  Depositor;

/*
'Depositor', 'CREATE TABLE `depositor` (\n  `customer_name` varchar(30) DEFAULT NULL,\n 
 `account_number` int DEFAULT NULL,\n  KEY `customer_name` (`customer_name`),\n  
 KEY `fk_depositor_1` (`account_number`),\n  CONSTRAINT `depositor_ibfk_1` 
 FOREIGN KEY (`customer_name`) REFERENCES `customer` (`customer_name`),\n  
 CONSTRAINT `depositor_ibfk_2` FOREIGN KEY (`account_number`) REFERENCES 
 `account_` (`account_number`),\n  CONSTRAINT `fk_depositor_1` FOREIGN KEY (`account_number`) 
 REFERENCES `account_` (`account_number`)\n) ENGINE=InnoDB DEFAULT 
 CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'
*/

########################################################################################################################################################################




