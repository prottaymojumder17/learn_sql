/*
LIMIT + OFFSET

প্রথম 3টা department বাদ দিয়ে পরের 7টা department এর নাম আর location দেখাও।

COUNT + Condition

যেসব department এর budget ১ লাখ টাকার বেশি, তাদের সংখ্যা বের করো।

Sorting + LIMIT

সবচেয়ে বড় budget এর department বের করো (শুধু ১টা row)।

Sorting + OFFSET

budget descending order এ সাজিয়ে দ্বিতীয় সবচেয়ে বড় budget এর department বের করো।

Multiple Column Sort

location অনুযায়ী ascending আর dept_name অনুযায়ী descending sort করে প্রথম 8টা department দেখাও।

LIMIT + DISTINCT

সব unique location বের করো, alphabetically সাজিয়ে শুধু প্রথম 4টা দেখাও।

COUNT + GROUP BY

প্রতিটি location এ কতগুলো department আছে সেটা count করো।

LIMIT + WHERE

শুধু Dhaka location এর মধ্যে সবচেয়ে ছোট 2টা budget এর department বের করো।

OFFSET + LIMIT + Sorting

budget ascending order এ সাজিয়ে প্রথম 5টা বাদ দিয়ে পরের 5টা department দেখাও।

Top N Analysis

সবচেয়ে বড় 3টা budget এর average বের করো।
*/

use company_db;

SELECT dept_name
from department
limit 7 offset 3;

SELECT COUNT(*) AS dept_count
FROM department
WHERE budget > 100000;

SELECT dept_name, budget
FROM department
WHERE budget = (SELECT MAX(budget) FROM department);

SELECT dept_name, budget
FROM department
ORDER BY budget DESC
LIMIT 1 OFFSET 1;

-- location অনুযায়ী ascending আর dept_name অনুযায়ী descending sort করে প্রথম 8টা department দেখাও।

SELECT dept_name, location
FROM department
ORDER BY location ASC, dept_name DESC
LIMIT 8;
