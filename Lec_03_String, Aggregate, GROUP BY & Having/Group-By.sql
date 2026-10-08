-- ============================================================
-- GROUP BY IN MYSQL
--
-- GROUP BY-এর কাজ:
-- একই ধরনের value-গুলোকে group করা।
--
-- সাধারণত Aggregate Function-এর সাথে ব্যবহার হয়:
-- COUNT()
-- SUM()
-- AVG()
-- MIN()
-- MAX()
-- ============================================================
-- ============================================================
-- 1. Department ID অনুযায়ী Employee Count
-- ============================================================
SELECT department_id,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department_id;
-- ============================================================
-- 2. Department ID অনুযায়ী Total Salary
-- ============================================================
SELECT department_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;
-- ============================================================
-- 3. Department ID অনুযায়ী Average Salary
-- ============================================================
SELECT department_id,
    ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department_id;
-- ============================================================
-- 4. Department ID অনুযায়ী Minimum Salary
-- ============================================================
SELECT department_id,
    MIN(salary) AS minimum_salary
FROM employees
GROUP BY department_id;
-- ============================================================
-- 5. Department ID অনুযায়ী Maximum Salary
-- ============================================================
SELECT department_id,
    MAX(salary) AS maximum_salary
FROM employees
GROUP BY department_id;
-- ============================================================
-- 6. Department ID অনুযায়ী সব Aggregate
-- ============================================================
SELECT department_id,
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    ROUND(AVG(salary), 2) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM employees
GROUP BY department_id;
-- ============================================================
-- 7. JOIN করে Department Name দেখানো
-- ============================================================
SELECT d.dept_name,
    COUNT(e.employee_id) AS total_employees
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name;
-- ============================================================
-- 8. Department Name অনুযায়ী Total Salary
-- ============================================================
SELECT d.dept_name,
    SUM(e.salary) AS total_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name;
-- ============================================================
-- 9. Department Name অনুযায়ী Average Salary
-- ============================================================
SELECT d.dept_name,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name;
-- ============================================================
-- 10. Department Name + Location অনুযায়ী Group
-- ============================================================
SELECT d.dept_name,
    d.location,
    COUNT(e.employee_id) AS total_employees
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name,
    d.location;
-- ============================================================
-- 11. Location অনুযায়ী Employee Count
-- ============================================================
SELECT d.location,
    COUNT(e.employee_id) AS total_employees
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.location;
-- ============================================================
-- 12. Location অনুযায়ী Total Salary
-- ============================================================
SELECT d.location,
    SUM(e.salary) AS total_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.location;
-- ============================================================
-- 13. GROUP BY + ORDER BY
-- Highest total salary আগে দেখাবে
-- ============================================================
SELECT d.dept_name,
    SUM(e.salary) AS total_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name
ORDER BY total_salary DESC;
-- ============================================================
-- 14. GROUP BY + ORDER BY
-- Lowest total salary আগে
-- ============================================================
SELECT d.dept_name,
    SUM(e.salary) AS total_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name
ORDER BY total_salary ASC;
-- ============================================================
-- 15. COMPLETE DEPARTMENT REPORT
-- ============================================================
SELECT d.dept_name,
    d.location,
    d.budget,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    ROUND(AVG(e.salary), 2) AS average_salary,
    MIN(e.salary) AS minimum_salary,
    MAX(e.salary) AS maximum_salary
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id
GROUP BY d.dept_name,
    d.location,
    d.budget
ORDER BY total_salary DESC;
