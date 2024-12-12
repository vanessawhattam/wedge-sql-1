-- use table date_hour. write query that returns 1row/3cols, 
-- Names of cols == "Total Spend", "Total Transactions" and "Total Items" 
-- should return the sum of spend, sum of trans, and sum of items

-- 1.1
SELECT sum(spend) as "Total Spend", sum(trans) as "Total Transactions", sum(items) as "Total Items"
FROM date_hour;

-- 1.2
-- use date_hour to return 5rows/2cols
-- first col = date, second col = "Daily Spend"
-- Return the dates and $ spent for the 5 days with highest total spend
SELECT date as "Date", sum(spend) as "Daily Spend"
FROM date_hour
GROUP by date
ORDER by sum(spend) DESC
LIMIT 5;

-- 1.3 
-- Do the same as above but for small spend days
SELECT date as "Date", sum(spend) as "Daily Spend"
FROM date_hour
GROUP by date
ORDER by sum(spend) ASC
LIMIT 5;

-- 1.4 
-- 3 rows, 3 cols "date" "hour" "spend" 
-- Find the 3 dates and hours with biggest spend
SELECT date, hour, sum(spend) as "spend"
FROM date_hour
GROUP by date, hour
ORDER by sum(spend) DESC
LIMIT 5;

--1.5 
-- use table dept_date 
-- return cols department, "Department Spend" which is sum of spend in dept all time
-- sort highest spend to lowest
SELECT department, sum(spend) as "Department Spend"
FROM department_date
GROUP by department
ORDER by sum(spend) DESC;

-- 1.6 
-- use table dept_date filter to only include 2015
-- return cols department, "Department Spend" which is sum of spend in dept all time
-- sort highest spend to lowest
SELECT department, sum(spend) as "Department Spend"
FROM department_date
WHERE strftime("%Y", date) = "2015"
GROUP by department
ORDER by sum(spend) DESC;

-- 1.7
-- Use dept_date, return cols date and spend for 10 highest spend days in Frozen (6)
SELECT date, spend
FROM department_date
WHERE department=6.0
ORDER by spend DESC
LIMIT 10;

-- 1.8
-- Use dept_date, return cols date and spend for 10 highest spend days in Deli (8)
SELECT date, spend
FROM department_date
WHERE department=8.0
ORDER by spend DESC
LIMIT 10;

-- 1.9
-- from owner_spend_date, return spending by month for card_no 18736
-- row for each month, COLUMN called month and COLUMN called spend (which should be total for month)
-- Ascending by month
SELECT strftime("%m", date) as "month", sum(spend) as "spend"
FROM owner_spend_date
WHERE card_no=18736
GROUP by "month"
ORDER by "month" ASC;
 
-- 1.10
-- returns spending by year and month for 18736
-- cols = year, month, spend with total spend for the month/year
-- chronological ORDER
SELECT strftime("%m", date) as "month", strftime("%Y", date) as "year", sum(spend) as "spend"
FROM owner_spend_date
WHERE card_no=18736
GROUP by "year", "month"
ORDER by "year", "month" ASC;




