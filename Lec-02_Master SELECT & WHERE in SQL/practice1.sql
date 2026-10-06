-- Practice Questions

-- প্রথম 10টা department এর নাম আর budget দেখাও।
SELECT dept_name, budget
FROM department
LIMIT 10;

-- প্রথম 5টা বাদ দিয়ে পরের 5টা department দেখাও।
SELECT dept_name
FROM department
LIMIT 5 OFFSET 5;

-- মোট কতগুলো department আছে সেটা বের করো।
SELECT COUNT(*) AS total_department
FROM department;

-- Dhaka location এ কতগুলো department আছে সেটা count করো।
SELECT COUNT(*) AS dhaka_department
FROM department
WHERE location = 'Dhaka';

-- সবচেয়ে বড় 5টা budget এর department বের করো।
SELECT dept_name, budget
FROM department
ORDER BY budget DESC
LIMIT 5;

-- সবচেয়ে ছোট 3টা budget এর department বের করো।
SELECT dept_name, budget
FROM department
ORDER BY budget ASC
LIMIT 3;

-- Dhaka location এর মধ্যে সবচেয়ে বড় 2টা budget এর department বের করো।
SELECT dept_name, budget
FROM department
WHERE location = 'Dhaka'
ORDER BY budget DESC
LIMIT 2;

-- location অনুযায়ী ascending আর budget অনুযায়ী descending sort করে প্রথম 6টা department দেখাও।
SELECT dept_id, dept_name, location, budget
FROM department
ORDER BY location ASC, budget DESC
LIMIT 6;

-- সব department কে budget ascending order এ সাজিয়ে শুধু প্রথম 8টা দেখাও।
SELECT dept_name, budget
FROM department
ORDER BY budget ASC
LIMIT 8;

-- সব department কে location অনুযায়ী সাজিয়ে count বের করো (প্রতিটি location এ কত department আছে)।
SELECT location, COUNT(*) AS total_departments
FROM department
GROUP BY location
ORDER BY location ASC;

-- Database select (ensure you are using correct DB)
USE company_db;
