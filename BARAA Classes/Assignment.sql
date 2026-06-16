-- Problem 1
CREATE DATABASE ECommerceDB;

USE ECommerceDB;
GO

-- Problem 2 
CREATE TABLE Products(
	ProductID INT IDENTITY(1,1),
	ProductName VARCHAR(100) NOT NULL,
	Category VARCHAR(50) DEFAULT 'GENERAL',
	Price DECIMAL(10,2),
	StockQuantity INT NOT NULL,
	CONSTRAINT PK_Products_ProductID PRIMARY KEY(ProductID),
	CONSTRAINT CK_Products_Price CHECK( Price > 0)
);


-- Problem 3 
CREATE TABLE Orders(
	OrderID INT NOT NULL,
	OrderDate DATE,
	TotalAmount DECIMAL(10,2),
	ProductID INT,
	CONSTRAINT PK_Orders_OrderID PRIMARY KEY(OrderID),
	CONSTRAINT FK_Orders_Products FOREIGN KEY(ProductID)
	REFERENCES Products(ProductID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
)

ALTER TABLE Orders
ALTER COLUMN OrderId INT NOT NULL;

ALTER TABLE Orders
ADD CONSTRAINT Pk_Orders_OrderID PRIMARY KEY(OrderID);

ALTER TABLE Orders
ALTER COLUMN TotalAmount DECIMAL(10,2) NOT NULL;

-- Problem 4
ALTER TABLE Orders
ADD DiscountApplied DECIMAL(4,2)

-- To display description of a Orders
EXEC sp_help 'Orders';


-- Phase 2
-- Inserting values


