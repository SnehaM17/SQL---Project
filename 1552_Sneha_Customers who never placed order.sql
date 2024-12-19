
CREATE TABLE Customers (
    id INT PRIMARY KEY,
    NAME VARCHAR(50)
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES Customers(id)
);
INSERT INTO Customers (id, NAME)
VALUES 
    (1, 'Joe'),
    (2, 'Henry'),
    (3, 'Sam'),
    (4, 'Max');

INSERT INTO Orders (id, customerId)
VALUES 
    (2, 1),
    (1, 3);

SELECT * FROM Customers;
SELECT * FROM Orders;

--Query to Find Customers Who Never Placed an Order
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o 
    ON c.id = o.customerId
WHERE o.customerId IS NULL;
