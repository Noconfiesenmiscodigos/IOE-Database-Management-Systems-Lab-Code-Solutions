########################################################################################################################################################################

-- Understand and run the following SQL queries. Write down the purpose of each query.

-- 1. CREATE VIEW SalePerOrder_(your roll number) 
-- AS SELECT orderNumber,
-- SUM (quantityOrdered * priceEach) total 
-- FROM orderDetails
-- GROUP by orderNumber
-- ORDER BY total DESC;

USE classicmodels;

CREATE VIEW SalePerOrder_031
AS SELECT orderNumber,
SUM(quantityOrdered * priceEach) total 
FROM orderDetails
GROUP BY orderNumber
ORDER BY total DESC;
select * from SalePerOrder_031;

########################################################################################################################################################################

-- 2. SELECT total
-- FROM salePerOrder_(your roll number) 
-- WHERE orderNumber 10102;

SELECT total
FROM salePerOrder_031 
WHERE orderNumber = 10102;

########################################################################################################################################################################

-- 3. CREATE VIEW vwProducts_(your roll numer) 
-- AS SELECT productCode, productName, buyPrice 
-- FROM products
-- WHERE buyPrice > (
-- SELECT AVG (buyPrice) FROM products)
-- ORDER BY buyPrice DESC;

-- DROP VIEW vwProducts_031;

CREATE VIEW vwProducts_031
AS SELECT productCode, productName, buyPrice 
FROM products
WHERE buyPrice > (SELECT AVG(buyPrice) FROM products);

select * from vwProducts_031; #view the new view

Select AVG(buyPrice) from products; #average price

########################################################################################################################################################################

-- 4. CREATE VIEW officeInfo_(your roll numer) AS
-- SELECT officeCode, phone, city
-- FROM offices;

CREATE VIEW officeInfo_031 AS
SELECT officeCode, phone, city
FROM offices;

select * from officeInfo_031;

########################################################################################################################################################################

-- 5. UPDATE officeInfo
-- SET phone = 'your phone number'
-- WHERE officeCode = 4;

UPDATE officeInfo_031
SET phone = '+977 980 000 0000',
city = 'Kathamndu'
WHERE officeCode = '4';

select officeCode,phone,city
from offices;

########################################################################################################################################################################

-- 6. CREATE VIEW organization_(your roll number) AS
-- SELECT CONCAT (E.lastname,E.firstname) AS Employee,
-- CONCAT (M.lastname,M.firstname) AS Manager
-- FROM employees AS E INNER JOIN employees AS M
-- ON M.employeeNumber = E.ReportsTo
-- ORDER BY Manager;

CREATE VIEW organization_031 AS
SELECT CONCAT(E.lastname,E.firstname) AS Employee,
CONCAT(M.lastname,M.firstname) AS Manager
FROM employees AS E INNER JOIN employees AS M
ON M.employeeNumber = E.ReportsTo
ORDER BY Manager;

show create view organization_031;

select * from organization_031;

########################################################################################################################################################################

-- 7. SHOW CREATE VIEW organization_(your roll number);

show create view organization_031;

select * from organization_031;

########################################################################################################################################################################

-- 8. ALTER VIEW organization_(your roll number) AS
-- SELECT CONCAT(E.lastname,E.firstname) AS Employee, E.email AS employeeEmail, CONCAT(M.lastname,M.firstname) AS Manager
-- FROM employees AS E INNER JOIN employees AS M
-- ON M.employeeNumber = E.ReportsTo ORDER BY Manager;

ALTER VIEW organization_031 AS
SELECT CONCAT(E.lastname,E.firstname) AS Employee, 
E.email AS employeeEmail, 
CONCAT(M.lastname,M.firstname) AS Manager
FROM employees AS E INNER JOIN employees AS M
ON M.employeeNumber = E.ReportsTo 
ORDER BY Manager;

select * from organization_031;

########################################################################################################################################################################

-- 9. DROP VIEW IF EXISTS organization_(your roll number);

DROP VIEW IF EXISTS organization_031;

########################################################################################################################################################################

-- 10. CREATE TABLE employees_audit (
-- id int(11) NOT NULL AUTO_INCREMENT,
-- employeeNumber int(11) NOT NULL, lastname varchar(50) NOT NULL, changedon datetime DEFAULT NULL, action varchar(50) DEFAULT NULL, PRIMARY KEY (id)
-- );

CREATE TABLE employees_audit (
id int(11) NOT NULL AUTO_INCREMENT,
employeeNumber int(11) NOT NULL, 
lastname varchar(50) NOT NULL, 
changedon datetime DEFAULT NULL, 
action varchar(50) DEFAULT NULL, 
PRIMARY KEY (id)
);

select * from employees;

########################################################################################################################################################################

-- 11. Set the delimiter to | before running the following query

-- CREATE TRIGGER before_employee_update_(your roll number)
-- BEFORE UPDATE ON employees
-- FOR EACH ROW
-- BEGIN
-- INSERT INTO employees_audit
-- SET action = 'update',
-- employeeNumber = OLD.employeeNumber, lastname = OLD.lastname,
-- changedon = NOW();
-- END|;

-- Update a record in the employees table and check the employees_audit table. Why do you think we need to change the delimiter?

DELIMITER |

create trigger before_employee_update_031
before update on employees
for each row
begin
insert into employees_audit
set action='update',
employeeNumber=OLD.employeeNumber,
lastname=OLD.lastname,
changedon=now();
End|

update employees -- 1612 'pmarsh@classicmodelcars.com' '6'
set email='newemail@classicmodelcars.com',
officeCode='4'
where employeeNumber=1612;

select * from employees_audit;

########################################################################################################################################################################

-- 12. SELECT *
-- FROM Information_Schema.Triggers
-- WHERE Trigger_schema = 'classicmodels'
-- AND Trigger_name = 'before_employee_update_(your roll number)';

SELECT *
FROM Information_Schema.Triggers
WHERE Trigger_schema = 'classicmodels'
AND Trigger_name = 'before_employee_update_031';

########################################################################################################################################################################

-- 13. DROP TRIGGER before_employee_update_(your roll number);

DROP TRIGGER before_employee_update_031;

########################################################################################################################################################################
