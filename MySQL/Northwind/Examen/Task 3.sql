-- 1. Names of products supplied by suppliers from Australia, Canada, or USA, for those products with an even Product ID.
SELECT p.ProductName, s.Country, p.ProductID
FROM Products AS p
JOIN Suppliers AS s ON p.SupplierID = s.SupplierID
WHERE p.SupplierID IN (
    SELECT SupplierID
    FROM Suppliers
    WHERE Country IN ('Australia', 'Canada', 'USA')
) AND p.ProductID % 2 = 0;

-- 2. Products whose category name starts with the letter C and ends with the letter S.
SELECT p.ProductName, c.CategoryName
FROM Products AS p
JOIN Categories AS c ON p.CategoryID = c.CategoryID
WHERE p.CategoryID IN (
    SELECT CategoryID
    FROM Categories
    WHERE CategoryName LIKE 'C%S'
);

-- 3. Show first and last names of employees who have more orders than those made by Anne Dodsworth or Nancy Davolio.
SELECT e.FirstName, e.LastName, o.OrderID
FROM Employees AS e
JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
WHERE e.EmployeeID NOT IN (
    SELECT EmployeeID
	FROM Employees
	WHERE (LastName = 'Dodsworth' AND FirstName = 'Anne')
	AND (LastName = 'Davolio' AND FirstName = 'Nancy')
);

-- 4. Countries that have three times as many customers as Ireland.
SELECT Country, COUNT(CustomerID) AS 'Numero de Clientes'
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 3 * (
    SELECT COUNT(CustomerID)
    FROM Customers
    WHERE Country = 'Ireland'
);

-- 5. Products whose units in stock are greater than the average units in stock of products in category 3.
SELECT ProductName, UnitsInStock
FROM Products
WHERE UnitsInStock > (
    SELECT AVG(UnitsInStock)
    FROM Products
    WHERE CategoryID = 3
);

-- 6. Category names with a number of products greater than the total number of products included in orders 10260, 10263, and 10283.
SELECT c.CategoryName, p.ProductID
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
WHERE c.CategoryID IN (
    SELECT CategoryID
    FROM Products
    GROUP BY CategoryID
    HAVING COUNT(ProductID) > (
        SELECT COUNT(DISTINCT ProductID)
        FROM OrderDetails
        WHERE OrderID IN (10260, 10263, 10283)
    )
);
