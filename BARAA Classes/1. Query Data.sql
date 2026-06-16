-- Select database
USE MyDatabase;


-- Retrieve each customer's name, country and score
-- Score not equals to 0
-- Order By ASC, DESC
SELECT 
	first_name,
	score,
	country
FROM dbo.customers
ORDER BY country ASC, score DESC;


--> Group By
-- Total score for each country	
	SELECT 
		country, 
		SUM(score) AS total_score 
	FROM customers 
	GROUP BY country;
--Total score for each country	and total number of customers in each country
	SELECT 
		country,
		SUM(score) AS total_score,
		Count(id) AS total_customeres
	FROM dbo.customers
	GROUP BY country;

-- Having 
-- Find the average score for each country considering only customers with a ascore not equal to 0. And return only those countries with an average score greater than 430
	SELECT 
		country,
		AVG(score) AS average_score
	FROM dbo.customers
	WHERE score ! = 0
	GROUP BY country
	HAVING AVG(score) > 430;

--> Distinct
	-- Return Unique list of all countries
	SELECT DISTINCT
		TOP(4) country 
	FROM dbo.customers
	ORDER BY country DESC;

--> Top 
	-- Retrieve only 3 customers
	SELECT 
		TOP 3
		* 
	FROM dbo.customers;

	-- Retrieve the Top 3 customers with highest scores
	SELECT TOP 3 *
	FROM dbo.customers
	ORDER BY score DESC;

	-- Retrieve the Lowest 2 customers with lowest score
	SELECT TOP 2 *
	FROM dbo.customers
	ORDER BY score;

	-- Get the two most recent orders
	SELECT TOP 2 * 
	FROM dbo.orders
	ORDER BY order_date DESC;

	use SalesDB

	select * from sys.tables;

	select 
		
		SUM(sales)  'Total sales'
	from sales.orders;


	select 
		OrderID,
		OrderDate,
		ProductID,
		Sum(Sales) OVER(PARTITION BY ProductID) SalesPerPeroduct
	FROM sales.orders
