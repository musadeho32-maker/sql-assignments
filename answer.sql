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
