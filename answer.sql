-- Week 2 SQL Assignment
-- Database: sales

USE sales;

-- Question 1: Retrieve payment information
SELECT checkNumber, paymentDate, amount
FROM payments;

-- Question 2: Find orders in process, newest first
SELECT orderDate, requiredDate, status
FROM orders
WHERE status = 'In Process'
ORDER BY orderDate DESC;

-- Question 3: Find sales representatives, highest employee number first
SELECT firstName, lastName, email
FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY employeeNumber DESC;

-- Question 4: Retrieve all office information
SELECT *
FROM offices;

-- Question 5: Retrieve the five cheapest products
SELECT productName, quantityInStock
FROM products
ORDER BY buyPrice ASC
LIMIT 5;


-- =========================================================
-- Week 6 Assignment: SQL Joins and Relationships
-- Database: classicmodels
-- =========================================================

USE classicmodels;

-- Question 1: INNER JOIN employees with offices
SELECT
    e.firstName,
    e.lastName,
    e.email,
    e.officeCode
FROM employees AS e
INNER JOIN offices AS o
    ON e.officeCode = o.officeCode;

-- Question 2: LEFT JOIN products with product lines
SELECT
    p.productName,
    p.productVendor,
    p.productLine
FROM products AS p
LEFT JOIN productlines AS pl
    ON p.productLine = pl.productLine;

-- Question 3: RIGHT JOIN customers with orders; retrieve the first 10 orders
SELECT
    o.orderDate,
    o.shippedDate,
    o.status,
    o.customerNumber
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customerNumber = o.customerNumber
LIMIT 10;
