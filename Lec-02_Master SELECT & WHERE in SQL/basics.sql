CREATE DATABASE company_db;
USE company_db;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50),
    budget INT
);

-- 20 sample values insert
INSERT INTO department (dept_id, dept_name, location, budget) VALUES
(1, 'HR', 'Dhaka', 50000),
(2, 'Finance', 'Chittagong', 120000),
(3, 'IT', 'Dhaka', 200000),
(4, 'Marketing', 'Sylhet', 80000),
(5, 'Sales', 'Rajshahi', 100000),
(6, 'Logistics', 'Khulna', 70000),
(7, 'Procurement', 'Dhaka', 60000),
(8, 'Legal', 'Barisal', 90000),
(9, 'Admin', 'Dhaka', 40000),
(10, 'Research', 'Comilla', 150000),
(11, 'Support', 'Dhaka', 30000),
(12, 'Security', 'Chittagong', 45000),
(13, 'Training', 'Dhaka', 55000),
(14, 'Operations', 'Sylhet', 110000),
(15, 'Customer Care', 'Dhaka', 65000),
(16, 'Production', 'Gazipur', 180000),
(17, 'Quality Control', 'Dhaka', 95000),
(18, 'Design', 'Narayanganj', 85000),
(19, 'Public Relations', 'Dhaka', 75000),
(20, 'Innovation', 'Dhaka', 160000);


SELECT * FROM department;

SELECT dept_id,dept_name FROM department;

SELECT dept_id as ID,dept_name,budget FROM department;

SELECT * FROM department
WHERE location != "Dhaka";

SELECT * FROM department
WHERE budget >= 160000;


SELECT * FROM department
WHERE dept_id in(1,5,7,10);

SELECT * FROM department
WHERE location NOT IN('Dhaka', 'Sylhet');

SELECT * FROM department
WHERE dept_name LIKE 'D%';           --D% means start Check

SELECT * FROM department
WHERE dept_name LIKE '%s';           --%s means end check



------------------------------------------------------
-- Comparison Operators (line by line with examples)
------------------------------------------------------

-- =  → Equal to
SELECT * FROM department WHERE location = 'Dhaka';

-- <> or !=  → Not equal to
SELECT * FROM department WHERE location <> 'Chittagong';

-- >  → Greater than
SELECT * FROM department WHERE budget > 100000;

-- <  → Less than
SELECT * FROM department WHERE budget < 60000;

-- >=  → Greater than or equal
SELECT * FROM department WHERE budget >= 150000;

-- <=  → Less than or equal
SELECT * FROM department WHERE budget <= 50000;

-- BETWEEN ... AND  → Range
SELECT * FROM department WHERE budget BETWEEN 70000 AND 120000;

-- IN  → Matches any value in list
SELECT * FROM department WHERE location IN ('Dhaka', 'Sylhet');

-- NOT IN  → Excludes values in list
SELECT * FROM department WHERE location NOT IN ('Barisal', 'Khulna');

-- LIKE  → Pattern matching
SELECT * FROM department WHERE dept_name LIKE 'M%';

-- NOT LIKE  → Does not match pattern
SELECT * FROM department WHERE dept_name NOT LIKE 'C%';

------------------------------------------------------
-- Logical & Null Operators (line by line with examples)
------------------------------------------------------

-- AND  → দুইটা condition একসাথে true হতে হবে
SELECT * FROM department WHERE location='Dhaka' AND budget>100000;

-- OR  → যেকোনো একটা condition true হলেই হবে
SELECT * FROM department WHERE location='Sylhet' OR budget<60000;

-- NOT  → condition কে negate করে
SELECT * FROM department WHERE NOT location='Dhaka';

-- IS NULL  → NULL value check করে
SELECT * FROM department WHERE budget IS NULL;

-- IS NOT NULL  → NOT NULL value check করে
SELECT * FROM department WHERE budget IS NOT NULL;

UPDATE department
SET budget = NULL
WHERE dept_id in(4,5);


-- Shorting

-- Ascending order (default)
SELECT dept_id, dept_name, budget
FROM department
ORDER BY budget ASC;

-- Descending order
SELECT dept_id, dept_name, budget
FROM department
ORDER BY budget DESC;

-- Sort by location alphabetically
SELECT dept_id, dept_name, location
FROM department
ORDER BY location ASC;

-- Sort by multiple columns (first location, then budget)
SELECT dept_id, dept_name, location, budget
FROM department
ORDER BY location ASC, budget DESC;



------------------------------------------------------
-- Limiting Results
------------------------------------------------------

-- প্রথম 5টা department দেখাবে
SELECT dept_id, dept_name, budget
FROM department
LIMIT 5;

------------------------------------------------------
-- OFFSET
------------------------------------------------------

-- প্রথম 5টা বাদ দিয়ে পরের 5টা দেখাবে
SELECT dept_id, dept_name, budget
FROM department
LIMIT 5,5;

------------------------------------------------------
-- COUNT
------------------------------------------------------

-- মোট কতগুলো department আছে
SELECT COUNT(*) AS total_departments
FROM department;

-- Dhaka location এ কতগুলো department আছে
SELECT COUNT(*) AS dhaka_departments
FROM department
WHERE location = 'Dhaka';

------------------------------------------------------
-- Limit with Sorting
------------------------------------------------------

-- সবচেয়ে বড় 3টা budget
SELECT dept_name, budget
FROM department
ORDER BY budget DESC
LIMIT 3;

-- সবচেয়ে ছোট 3টা budget
SELECT dept_name, budget
FROM department
ORDER BY budget ASC
LIMIT 3;

-- Dhaka location এর মধ্যে সবচেয়ে বড় 2টা budget
SELECT dept_name, budget
FROM department
WHERE location = 'Dhaka'
ORDER BY budget DESC
LIMIT 2;

-- Multiple column sort + limit
SELECT dept_id, dept_name, location, budget
FROM department
ORDER BY location ASC, budget DESC
LIMIT 5;
