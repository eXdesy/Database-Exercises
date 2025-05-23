-- 1. Print products with a unit price lower than the average unit price.
SELECT * FROM Products
WHERE UnitPrice < (SELECT AVG(UnitPrice) FROM Products);

-- 2. Print employees who have fewer orders than the employee with ID 5.
SELECT * FROM Employees AS e
JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
WHERE e.EmployeeID <> 5
HAVING COUNT(o.EmployeeID) < (SELECT COUNT(*) FROM Orders WHERE EmployeeID = 5);

-- 3. Print (without duplicates) employees who have placed at least one order for suppliers whose company name is Exotic Liquids or Mayumi’s.
SELECT DISTINCT * FROM Employees AS e
JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails AS od ON o.OrderID = od.OrderID
JOIN Products AS p ON od.ProductID = p.ProductID
JOIN Suppliers AS sup ON p.SupplierID = sup.SupplierID
WHERE sup.CompanyName IN ('Exotic Liquids', 'Mayumi''s');

-- 4. Print order details and names of employees for those orders that belong to the categories Beverages or Seafood.
SELECT * FROM Orders AS o
JOIN Employees AS e ON o.EmployeeID = e.EmployeeID
JOIN OrderDetails AS od ON o.OrderID = od.OrderID
JOIN Products AS p ON od.ProductID = p.ProductID
JOIN Categories AS c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName IN ('Beverages', 'Seafood');

-- 5. Print employees who have NOT used the shipping company United Package.
SELECT * FROM Employees AS e
JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
JOIN Shippers AS sh ON o.ShipVia = sh.ShipperID
WHERE sh.CompanyName <> 'United Package';

-- 6. Print customers who are from a country with fewer customers than the country of the company named Bottom Dollar Market.
SELECT * FROM customers
WHERE Country IN (
  SELECT Country FROM customers
  HAVING COUNT(CustomerID) < 
	(SELECT COUNT(CustomerID) FROM customers
    WHERE CompanyName = 'Bottom Dollar Market')
);
