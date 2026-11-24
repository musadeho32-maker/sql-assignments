-- Database Indexing and Optimization Assignment
-- MySQL
-- Replace the two password placeholders with the exact passwords supplied
-- in the assignment before running these statements.

-- Question 1: Drop the IdxPhone index from the customers table.
DROP INDEX IdxPhone ON customers;

-- Question 2: Create bob as a local-only MySQL user.
CREATE USER 'bob'@'localhost'
IDENTIFIED BY '<ASSIGNMENT_PASSWORD_1>';

-- Question 3: Grant INSERT permission on all tables in salesDB.
GRANT INSERT ON salesDB.* TO 'bob'@'localhost';

-- Question 4: Change bob's password.
ALTER USER 'bob'@'localhost'
IDENTIFIED BY '<ASSIGNMENT_PASSWORD_2>';
