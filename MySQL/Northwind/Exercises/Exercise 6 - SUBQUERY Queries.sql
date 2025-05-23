-- 0. Cities with fewer customers than the city of Buenos Aires.
SELECT City, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY City
HAVING CustomerCount < (
    SELECT COUNT(*) 
    FROM Customers 
    WHERE City = 'Buenos Aires'
);

-- 1. Products whose stock value is greater than the maximum stock value of products in category 4.
SELECT *
FROM Products
WHERE UnitsInStock * UnitPrice > (
    SELECT MAX(UnitsInStock * UnitPrice)
    FROM Products
    WHERE CategoryID = 4
);

-- 2. Names of employees who are managers.
SELECT CONCAT(Jefe.FirstName, ' ', Jefe.LastName) AS Managers
FROM employees AS Jefe, employees AS Empleado
WHERE Empleado.ReportsTo = Jefe.EmployeeID
GROUP BY Jefe.EmployeeID;

-- 3. Products whose category starts with the letter C.
SELECT ProductID, ProductName
FROM Products
WHERE CategoryID IN (
    SELECT CategoryID 
    FROM Categories 
    WHERE CategoryName LIKE 'C%'
);

-- 4. Orders with Freight value above average.
SELECT *
FROM Orders
WHERE Freight > (
    SELECT AVG(Freight) 
    FROM Orders
);

-- 5. Products with stock greater than the maximum stock of category 4.
SELECT ProductID, UnitsInStock AS Stock
FROM Products
HAVING Stock > (
    SELECT MAX(UnitsInStock)
    FROM Products
    WHERE CategoryID = 4
);

-- Equivalent with stock * unit price:
SELECT * 
FROM Products
WHERE UnitsInStock * UnitPrice > (
    SELECT MAX(UnitsInStock * UnitPrice)
    FROM Products
    WHERE CategoryID = 4
);

-- 6. Suppliers from countries with more suppliers than Germany.
SELECT CompanyName, SupplierID
FROM Suppliers
WHERE Country IN (
    SELECT Country
    FROM Suppliers
    GROUP BY Country
    HAVING COUNT(*) > (
        SELECT COUNT(*) 
        FROM Suppliers 
        WHERE Country = 'Germany'
    )
);

-- 7. Employees older than average age.
SELECT FirstName, LastName, 
	TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) AS Age
FROM Employees
WHERE TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) > (
    SELECT AVG(TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()))
    FROM Employees
);

-- 8. Employees older than average 'Sales Representative'.
SELECT FirstName, LastName, TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) AS Age
FROM Employees
WHERE TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) > (
    SELECT AVG(TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()))
    FROM Employees
    WHERE Title = "Sales Representative"
);

-- 9. Employees older than Margaret Peacock.
SELECT *
FROM Employees
WHERE TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) > (
    SELECT TIMESTAMPDIFF(YEAR, BirthDate, CURDATE())
    FROM Employees
    WHERE FirstName = 'Margaret' 
		AND LastName = 'Peacock'
);

-- 10. Get OrderID, CustomerID, and CompanyName (without JOIN).
SELECT OrderID, CustomerID, (
    SELECT CompanyName 
    FROM Customers 
    WHERE Customers.CustomerID = Orders.CustomerID
) AS CompanyName
FROM Orders;

-- 11. Company names of customers who did not order in 1996 (no JOIN).
SELECT CompanyName AS "Customers without orders in 1996"
FROM Customers
WHERE CustomerID NOT IN (
    SELECT CustomerID 
    FROM Orders 
    WHERE YEAR(OrderDate) = 1996
);

-- 12. Products supplied by Japanese suppliers (no JOIN).
SELECT ProductName
FROM Products
WHERE SupplierID IN (
    SELECT SupplierID 
    FROM Suppliers 
    WHERE Country = "Japan"
);

-- 16. Categories with more products than category 'Condiments'.
SELECT CategoryName
FROM Categories
WHERE CategoryID IN (
    SELECT pro.CategoryID
    FROM Products AS pro
    JOIN Categories AS cat ON pro.CategoryID = cat.CategoryID
    GROUP BY cat.CategoryName
    HAVING COUNT(pro.ProductID) > (
        SELECT COUNT(*) 
        FROM Products
        WHERE CategoryID = (
            SELECT CategoryID 
            FROM Categories 
            WHERE CategoryName = 'Condiments'
        )
    )
);

-- 17. Employee IDs with more orders than the average.
SELECT EmployeeID, COUNT(*) AS Orders
FROM Orders
GROUP BY EmployeeID
HAVING COUNT(*) > (
    SELECT AVG(OrderCount)
    FROM (
        SELECT COUNT(*) AS OrderCount 
        FROM Orders 
        GROUP BY EmployeeID
    ) AS Temp
);

-- 18. Products with more stock than the maximum stock of category 1 or 3.
SELECT ProductID, UnitsInStock
FROM Products
WHERE UnitsInStock > (
    SELECT MAX(UnitsInStock)
    FROM Products
    WHERE CategoryID IN (1, 3)
);

-- 19. Employees younger than Anne Dodsworth or Janet Leverling.
SELECT *
FROM Employees
WHERE TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) < (
    SELECT TIMESTAMPDIFF(YEAR, BirthDate, CURDATE())
    FROM Employees
    WHERE (FirstName = 'Anne' AND LastName = 'Dodsworth')
       OR (FirstName = 'Janet' AND LastName = 'Leverling')
);

-- 20. Countries with more suppliers than Brazil and Spain combined.
SELECT Country
FROM Suppliers
GROUP BY Country
HAVING COUNT(*) > (
    SELECT COUNT(*) 
    FROM Suppliers 
    WHERE Country IN ('Spain', 'Brazil')
);

-- 21. Suppliers from countries with more suppliers than Spain and Brazil combined.
SELECT CompanyName, SupplierID
FROM Suppliers
WHERE Country IN (
    SELECT Country
    FROM Suppliers
    GROUP BY Country
    HAVING COUNT(*) > (
        SELECT COUNT(*) 
        FROM Suppliers 
        WHERE Country IN ('Spain', 'Brazil')
    )
);

-- 22. Cities with more customers than Madrid.
SELECT City
FROM Customers
GROUP BY City
HAVING COUNT(*) > (
    SELECT COUNT(*) 
    FROM Customers 
    WHERE City = 'Madrid'
);

-- 23. Cities with more customers than Madrid and Sevilla. (MAX logic needs adjustment.)
SELECT City
FROM Customers
GROUP BY City
HAVING COUNT(*) > (
    SELECT MAX(ClientCount)
    FROM (
        SELECT COUNT(*) AS ClientCount
        FROM Customers
        WHERE City IN ('Madrid', 'Sevilla', 'Seville')
        GROUP BY City
    ) AS Sub
);

-- 24. Cities with more customers than Madrid, Sevilla, or Seville combined.
SELECT City
FROM Customers
GROUP BY City
HAVING COUNT(*) > (
    SELECT COUNT(*)
    FROM Customers
    WHERE City IN ('Madrid', 'Sevilla', 'Seville')
);

-- 25. Cities with more customers than the combined number from Madrid, Sevilla, and Lisbon.
SELECT City
FROM Customers
GROUP BY City
HAVING COUNT(*) > (
    SELECT COUNT(*)
    FROM Customers
    WHERE City IN ('Madrid', 'Sevilla', 'Lisboa')
);

-- 26. Employees with age equal or greater than average.
SELECT CONCAT_WS(' ', FirstName, LastName) AS Employee,
       TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) AS Age
FROM Employees
WHERE TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) >= (
    SELECT AVG(TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()))
    FROM Employees
);

-- 27. Employees with age equal or greater than average of Sales Representatives.
SELECT CONCAT_WS(' ', FirstName, LastName) AS Employee,
	TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) AS Age
FROM Employees
WHERE TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) >= (
    SELECT AVG(TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()))
    FROM Employees
    WHERE Title = 'Sales Representative'
);

-- 28. Products with more stock than the minimum of category 4 or category 6.
SELECT *
FROM Products
WHERE UnitsInStock > (
    SELECT MIN(UnitsInStock) 
    FROM Products 
    WHERE CategoryID = 4
)
OR UnitsInStock > (
    SELECT MIN(UnitsInStock) 
    FROM Products 
    WHERE CategoryID = 6
);

-- 29. Products belonging to categories starting with C or D.
SELECT *
FROM Products
WHERE CategoryID IN (
    SELECT CategoryID 
    FROM Categories 
    WHERE CategoryName LIKE 'C%' 
		OR CategoryName LIKE 'D%'
);

-- 30. Cities with fewer customers than Buenos Aires and Munich.
SELECT City
FROM Customers
GROUP BY City
HAVING COUNT(*) < (
    SELECT COUNT(*) 
    FROM Customers 
    WHERE City IN ('Buenos Aires', 'Munich')
);

-- 31. Employees younger than Margaret, Laura, and Michael.
SELECT *
FROM Employees
WHERE TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) < (
    SELECT MIN(TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()))
    FROM Employees
    WHERE FirstName IN ('Margaret', 'Laura', 'Michael')
);
