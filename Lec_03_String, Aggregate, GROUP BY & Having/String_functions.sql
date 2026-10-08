-- ============================================================
-- STRING FUNCTIONS IN MYSQL
-- Database Tables:
--     department
--     employees
--
-- Main String Functions:
-- UPPER()
-- LOWER()
-- LENGTH()
-- CHAR_LENGTH()
-- CONCAT()
-- CONCAT_WS()
-- LEFT()
-- RIGHT()
-- SUBSTRING()
-- TRIM()
-- LTRIM()
-- RTRIM()
-- REPLACE()
-- REVERSE()
-- LOCATE()
-- LPAD()
-- RPAD()
-- ============================================================
-- ============================================================
-- 1. UPPER()
-- কাজ: সব অক্ষর Uppercase করে
-- ============================================================
SELECT first_name,
    UPPER(first_name) AS uppercase_name
FROM employees;
-- ============================================================
-- 2. LOWER()
-- কাজ: সব অক্ষর Lowercase করে
-- ============================================================
SELECT first_name,
    LOWER(first_name) AS lowercase_name
FROM employees;
-- ============================================================
-- 3. LENGTH()
-- কাজ: String-এর length/byte length বের করে
-- ============================================================
SELECT first_name,
    LENGTH(first_name) AS name_length
FROM employees;
-- ============================================================
-- 4. CHAR_LENGTH()
-- কাজ: String-এ মোট কতটি character আছে তা বের করে
-- ============================================================
SELECT first_name,
    CHAR_LENGTH(first_name) AS character_count
FROM employees;
-- ============================================================
-- 5. CONCAT()
-- কাজ: একাধিক String একসাথে যুক্ত করে
-- ============================================================
SELECT CONCAT(
        first_name,
        ' - Employee'
    ) AS employee_label
FROM employees;
-- ============================================================
-- 6. CONCAT() + JOIN
-- Employee Name + Department Name একসাথে দেখানো
-- ============================================================
SELECT CONCAT(
        e.first_name,
        ' works in ',
        d.dept_name
    ) AS employee_information
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id;
-- ============================================================
-- 7. CONCAT_WS()
-- কাজ: Separator ব্যবহার করে একাধিক String যুক্ত করে
-- WS = With Separator
-- ============================================================
SELECT CONCAT_WS(
        ' | ',
        e.first_name,
        d.dept_name,
        d.location
    ) AS employee_information
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id;
-- ============================================================
-- 8. LEFT()
-- কাজ: String-এর বাম দিক থেকে নির্দিষ্ট character নেয়
-- ============================================================
SELECT first_name,
    LEFT(first_name, 3) AS first_three_characters
FROM employees;
-- ============================================================
-- 9. RIGHT()
-- কাজ: String-এর ডান দিক থেকে নির্দিষ্ট character নেয়
-- ============================================================
SELECT first_name,
    RIGHT(first_name, 2) AS last_two_characters
FROM employees;
-- ============================================================
-- 10. SUBSTRING()
-- কাজ: String-এর নির্দিষ্ট অংশ বের করে
--
-- Syntax:
-- SUBSTRING(string, start_position, length)
-- ============================================================
SELECT first_name,
    SUBSTRING(first_name, 1, 3) AS short_name
FROM employees;
-- ============================================================
-- 11. TRIM()
-- কাজ: String-এর দুই পাশের অতিরিক্ত space remove করে
-- ============================================================
SELECT TRIM('   Hello MySQL   ') AS cleaned_text;
-- ============================================================
-- 12. LTRIM()
-- কাজ: বাম পাশের অতিরিক্ত space remove করে
-- ============================================================
SELECT LTRIM('   Hello MySQL') AS left_trimmed;
-- ============================================================
-- 13. RTRIM()
-- কাজ: ডান পাশের অতিরিক্ত space remove করে
-- ============================================================
SELECT RTRIM('Hello MySQL   ') AS right_trimmed;
-- ============================================================
-- 14. REPLACE()
-- কাজ: একটি String-এর অংশ অন্য String দিয়ে replace করে
-- ============================================================
SELECT dept_name,
    location,
    REPLACE(
        location,
        'Dhaka',
        'DHAKA CITY'
    ) AS modified_location
FROM department;
-- ============================================================
-- 15. REVERSE()
-- কাজ: String উল্টে দেয়
-- ============================================================
SELECT first_name,
    REVERSE(first_name) AS reversed_name
FROM employees;
-- ============================================================
-- 16. LOCATE()
-- কাজ: String-এর মধ্যে কোনো character/text-এর position বের করে
-- ============================================================
SELECT first_name,
    LOCATE('a', first_name) AS position_of_a
FROM employees;
-- ============================================================
-- 17. LPAD()
-- কাজ: String-এর বাম পাশে নির্দিষ্ট character যোগ করে
-- ============================================================
SELECT employee_id,
    LPAD(employee_id, 5, '0') AS formatted_employee_id
FROM employees;
-- ============================================================
-- 18. RPAD()
-- কাজ: String-এর ডান পাশে নির্দিষ্ট character যোগ করে
-- ============================================================
SELECT first_name,
    RPAD(first_name, 12, '.') AS formatted_name
FROM employees;
-- ============================================================
-- 19. UPPER() + CONCAT()
-- Employee-এর সুন্দর একটি label তৈরি
-- ============================================================
SELECT UPPER(
        CONCAT(
            e.first_name,
            ' - ',
            d.dept_name
        )
    ) AS employee_label
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id;
-- ============================================================
-- 20. Multiple String Functions একসাথে
-- ============================================================
SELECT first_name,
    UPPER(first_name) AS uppercase_name,
    LOWER(first_name) AS lowercase_name,
    LENGTH(first_name) AS name_length,
    LEFT(first_name, 2) AS first_two,
    RIGHT(first_name, 2) AS last_two
FROM employees;
-- ============================================================
-- 21. PRACTICAL EXAMPLE
-- Employee information সুন্দরভাবে তৈরি
-- ============================================================
SELECT CONCAT(
        'Employee: ',
        e.first_name,
        ' | Department: ',
        d.dept_name,
        ' | Location: ',
        d.location
    ) AS employee_information
FROM employees AS e
    JOIN department AS d ON e.department_id = d.dept_id;
