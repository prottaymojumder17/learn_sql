-- ============================================================
-- NUMERIC FUNCTIONS IN MYSQL
--
-- Main Functions:
-- ABS()
-- ROUND()
-- CEIL()
-- FLOOR()
-- MOD()
-- POWER()
-- SQRT()
--
-- এছাড়াও:
-- +  Addition
-- -  Subtraction
-- *  Multiplication
-- /  Division
-- ============================================================
-- ============================================================
-- 1. ADDITION
-- Salary-এর সাথে 5000 যোগ
-- ============================================================
SELECT first_name,
    salary,
    salary + 5000 AS increased_salary
FROM employees;
-- ============================================================
-- 2. SUBTRACTION
-- Salary থেকে 5000 কম
-- ============================================================
SELECT first_name,
    salary,
    salary - 5000 AS reduced_salary
FROM employees;
-- ============================================================
-- 3. MULTIPLICATION
-- Salary × 12
-- ============================================================
SELECT first_name,
    salary,
    salary * 12 AS yearly_salary
FROM employees;
-- ============================================================
-- 4. DIVISION
-- ============================================================
SELECT first_name,
    salary,
    salary / 12 AS divided_salary
FROM employees;
-- ============================================================
-- 5. ABS()
-- কাজ: Negative number-কে positive absolute value করে
-- ============================================================
SELECT ABS(-5000) AS absolute_value;
-- ============================================================
-- 6. ABS() with salary calculation
-- ============================================================
SELECT first_name,
    salary,
    ABS(salary - 60000) AS salary_difference
FROM employees;
-- ============================================================
-- 7. ROUND()
-- কাজ: Decimal number round করে
-- ============================================================
SELECT ROUND(12345.6789, 2) AS rounded_number;
-- ============================================================
-- 8. ROUND() with salary
-- ============================================================
SELECT first_name,
    salary,
    ROUND(salary / 12, 2) AS calculated_salary
FROM employees;
-- ============================================================
-- 9. CEIL()
-- কাজ: পরের পূর্ণসংখ্যায় নিয়ে যায়
-- ============================================================
SELECT CEIL(10.25) AS ceiling_value;
-- ============================================================
-- 10. CEIL() with salary
-- ============================================================
SELECT first_name,
    salary,
    CEIL(salary / 1000) AS rounded_up_salary
FROM employees;
-- ============================================================
-- 11. FLOOR()
-- কাজ: আগের পূর্ণসংখ্যায় নিয়ে যায়
-- ============================================================
SELECT FLOOR(10.99) AS floor_value;
-- ============================================================
-- 12. FLOOR() with salary
-- ============================================================
SELECT first_name,
    salary,
    FLOOR(salary / 1000) AS rounded_down_salary
FROM employees;
-- ============================================================
-- 13. MOD()
-- কাজ: Division-এর remainder বের করে
-- ============================================================
SELECT MOD(10, 3) AS remainder;
-- ============================================================
-- 14. MOD() with employee_id
-- Even / Odd check
-- ============================================================
SELECT employee_id,
    first_name,
    MOD(employee_id, 2) AS remainder
FROM employees;
-- ============================================================
-- 15. MOD() + CASE
-- Employee ID Even নাকি Odd
-- ============================================================
SELECT employee_id,
    first_name,
    CASE
        WHEN MOD(employee_id, 2) = 0 THEN 'Even ID'
        ELSE 'Odd ID'
    END AS id_type
FROM employees;
-- ============================================================
-- 16. POWER()
-- কাজ: একটি number-এর power বের করে
-- ============================================================
SELECT POWER(2, 3) AS power_result;
-- ============================================================
-- 17. SQRT()
-- কাজ: Square Root বের করে
-- ============================================================
SELECT SQRT(144) AS square_root;
-- ============================================================
-- 18. Salary 10% increase
-- ============================================================
SELECT first_name,
    salary,
    salary * 1.10 AS increased_salary
FROM employees;
-- ============================================================
-- 19. Salary 10% increase + ROUND()
-- ============================================================
SELECT first_name,
    salary,
    ROUND(salary * 1.10, 2) AS increased_salary
FROM employees;
-- ============================================================
-- 20. Department Budget-এর সাথে calculation
-- ============================================================
SELECT dept_name,
    budget,
    budget * 12 AS yearly_budget
FROM department;
-- ============================================================
-- 21. Budget-এর 10% বের করা
-- ============================================================
SELECT dept_name,
    budget,
    ROUND(budget * 0.10, 2) AS ten_percent_budget
FROM department;
-- ============================================================
-- 22. PRACTICAL EXAMPLE
-- Department budget-এর 80% কত?
-- ============================================================
SELECT dept_name,
    budget,
    ROUND(budget * 0.80, 2) AS eighty_percent_budget
FROM department;
