-- 1. Retrieve suppliers whose company name ends with "Ltd." and display the supplier ID and company name,
-- translating the column headers into Spanish.
SELECT SupplierID AS "ID de los proveedores", CompanyName AS "Nombre de la compañia" FROM suppliers WHERE CompanyName LIKE '%Ltd.';

-- 2. Show all information of suppliers whose contact name starts with the string chXr, 
-- where X represents any single character.
SELECT * FROM suppliers WHERE ContactName LIKE 'Ch%r';

-- 3. Show products with a discount along with the order ID and the employee who handled the order.
SELECT pro.*, ordt.OrderID, ordt.Discount, empl.LastName, empl.FirstName, ord.EmployeeID FROM products AS pro 
JOIN orderdetails AS ordt ON pro.ProductID = ordt.ProductID 
JOIN orders AS ord ON ordt.OrderID = ord.OrderID
JOIN employees AS empl ON ord.EmployeeID = empl.EmployeeID
WHERE ordt.Discount != 0;

-- 4. Count customers from each country who have a FAX number.
SELECT * FROM customers WHERE Fax != " " GROUP BY CustomerID;

-- 5. Count the number of orders shipped by shipping company number 3.

-- 6. Calculate the average reorder level of products whose name starts with C.
SELECT AVG(ReorderLevel) FROM products WHERE ProductName LIKE 'C%';

-- 7. Count the number of categories that have an image.
SELECT COUNT(*) FROM categories WHERE Picture != NULL;

-- 8. Show suppliers located in London.
SELECT * FROM suppliers WHERE City IN ("London");

-- 9. Get the total number of units in stock for products with even IDs.
SELECT SUM(UnitsInStock) FROM products WHERE ProductID %2;

-- 10. For each employee, show the description of their territory along with the territory ID and employee ID.
SELECT ter. TerritoryDescription, emplter.TerritoryID, empl.EmployeeID FROM employees AS empl 
JOIN employeeterritories AS emplter ON empl.EmployeeID = emplter.EmployeeID
JOIN territories AS ter ON emplter.TerritoryID = ter.TerritoryID;
