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


-- =========================================================
-- Database Design and Normalization Assignment
-- A separate database avoids conflicts with Classic Models'
-- existing Orders table.
-- =========================================================

CREATE DATABASE IF NOT EXISTS normalization_assignment;
USE normalization_assignment;

-- Question 1: Achieving First Normal Form (1NF)
-- Each row stores exactly one product for an order.
-- The composite primary key prevents duplicate products per order.
CREATE TABLE ProductDetail_1NF (
    OrderID INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    Product VARCHAR(100) NOT NULL,
    PRIMARY KEY (OrderID, Product)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- View the 1NF records
SELECT OrderID, CustomerName, Product
FROM ProductDetail_1NF
ORDER BY OrderID, Product;


-- Question 2: Achieving Second Normal Form (2NF)
-- Partial dependency identified:
-- CustomerName depends on OrderID, not on the full
-- composite key (OrderID, Product).
-- Move CustomerName to Orders; keep Product and Quantity
-- in OrderItems, whose key is (OrderID, Product).

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE OrderItems (
    OrderID INT NOT NULL,
    Product VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, Product),
    CONSTRAINT fk_orderitems_orders
        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert each order once into Orders
INSERT INTO Orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Insert each product and its quantity into OrderItems
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

-- Verify the normalized 2NF data
SELECT
    o.OrderID,
    o.CustomerName,
    oi.Product,
    oi.Quantity
FROM Orders AS o
INNER JOIN OrderItems AS oi
    ON o.OrderID = oi.OrderID
ORDER BY o.OrderID, oi.Product;
