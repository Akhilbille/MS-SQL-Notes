-- 

use MyDatabase;
-->> AND OR NOT
-- Retrieve all customers with a score of 500 or less from MyDatabase
SELECT *
FROM customers
WHERE score <= 500;

-- AND, OR, NOT for multiple conditions
-- Retrieve all customers who are from the USA and hava a score greater than 500
SELECT *
FROM customers
WHERE country = 'USA' AND score > 500;


--Retrieve all the customers who are either from the USA or hava a score greater than 500
SELECT * 
FROM customers
WHERE country = 'USA' OR score > 500;

-- Retrieve all customers with a score not less than 500
SELECT *
FROM customers 
WHERE NOT score < 500;


-->> Between
--Customers with score in a range 500 to 600
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;

-- Same query as above but with out using BETWEEN
SELECT *
FROM customers
WHERE score >= 100 AND score <=500;

-->> IN and NOT IN
-- Retrieve all customers from either Germany or USA
SELECT *
FROM customers
WHERE country IN ('Germany','USA');

SELECT *
FROM customers
WHERE country NOT IN ('Germany','USA');

-->> LIKE : Search for a pattern
-- Find all customers whose first name starts with 'M'
SELECT *
FROM customers
WHERE first_name LIKE 'M%'


