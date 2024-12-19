
CREATE DATABASE product_sales_analysis;
\c product_sales_analysis;
-- Table for Products
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

-- Table for Orders
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    ProductID INT REFERENCES Products(ProductID),
    Quantity INT NOT NULL,
    Sales DECIMAL(10,2) NOT NULL
);
INSERT INTO Products (ProductName, Price) VALUES
('Apple', 2.50),
('Banana', 1.50),
('Orange', 3.00),
('Mango', 2.00);
INSERT INTO Orders (ProductID, Quantity, Sales) VALUES
(1, 10, 25.00),
(1, 5, 12.50),
(2, 8, 12.00),
(3, 12, 36.00),
(4, 6, 12.00);

--Query to Calculate Total Revenue
SELECT p.ProductName, SUM(o.Sales) AS TotalRevenue
FROM Products p JOIN Orders ON p.ProductID = o.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;

CREATE VIEW TopSellingProducts AS
SELECT 
    p.ProductName,
    SUM(o.Sales) AS TotalRevenue
FROM 
    Products p
JOIN 
    Orders o
ON 
    p.ProductID = o.ProductID
GROUP BY 
    p.ProductName;

SELECT * FROM TopSellingProducts;