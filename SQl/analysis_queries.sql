/*
=========================================
Northwind Sales Analysis
Business Analysis Queries
=========================================
*/

-- =====================================
-- Top 10 customers by revenue
-- =====================================
SELECT 
    c.CustomerName,
    SUM(od.quantity * p.price) AS TotalSpending
FROM
    customers c
        JOIN
    orders o ON c.CustomerID = o.CustomerID
        JOIN
    orderdetails od ON o.OrderID = od.OrderID
        JOIN
    products p ON od.ProductID = p.ProductID
GROUP BY 1 
ORDER BY 2 DESC
LIMIT 10;

-- =====================================
-- Products Generating the Highest Revenue
-- =====================================
SELECT
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * p.Price) AS TotalRevenue
FROM Products p
JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductName
ORDER BY
    TotalRevenue DESC;
    
-- =====================================
-- Revenue by Product Category
-- =====================================
SELECT 
    c.CategoryName,
    SUM(od.Quantity * p.Price) AS TotalRevenue,
    ROUND(SUM(od.Quantity * p.Price) * 100 / (SELECT 
                    SUM(od2.Quantity * p2.Price)
                FROM
                    orderdetails od2
                        JOIN
                    products p2 ON od2.ProductID = p2.ProductID),
            2) AS RevenuePercentage
FROM
    categories c
        JOIN
    products p ON c.CategoryID = p.CategoryID
        JOIN
    orderdetails od ON p.ProductID = od.ProductID
GROUP BY 1
ORDER BY 2 DESC;

-- =====================================
-- Supplier Revenue
-- =====================================
SELECT 
    s.SupplierName,
    COUNT(DISTINCT p.ProductID) AS NumberofProducts,
    SUM(od.Quantity * p.Price) AS TotalRevenue
FROM
    suppliers s
        JOIN
    products p ON s.SupplierID = p.SupplierID
        JOIN
    orderdetails od ON p.ProductID = od.ProductID
GROUP BY 1 
ORDER BY TotalRevenue DESC;

-- =====================================
-- Employee Sales Performance
-- =====================================
SELECT 
    concat(e.FirstName, ' ', e.lastname) as Employee,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.Quantity * p.Price) AS TotalRevenue
FROM
    employees e
        JOIN
    orders o ON e.EmployeeID = o.EmployeeID
        JOIN
    orderdetails od ON o.OrderID = od.OrderID
        JOIN
    products p ON od.ProductID = p.ProductID
GROUP BY e.FirstName , e.LastName
ORDER BY TotalRevenue DESC;

-- =====================================
-- Monthly sales trends?
-- =====================================
SELECT 
    DATE_FORMAT(o.OrderDate, '%Y-%m') AS YearMonth,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.Quantity * p.Price) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od 
    ON o.OrderID = od.OrderID
JOIN Products p 
    ON od.ProductID = p.ProductID
GROUP BY DATE_FORMAT(o.OrderDate, '%Y-%m')
ORDER BY YearMonth;

-- =====================================
-- Customers Purchasing the Widest Variety
-- =====================================
SELECT 
    c.CustomerName,
    COUNT(DISTINCT od.ProductID) AS UniqueProductsPurchased
FROM
    customers c
        JOIN
    orders o ON c.customerid = o.CustomerID
        JOIN
    orderdetails od ON o.OrderID = od.OrderID
GROUP BY 1 
ORDER BY 2 DESC;

-- =====================================
-- Suppliers with Products in the Most Categories
-- =====================================
SELECT 
    s.SupplierName,
    COUNT(DISTINCT p.CategoryID) AS NumberofCategories,
    COUNT(p.ProductID) AS NumberofProducts
FROM
    suppliers s
        JOIN
    products p ON s.SupplierID = p.SupplierID
GROUP BY 1
ORDER BY 2 DESC , 3 DESC;


SELECT 
    c.Country,
    COUNT(DISTINCT c.CustomerID) AS TotalCustomers,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.Quantity * p.Price) AS TotalRevenue
FROM
    Customers c
        JOIN
    Orders o ON c.CustomerID = o.CustomerID
        JOIN
    OrderDetails od ON o.OrderID = od.OrderID
        JOIN
    Products p ON od.ProductID = p.ProductID
GROUP BY c.Country
ORDER BY 4 DESC;

-- =====================================
-- Average revenue per category
-- =====================================
SELECT 
    CategoryName, AVG(od.quantity * p.price) AS averagerevenue
FROM
    categories c
        JOIN
    products p ON c.categoryid = p.categoryid
        JOIN
    orderdetails od ON p.productid = od.productid
GROUP BY categoryname
ORDER BY averagerevenue DESC;