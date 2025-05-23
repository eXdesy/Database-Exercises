-- 1. Show all employees and all their attributes.
SELECT * 
FROM employees;

-- 2. Show all products and all their attributes.
SELECT * 
FROM products;

-- 3. Show the product code, name, and category.
SELECT ProductID, ProductName, CategoryID 
FROM products;

-- 4. Show the products that belong to category 2.
SELECT * 
FROM products 
WHERE CategoryID=2;

-- 5. Products that belong to both category 2 and 4.
SELECT * 
FROM products 
WHERE CategoryID=2 
	AND CategoryID=4;

-- 6. Products that belong to category 2 or 4.
SELECT * 
FROM products 
WHERE CategoryID=2 
	OR CategoryID=4;

-- 7. Show product ID, name, and unit price for all products with unit price greater than 100.
SELECT ProductID, ProductName, UnitPrice 
FROM products 
WHERE UnitPrice > 100;

-- 8. Show the product with the name “tofu”.
SELECT * 
FROM products 
WHERE ProductName="tofu";

-- 9. Show products whose category ID is 2, 3, or 4. Do it in two different ways.
SELECT CategoryID 
FROM products 
WHERE CategoryID IN (2,3,4);

SELECT CategoryID 
FROM products 
WHERE CategoryID=2 
	OR CategoryID=3 
    OR CategoryID=4;

-- 10. Show products whose supplier ID is 3, 5, or 8.
SELECT SupplierID 
FROM products 
WHERE SupplierID IN (3,5,8);

-- 11. Show products whose price is between 30 and 60 dollars.
SELECT UnitPrice 
FROM products 
WHERE UnitPrice BETWEEN 30 AND 60;

-- 12. Show products with stock between 0 and 10.
SELECT ProductID, UnitsInStock 
FROM products 
WHERE UnitsInStock BETWEEN 0 AND 10;

-- 13. Show all products that start with ‘c’.
SELECT ProductName 
FROM products 
WHERE ProductName LIKE "C%";

-- 14. Sort all products by name, in ascending order.
SELECT * 
FROM products 
ORDER BY ProductName ASC;

-- 15. Sort all orders by ID, in descending order.
SELECT * 
FROM orders 
ORDER BY OrderDate DESC;

-- 16. Select all fields from the customer table, sorted by contact name alphabetically.
SELECT * 
FROM customers 
ORDER BY ContactName ="A&Z";

SELECT * 
FROM customers 
ORDER BY ContactName ASC;

-- 17. Select all fields from the orders table, sorted by order date in descending order.
SELECT * 
FROM orders 
ORDER BY OrderDate DESC;

-- 18. Select all fields from the order details table, sorted by quantity ordered in ascending order.
SELECT * 
FROM orderdetails 
ORDER BY Quantity ASC;

-- 19. Get all products whose name starts with the letter P and have a unit price between 10 and 120 dollars.
SELECT * 
FROM Products 
WHERE ProductName LIKE "P%" 
	AND UnitPrice BETWEEN 10 AND 120;

-- 20. Get all customers from the countries: USA, France or UK. Do it in two ways.
SELECT * 
FROM customers 
WHERE Country IN ("USA", "France", "UK");

SELECT * 
FROM customers 
WHERE Country = "USA" 
	OR Country = "France" 
    OR Country = "UK";

-- 21. Get all discontinued products (Discontinued = 1) or out of stock, that belong to category 1, 3, 4 or 7.
SELECT * 
FROM products 
WHERE (Discontinued = 1 OR UnitsInStock = 0) 
	AND (CategoryID IN (1, 3, 4, 7));

-- 22. Get all orders made by employees with ID: 2, 5, or 7 in the year 1996.
SELECT * 
FROM orders 
WHERE EmployeeID IN (2,5,7) 
	AND OrderDate LIKE "1996%";

SELECT * 
FROM orders 
WHERE (EmployeeID = 2 OR EmployeeID = 5 OR EmployeeID = 7) 
	AND (OrderDate LIKE "1996%");

-- 23. Select all customers who have a Fax (non-null value).
SELECT * 
FROM customers 
WHERE fax IS NOT NULL;

-- 24. Select all employees who have a supervisor (Reports To field).
SELECT * 
FROM employees 
WHERE ReportsTo IS NOT NULL;

-- 25. Select all customer fields whose company name starts with letters A to D and are from USA, ordered by address.
SELECT * 
FROM employees 
WHERE CompanyName LIKE "A%D" 
	AND Country = "USA" 
ORDER BY Address;

-- 26. Select all customer fields whose company name starts with letters B to G and are from UK, ordered by company name.
SELECT * 
FROM customers 
WHERE (CompanyName BETWEEN "B%" AND "G%") 
	AND (Country = "UK") 
ORDER BY CompanyName ASC;

-- 27. Select all active products with unit prices between 35 and 250, out of stock, belonging to categories 1, 3, 4, 7 or 8, and distributed 
-- by suppliers 2, 4, 6, 7, 8 or 9.
SELECT * 
FROM Northwind.Products 
WHERE (UnitPrice >= 35 AND UnitPrice <= 250) 
  AND UnitsInStock = 0 
  AND CategoryID IN (1, 3, 4, 7, 9) 
  AND SupplierID IN (2, 4, 6, 7, 8, 9);

-- 28. Select all fields from discontinued products, belonging to suppliers with IDs: 1, 3, 7, 8, and 9, that have stock available, and 
-- whose unit prices are between 39 and 190, ordered by supplier ID and unit price ascending.
SELECT * 
FROM products 
WHERE Discontinued = 1 
  AND SupplierID IN (1, 3, 7, 8, 9) 
  AND UnitPrice BETWEEN 39 AND 190 
  ORDER BY SupplierID ASC, UnitPrice ASC;
