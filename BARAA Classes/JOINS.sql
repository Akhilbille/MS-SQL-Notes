-- No JOIN:  Returns data from tables with out combining them
 /* Retrieve all data from customers and orders in different results*/
SELECT *
FROM customers;

SELECT *
FROM orders;

-- Inner Join : Return only matching rows from both tables
/* Get all customers along with their orders, 
but only for customers who have placed an order*/
SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers c
INNER JOIN orders o
ON c.id = o.customer_id

-- Left Join: Return all rows from left and only matching from right
/* Get all the customers along with the orders,
including those without orders*/ 
SELECT 
	c.id,c.first_name,o.order_id,o.sales
FROM customers c
LEFT JOIN orders o
ON c.id = o.customer_id;

--Right Join: Return all rows from right and only matching from left.
/* Get all customers along with thier orders
including orders without matching customers*/
INSERT INTO orders
VALUES(1005,12,'2020-02-03',45)

select *
FROM orders
SELECT 
	c.id,c.first_name,o.order_id,o.sales
FROM customers c
RIGHT JOIN orders o
ON c.id = o.customer_id;

-- Task
/* Get all the customers along with their orders,
including orders without matching customers*/
SELECT 
	o.order_id,o.sales,c.first_name,c.first_name
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.id;


-- Full Join: Returns all rows from both tables(matched and unmatched data)
/* Get all customers and orders , even  if there's no match */

SELECT *
FROM customers c
FULL JOIN orders o 
ON c.id = o.customer_id


-->> Advanced JOins
-- Left anti JOIN: Returns rows from left that has no match in right
-- Get all customers who haven't placed any order
SELECT *
FROM customers c 
LEFT JOIN orders o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL


--Right anti Join
SELECT *
FROM customers c 
RIGHT JOIN orders o
ON c.id = o.customer_id
WHERE c.id IS NULL 


-- task
SELECT *
FROM orders o 
LEFT JOIN customers c 
ON c.id = o.customer_id
WHERE c.id IS NULL 

-- Full Anti join: Only unmatching rows 
-- FInd customers with out orders and orders with out customers
SELECT *
FROm customers c
FULL JOIN orders o
on c.id = o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL

-- Task
-- Get all customers along with their orders but only for customers who have placed an order
--WIth out using inner join
SELECT *
FROM customers c
FULL JOIN orders o
ON c.id = o.customer_id
WHERE c.id IS NOT NULL AND o.customer_id IS NOT NULL


-- cross join: Every row from the left with every from right- All possible combinations - Cartersian Join 
 
-- Generate all possible combinations of customers and orders
SELECT *
FROM customers 
CROSS JOIN orders

