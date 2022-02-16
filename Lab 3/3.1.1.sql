########################################################################################################################################################################

-- Import the classic model database in your Mysql server. Try to understand the following queries, run them and write down what each query does.

-- 1. SELECT * FROM employees

USE classicmodels;

SELECT * FROM employees;

########################################################################################################################################################################

-- 2. SELECT lastname,firstname,jobtitle 
-- FROM employees

SELECT lastname,firstname,jobtitle
FROM employees;

########################################################################################################################################################################

-- 3. SELECT firstname,lastname,email
-- FROM employees
-- WHERE jobtitle="president"

SELECT firstname,lastname,email
FROM employees
WHERE jobtitle="president";

########################################################################################################################################################################

-- 4. SELECT DISTINCT jobTitle FROM employees;

SELECT DISTINCT jobTitle FROM employees;

########################################################################################################################################################################

-- 5. SELECT firstname,lastname, jobtitle
-- FROM employees
-- ORDER BY firstname ASC,jobtitle DESC;

SELECT firstname,lastname, jobtitle
FROM employees
ORDER BY firstname ASC,jobtitle DESC;

########################################################################################################################################################################

-- 6. SELECT DISTINCT city, state
-- FROM customers

SELECT DISTINCT city, state
FROM customers;

########################################################################################################################################################################

-- 7. SELECT firstname,lastname
-- FROM employees
-- LIMIT 5

SELECT firstname,lastname
FROM employees
LIMIT 5;

########################################################################################################################################################################

-- 8. SELECT firstname,lastname
-- FROM employees
-- LIMIT 10,5

SELECT firstname,lastname
FROM employees
LIMIT 10,5;

########################################################################################################################################################################

-- 9. SELECT officeCode, city, phone
-- FROM offices
-- WHERE country IN ('USA','France')

SELECT officeCode, city, phone
FROM offices
WHERE country IN ('USA','France');

########################################################################################################################################################################

-- 10. SELECT officeCode, city, phone
-- FROM offices
-- WHERE country IN ('USA','France')

SELECT officeCode, city, phone
FROM offices
WHERE country IN ('USA','France');

########################################################################################################################################################################

-- 11. SELECT orderNumber
-- FROM orderDetails
-- GROUP BY orderNumber
-- HAVING SUM(quantityOrdered * priceEach) > 60000

SELECT orderNumber
FROM orderDetails
GROUP BY orderNumber
HAVING SUM(quantityOrdered * priceEach) > 60000;

########################################################################################################################################################################

-- 12.SELECT orderNumber,customerNumber,status,shippedDate
-- FROM orders
-- WHERE orderNumber IN (
-- SELECT orderNumber
-- FROM orderDetails
-- GROUP BY orderNumber
-- HAVING SUM(quantityOrdered * priceEach) > 60000)

SELECT orderNumber,customerNumber,status,shippedDate
FROM orders
WHERE orderNumber IN (
SELECT orderNumber
FROM orderDetails
GROUP BY orderNumber
HAVING SUM(quantityOrdered * priceEach) > 60000);

########################################################################################################################################################################

-- 13. SELECT employeeNumber, lastName, firstName
-- FROM employees
-- WHERE firstName LIKE 'a%'

SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'a%';

########################################################################################################################################################################

-- 14. SELECT employeeNumber, lastName, firstName
-- FROM employees
-- WHERE lastName LIKE '%on'

SELECT employeeNumber, lastName, firstName
FROM employees
WHERE lastName LIKE '%on';

########################################################################################################################################################################

-- 15. SELECT employeeNumber, lastName, firstName
-- FROM employees
-- WHERE lastName NOT LIKE 'B%'

SELECT employeeNumber, lastName, firstName
FROM employees
WHERE lastName NOT LIKE 'B%';

########################################################################################################################################################################

-- 16. SELECT customerNumber id, contactLastname name
-- FROM customers
-- UNION
-- SELECT employeeNumber id,firstname name
-- FROM employees

SELECT customerNumber id, contactLastname name
FROM customers
UNION
SELECT employeeNumber id,firstname name
FROM employees;

########################################################################################################################################################################

-- 17. (SELECT customerNumber id,contactLastname name
-- FROM customers)
-- UNION
-- (SELECT employeeNumber id,firstname name
-- FROM employees)
-- ORDER BY name,id

(SELECT customerNumber id,contactLastname name
FROM customers)
UNION
(SELECT employeeNumber id,firstname name
FROM employees)
ORDER BY name,id;

########################################################################################################################################################################

-- 18. (SELECT customerNumber, contactLastname
-- FROM customers)
-- UNION
-- (SELECT employeeNumber, firstname
-- FROM employees)
-- ORDER BY contactLastname, customerNumber

(SELECT customerNumber, contactLastname
FROM customers)
UNION
(SELECT employeeNumber, firstname
FROM employees)
ORDER BY contactLastname, customerNumber;

########################################################################################################################################################################




