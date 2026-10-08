-- ============================================================
-- HAVING IN MYSQL
--
-- HAVING সাধারণত GROUP BY-এর পরে ব্যবহার হয়।
--
-- WHERE → Row filter
-- HAVING → Group filter
-- ============================================================
-- ============================================================
-- 1. যেসব Department-এ 3 জনের বেশি Employee আছে
-- ============================================================
SELECT department_id,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 3;
-- ============================================================
-- 2. যেসব Department-এ 2 জনের বেশি Employee আছে
-- ============================================================
SELECT department_id,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 2;
-- ============================================================
-- 3. Average Salary 50000-এর বেশি এমন Department
-- ============================================================
SELECT department_id,
    ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 50000;
-- ============================================================
-- 4. Total Salary 150000-এর বেশি এমন Department
-- ============================================================
SELECT department_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 150000;
-- ============================================================
-- 5. Maximum Salary 60000-এর বেশি এমন Department
-- ============================================================
SELECT department_id,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 60000;
-- ============================================================
-- 6. JOIN + HAVING
-- Department Name সহ দেখানো
-- ============================================================
SELECT d.dept_name,
    COUNT(e.employee_id) AS total_employees
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.employee_id) > 2;
-- ============================================================
-- 7. Department Average Salary > 50000
-- ============================================================
SELECT d.dept_name,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 50000;
-- ============================================================
-- 8. Department Total Salary > 150000
-- ============================================================
SELECT d.dept_name,
    SUM(e.salary) AS total_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name
HAVING SUM(e.salary) > 150000;
-- ============================================================
-- 9. HAVING + ORDER BY
-- Average salary 50000-এর বেশি
-- তারপর highest average salary আগে
-- ============================================================
SELECT d.dept_name,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 50000
ORDER BY average_salary DESC;
-- ============================================================
-- 10. WHERE + GROUP BY + HAVING
--
-- প্রথমে salary > 50000 employee নেবে
-- তারপর department অনুযায়ী group করবে
-- তারপর যেসব group-এ 2+ employee আছে সেগুলো দেখাবে
-- ============================================================
SELECT d.dept_name,
    COUNT(e.employee_id) AS total_employees,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
WHERE e.salary > 50000
GROUP BY d.dept_name
HAVING COUNT(e.employee_id) >= 2;
-- ============================================================
-- 11. WHERE + GROUP BY + HAVING + ORDER BY
-- Complete Query
-- ============================================================
SELECT d.dept_name,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
WHERE e.salary >= 50000
GROUP BY d.dept_name
HAVING AVG(e.salary) > 55000
ORDER BY average_salary DESC;
-- ============================================================
-- 12. Multiple HAVING Conditions
-- ============================================================
SELECT d.dept_name,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.employee_id) >= 2
    AND AVG(e.salary) > 50000
ORDER BY average_salary DESC;
-- ============================================================
-- 13. Advanced HAVING
--
-- Total salary > 150000
-- এবং employee count >= 3
-- ============================================================
SELECT d.dept_name,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.employee_id) >= 3
    AND SUM(e.salary) > 150000
ORDER BY total_salary DESC;
