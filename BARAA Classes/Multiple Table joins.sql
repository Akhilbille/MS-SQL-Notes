-->> Task

SELECT 
	so.OrderID AS 'Order ID',
	sc.FirstName AS "Customer's Name",
	sp.Product AS 'Product Name',
	so.Sales AS 'Sales Amount',
	sp.Price AS 'Product Price',
	se.FirstName AS 'Sales Person Name'
FROM Sales.Orders so
Inner JOIN sales.Customers sc
ON so.CustomerID = sc.CustomerID
Inner JOIN sales.Products sp
ON so.ProductID = sp.ProductID
INNER JOIN sales.Employees se
ON so.SalesPersonID = se.EmployeeID





