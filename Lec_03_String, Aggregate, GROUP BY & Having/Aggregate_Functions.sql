-- ============================================================
-- AGGREGATE FUNCTIONS IN MYSQL
--
-- COUNT()
-- SUM()
-- AVG()
-- MIN()
-- MAX()
-- ============================================================
-- ============================================================
-- 1. COUNT(*)
-- মোট কতজন employee আছে
-- ============================================================
SELECT COUNT(*) AS total_employees
FROM employees;
-- ============================================================
-- 2. COUNT(employee_id)
-- employee_id কতটি আছে
-- ============================================================
SELECT COUNT(employee_id) AS total_employees
FROM employees;
-- ============================================================
-- 3. COUNT(DISTINCT department_id)
-- কতটি unique department-এ employee আছে
-- ============================================================
SELECT COUNT(DISTINCT department_id) AS departments_with_employees
FROM employees;
-- ============================================================
-- 4. SUM()
-- সব employee-এর salary যোগ
-- ============================================================
SELECT SUM(salary) AS total_salary
FROM employees;
-- ============================================================
-- 5. AVG()
-- Average salary
-- ============================================================
SELECT AVG(salary) AS average_salary
FROM employees;
-- ============================================================
-- 6. AVG() + ROUND()
-- Average salary সুন্দরভাবে দেখানো
-- ============================================================
SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employees;
-- ============================================================
-- 7. MIN()
-- সবচেয়ে কম salary
-- ============================================================
SELECT MIN(salary) AS minimum_salary
FROM employees;
-- ============================================================
-- 8. MAX()
-- সবচেয়ে বেশি salary
-- ============================================================
SELECT MAX(salary) AS maximum_salary
FROM employees;
-- ============================================================
-- 9. সব Aggregate Function একসাথে
-- ============================================================
SELECT COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    ROUND(AVG(salary), 2) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM employees;
-- ============================================================
-- 10. Employee Salary-এর Range
-- MAX - MIN
-- ============================================================
SELECT MAX(salary) - MIN(salary) AS salary_difference
FROM employees;
-- ============================================================
-- 11. Department Table-এর Budget Aggregate
-- ============================================================
SELECT COUNT(*) AS total_departments,
    SUM(budget) AS total_budget,
    ROUND(AVG(budget), 2) AS average_budget,
    MIN(budget) AS minimum_budget,
    MAX(budget) AS maximum_budget
FROM department;
-- ============================================================
-- 12. Employees-এর salary সম্পর্কে complete summary
-- ============================================================
SELECT COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    ROUND(AVG(salary), 2) AS average_salary,
    MIN(salary) AS lowest_salary,
    MAX(salary) AS highest_salary,
    MAX(salary) - MIN(salary) AS salary_range
FROM employees;
