########################################################################################################################################################################

-- 1. Create your own database.

-- drop database db_bct031;

create database db_bct031;

use classicmodels;

use db_bct031;

create table Branch (branch_name varchar(20) not null primary key,
                     branch_city varchar(20),
                     assets varchar(20));
                     
########################################################################################################################################################################

-- 2. Create database users.

-- DROP USER 'bct031_1';
-- DROP USER 'bct031_2';

CREATE USER 'bct031_1' IDENTIFIED BY 'dbms_1';
CREATE USER 'bct031_2' IDENTIFIED BY 'dbms_2';

########################################################################################################################################################################

-- 3. Assign users to particular database.

GRANT ALL PRIVILEGES ON db_bct031.* TO 'bct031_1';
GRANT SELECT, INSERT ON db_bct031.* TO 'bct031_2';
flush privileges;

SHOW GRANTS FOR 'bct031_1';
SHOW GRANTS FOR 'bct031_2';

########################################################################################################################################################################

-- 4. Grant privilege to access certain table of one schema to another schema (supports modular programming).

GRANT ALL PRIVILEGES ON classicmodels.employees TO 'bct031_1';

SHOW GRANTS FOR 'bct031_1';

########################################################################################################################################################################

-- 5. Revoke privileges.

REVOKE ALL PRIVILEGES ON db_bct031.* FROM 'bct031_1';
REVOKE SELECT, INSERT ON db_bct031.* FROM 'bct031_2';

-- Despite error message in MySQL Workbench code runs perfectly

########################################################################################################################################################################

-- Microsoft Windows [Version 10.0.19043.1526]
-- (c) Microsoft Corporation. All rights reserved.

-- C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u bct031_1 -p
-- Enter password: ****** = dbms_1
-- Welcome to the MySQL monitor.  Commands end with ; or \g.
-- Your MySQL connection id is 30
-- Server version: 8.0.27 MySQL Community Server - GPL

-- Copyright (c) 2000, 2021, Oracle and/or its affiliates.

-- Oracle is a registered trademark of Oracle Corporation and/or its
-- affiliates. Other names may be trademarks of their respective
-- owners.

-- Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

-- mysql> 

########################################################################################################################################################################
