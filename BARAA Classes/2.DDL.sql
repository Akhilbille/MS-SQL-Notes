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







)

