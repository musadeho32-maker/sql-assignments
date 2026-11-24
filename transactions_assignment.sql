-- SQL Transactions Assignment
-- Database: sales (or another selected database)
-- Questions 1-3: Create student table, insert records, and update a student's age.

-- Question 1: Create the student table
CREATE TABLE IF NOT EXISTS student (
    id INT PRIMARY KEY,
    fullName VARCHAR(100),
    age INT
);

-- Question 2: Insert at least three records
START TRANSACTION;

INSERT INTO student (id, fullName, age)
VALUES
    (1, 'Musa Deho', 24),
    (2, 'John Peter', 19),
    (3, 'Mary James', 22);

-- Question 3: Update the age of the student with ID 2 to 20
UPDATE student
SET age = 20
WHERE id = 2;

-- Save the INSERT and UPDATE changes
COMMIT;

-- Verify the final records
SELECT * FROM student
ORDER BY id;
