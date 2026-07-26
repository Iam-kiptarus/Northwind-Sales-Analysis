/*
=========================================
Northwind Sales Analysis
Schema Creation
=========================================
*/
CREATE TABLE customers (
    customerid INT PRIMARY KEY,
    customername VARCHAR(40),
    contactname VARCHAR(25),
    address VARCHAR(50),
    city VARCHAR(20),
    postalcode VARCHAR(10),
    country VARCHAR(15)
);

CREATE TABLE categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(20),
    Description VARCHAR(60)
);

CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(15),
    FirstName VARCHAR(15),
    Birthdate DATE,
    Photo VARCHAR(15),
    Notes VARCHAR(500)
);

CREATE TABLE orderdetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT
);

CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    ShipperID INT
);

CREATE TABLE products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(45),
    SupplierID INT,
    CategoryID INT,
    Unit VARCHAR(25),
    Price INT
);

CREATE TABLE shippers (
    ShipperID INT PRIMARY KEY,
    ShipperName VARCHAR(20),
    Phone VARCHAR(15)
);

CREATE TABLE suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50),
    ContactName VARCHAR(30),
    Address VARCHAR(50),
    City VARCHAR(15),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(20)
);