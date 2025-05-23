-- 1. Display the Category ID, Category Name, and Description (in that order) for all existing categories.
-- Column headers must be exactly: ID de categoría, Nombre de categoría, and Descripcion.
-- Category names must be shown in uppercase.
SELECT CategoryID AS "ID de categoría", 
       UPPER(CategoryName) AS "Nombre de categoría", 
       Description AS "Descripcion"
FROM Categories;

-- 2. For each product, show the product name, the character length of the name, 
-- the unit price rounded down to the nearest integer, the units in stock, and profit.
-- Profit is calculated as UnitsOnOrder * Rounded Unit Price.
SELECT ProductName AS "Nombre de producto", 
       LENGTH(ProductName) AS "Longitud en caracteres del nombre de producto", 
       FLOOR(UnitPrice) AS "Precio redondeado", 
       UnitsInStock AS "Unidades en stock", 
       UnitsOnOrder * ROUND(UnitPrice) AS "Ganancia"
FROM Products;

-- 3. Count the number of products that belong to the category “Beverages”.
SELECT COUNT(*) AS "Nº Productos"
FROM Products AS pro
JOIN Categories AS cat ON pro.CategoryID = cat.CategoryID
WHERE cat.CategoryName LIKE "Beverages";

-- 4. For each product with no stock, show its name, the name of the supplier, and supplier's city.
SELECT pro.ProductName, supp.CompanyName, supp.City
FROM Suppliers AS supp
JOIN Products AS pro ON pro.SupplierID = supp.SupplierID
WHERE pro.UnitsInStock = 0;

-- 5. Show suppliers that have a visible value in the Homepage field.
SELECT * 
FROM Suppliers
WHERE HomePage != " ";

-- 6. Find the total units in stock for products whose category description is “Meat/Poultry”.
SELECT SUM(pro.UnitsInStock) AS "Unidades de Carnes preparadas"
FROM Products AS pro
JOIN Categories AS cat ON pro.CategoryID = cat.CategoryID
WHERE cat.CategoryName LIKE "Meat/Poultry";

-- 7. For each customer, count the total number of orders. 
-- Only include customers from Germany, Canada, or Venezuela who have a visible value in the Region field.
SELECT cust.CompanyName, 
	COUNT(*) AS "Nº Total de pedidos", cust.Country
FROM Customers AS cust
JOIN Orders AS ord ON cust.CustomerID = ord.CustomerID
WHERE cust.Country IN ("Germany", "Canada", "Venezuela") 
	AND Region != " "
GROUP BY cust.CustomerID;

-- 8. For each customer, order, and employee, show the distinct product IDs included in the orders.
SELECT cust.CompanyName, ord.OrderID, emp.EmployeeID, ordd.ProductID
FROM Orders AS ord
JOIN Employees AS emp ON ord.EmployeeID = emp.EmployeeID
JOIN Customers AS cust ON cust.CustomerID = ord.CustomerID
JOIN OrderDetails AS ordd ON ordd.OrderID = ord.OrderID;

-- 9. Find the average age of female sales representatives from London and Redmond.
SELECT AVG(DATEDIFF(CURDATE(), BirthDate) / 365) AS "Edad Media empleadas de Londres y Redmond"
FROM Employees
WHERE TitleOfCourtesy IN ("Ms.", "Mrs.") 
  AND City IN ("London", "Redmond") 
  AND Title LIKE "Sales Representative";

-- 10. For each city, show the number of employees older than 66 years.
SELECT City, 
	COUNT(*) AS "Nº de Empleados", 
	SUBSTR(DATEDIFF(CURDATE(), BirthDate) / 365, 1, 2) AS Edad
FROM Employees
GROUP BY Edad
HAVING Edad > 66;
