-->>Set
--> union,union all, intersect,except

USE SalesDB;
GO

--union: only unique

SELECT 
	FirstName,
	LastName
FROM sales.Employees
UNION
SELECT 
	FirstName,
	LastName
FROM sales.Customers;