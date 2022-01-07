########################################################################################################################################################################

-- Run the following queries over on the sample classicmodels database, understand them and explain what each query does.

-- 1. SELECT A.productCode, A.productName, B.orderNumber 
-- FROM products A
-- INNER JOIN orderDetails B 
-- on A.productCode = B.productCode;

-- USE classicmodels;

-- SELECT A.productCode, A.productName, B.orderNumber 
-- FROM products A
-- INNER JOIN orderDetails B 
-- on A.productCode = B.productCode;

########################################################################################################################################################################

-- 2. SELECT c.customerNumber, customerName,orderNumber, o.status 
-- FROM customers c
-- LEFT JOIN orders o 
-- ON c.customerNumber = o.customerNumber;

-- SELECT c.customerNumber, customerName,orderNumber, o.status 
-- FROM customers c
-- LEFT JOIN orders o 
-- ON c.customerNumber = o.customerNumber;

########################################################################################################################################################################

-- 3. SELECT o.customerNumber, orderNumber, o.status, customerName 
-- FROM orders o
-- RIGHT JOIN customers c 
-- ON o.customerNumber = c.customerNumber;

-- SELECT o.customerNumber, orderNumber, o.status, customerName 
-- FROM orders o
-- RIGHT JOIN customers c 
-- ON o.customerNumber = c.customerNumber;

########################################################################################################################################################################

-- 4. SELECT c.customerNumber, c.customerName, c.salesRepEmployeeNumber, e.lastName, e.firstName
-- FROM customers c
-- LEFT OUTER JOIN employees e
-- ON c.salesRepEmployeeNumber = e.employeeNumber;

-- SELECT c.customerNumber, c.customerName, c.salesRepEmployeeNumber, e.lastName, e.firstName
-- FROM customers c
-- LEFT OUTER JOIN employees e
-- ON c.salesRepEmployeeNumber = e.employeeNumber;

########################################################################################################################################################################

-- 5. SELECT c.customerNumber, c.customerName, e.employeeNumber, e.lastName, e.firstName 
-- FROM customers c
-- RIGHT OUTER JOIN employees e
-- ON c.salesRepEmployeeNumber = e.employeeNumber;

-- SELECT c.customerNumber, c.customerName, e.employeeNumber, e.lastName, e.firstName 
-- FROM customers c
-- RIGHT OUTER JOIN employees e
-- ON c.salesRepEmployeeNumber = e.employeeNumber;

########################################################################################################################################################################

-- 6. Unfortunately, MySQL does not have a FULL OUTER JOIN. Anyway, write a query to perform customers FULL OUTER JOIN employees using an alternate way.

-- SELECT c.customerNumber, c.customerName, e.employeeNumber, e.lastName, e.firstName 
-- FROM customers c
-- FULL OUTER JOIN employees e
-- ON c.salesRepEmployeeNumber = e.employeeNumber
-- WHERE condition;

-- SELECT c.customerNumber, c.customerName, e.employeeNumber, e.lastName, e.firstName 
-- FROM customers c
-- LEFT JOIN employees e
-- ON c.salesRepEmployeeNumber = e.employeeNumber
-- UNION
-- SELECT c.customerNumber, c.customerName, e.employeeNumber, e.lastName, e.firstName 
-- FROM customers c
-- RIGHT JOIN employees e
-- ON c.salesRepEmployeeNumber = e.employeeNumber;

########################################################################################################################################################################

-- 7. SELECT o.customerNumber, orderNumber, o.status, customerName 
-- FROM orders o
-- JOIN customers c;

-- SELECT o.customerNumber, orderNumber, o.status, customerName 
-- FROM orders o
-- JOIN customers c;

########################################################################################################################################################################

-- 8. SELECT o.customerNumber, orderNumber, o.status, customerName 
-- FROM orders o
-- NATURAL JOIN customers c;

-- SELECT o.customerNumber, orderNumber, o.status, customerName 
-- FROM orders o
-- NATURAL JOIN customers c;

########################################################################################################################################################################

-- 9. SELECT o.customerNumber, orderNumber, o.status, customerName 
-- FROM orders o
-- INNER JOIN customers c;

-- SELECT o.customerNumber, orderNumber, o.status, customerName 
-- FROM orders o
-- INNER JOIN customers c;

########################################################################################################################################################################

-- 10. SELECT customerNumber, orderNumber, status, customerName 
-- FROM orders
-- JOIN customers
-- USING (customerNumber);

-- SELECT customerNumber, orderNumber, status, customerName 
-- FROM orders
-- JOIN customers
-- USING (customerNumber);

########################################################################################################################################################################

-- 11. Write a query to join the three tables - customers LEFT OUTER JOIN (orders INNER JOIN orderdetails)

-- SELECT c.customerNumber,o.ordernumber
-- FROM customers c
-- LEFT JOIN (SELECT orders.customerNumber, orderdetails.ordernumber
-- FROM orders
-- JOIN orderdetails
-- ON orders.ordernumber=orderdetails.ordernumber) as o
-- ON c.customerNumber=o.customerNumber;

-- INNER JOIN orderdetails = JOIN orderdetails

########################################################################################################################################################################

-- 12. SELECT customerNumber, checkNumber, amount 
-- FROM payments
-- WHERE (customerNumber, checkNumber) 
-- NOT IN (
-- SELECT p.customerNumber, p.checkNumber 
-- FROM payments p, payments q
-- where p.amount<q.amount);

-- SELECT customerNumber, checkNumber, amount 
-- FROM payments
-- WHERE (customerNumber, checkNumber) 
-- NOT IN (
-- SELECT p.customerNumber, p.checkNumber 
-- FROM payments p, payments q
-- where p.amount<q.amount);

########################################################################################################################################################################

-- 13. SELECT customerNumber, customerName 
-- FROM customers
-- WHERE customerName 
-- LIKE '%toys%';

-- SELECT customerNumber, customerName 
-- FROM customers
-- WHERE customerName 
-- LIKE '%toys%';

########################################################################################################################################################################

-- 14. SELECT customerNumber, customerName 
-- FROM customers
-- WHERE customerName COLLATE latin1_general_cs 
-- LIKE '%Land%';

-- SELECT customerNumber, customerName 
-- FROM customers
-- WHERE customerName 
-- COLLATE latin1_general_cs 
-- LIKE '%Land%';

########################################################################################################################################################################

-- 15. SELECT firstName, lastName, extension 
-- FROM employees
-- WHERE extension 
-- LIKE 'x_ _ _ ';

-- SELECT firstName, lastName, extension 
-- FROM employees
-- WHERE extension 
-- LIKE 'x_ _ _ ';

########################################################################################################################################################################

-- 16. SELECT firstName, upper(lastName) as lastName FROM employees;

-- SELECT firstName, upper(lastName) as lastName FROM employees;

########################################################################################################################################################################

-- 17. SELECT p.productCode, productName 
-- FROM products p 
-- WHERE quantityInStock <100 AND
-- EXISTS
-- (SELECT orderNumber FROM orderdetails o WHERE p.productCode = o.productCode);

-- SELECT p.productCode, productName 
-- FROM products p 
-- WHERE quantityInStock <100 AND
-- EXISTS
-- (SELECT orderNumber FROM orderdetails o WHERE p.productCode = o.productCode);

########################################################################################################################################################################

-- 18. SELECT ordernumber, sum(quantityOrdered) AS itemsCount, sum(priceeach) AS total 
-- FROM orderdetails
-- GROUP BY ordernumber
-- HAVING total > 1000 AND itemsCount > 600;

-- SELECT ordernumber, sum(quantityOrdered) AS itemsCount, sum(priceeach) AS total 
-- FROM orderdetails
-- GROUP BY ordernumber
-- HAVING total > 1000 AND itemsCount > 600;

########################################################################################################################################################################

-- 19. SELECT ordernumber, itemsCount 
-- FROM (
-- SELECT ordernumber, sum(quantityOrdered) AS itemsCount FROM orderdetails
-- GROUP BY ordernumber
-- ) as t
-- WHERE t.itemsCount >300;

-- SELECT ordernumber, itemsCount 
-- FROM (
-- SELECT ordernumber, sum(quantityOrdered) AS itemsCount FROM orderdetails
-- GROUP BY ordernumber
-- ) as t
-- WHERE t.itemsCount >300;

########################################################################################################################################################################

-- 20. Write a query to list the names of all products along with total quantity ordered for which the total quantity ordered has exceeded 5000

-- SELECT name,sum(number) as toq
-- FROM (SELECT p.productname as name, o.quantityordered as number
-- FROM products p, orderdetails o
-- WHERE p.productcode = o.productcode) as x
-- GROUP by x.name
-- HAVING toq>5000;

########################################################################################################################################################################




