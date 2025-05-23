-- 1. Print products with a unit price lower than the average unit price.
SELECT *
FROM Products
WHERE UnitPrice < (
    SELECT AVG(UnitPrice)
    FROM Products
);

-- 2. Print employees who have fewer orders than the employee with ID 5.
SELECT e.EmployeeID, e.FirstName, e.LastName, 
	COUNT(o.OrderID) AS OrderCount
FROM Employees e
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID
HAVING OrderCount < (
    SELECT COUNT(*)
    FROM Orders
    WHERE EmployeeID = 5
);

-- 3. Print (without duplicates) employees who have placed at least one order for suppliers whose company name is Exotic Liquids or Mayumi’s.
SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.CompanyName IN ('Exotic Liquids', 'Mayumi’s');

-- 4. Print order details and names of employees for those orders that belong to the categories Beverages or Seafood.
SELECT o.OrderID, e.FirstName, e.LastName, p.ProductName, c.CategoryName
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName IN ('Beverages', 'Seafood');

-- 5. Print employees who have NOT used the shipping company United Package.
SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
WHERE e.EmployeeID NOT IN (
    SELECT DISTINCT o.EmployeeID
    FROM Orders o
    JOIN Shippers s ON o.ShipVia = s.ShipperID
    WHERE s.CompanyName = 'United Package'
);

-- 6. Print customers who are from a country with fewer customers than the country of the company named Bottom Dollar Market.
SELECT *
FROM Customers
WHERE Country IN (
    SELECT Country
    FROM Customers
    GROUP BY Country
    HAVING COUNT(*) < (
        SELECT COUNT(*)
        FROM Customers
        WHERE Country = (
            SELECT Country
            FROM Customers
            WHERE CompanyName = 'Bottom Dollar Market'
            LIMIT 1
        )
    )
);

