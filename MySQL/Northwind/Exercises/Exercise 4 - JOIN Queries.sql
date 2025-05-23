-- 1. Get all orders made by employee Robert King.
SELECT orders.OrderID, employees.LastName, employees.FirstName 
FROM orders
JOIN employees ON orders.EmployeeID = employees.EmployeeID 
WHERE employees.FirstName = "Robert" 
	AND employees.LastName = "King";

-- 2. Get all orders made by Robert King, Nancy Davolio, and Andrew Fuller.
SELECT orders.OrderID, CONCAT(employees.LastName, " ", employees.FirstName), employees.EmployeeID 
FROM orders 
JOIN employees ON orders.EmployeeID = employees.EmployeeID 
WHERE (employees.FirstName = "Robert" AND employees.LastName = "King") 
   OR (employees.FirstName = "Nancy" AND employees.LastName = "Davolio") 
   OR (employees.FirstName = "Andrew" AND employees.LastName = "Fuller");

-- 3. Get all orders by the customer whose company is "Que delícia".
SELECT * 
FROM orders 
JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE customers.CompanyName = "Que delícia";

-- 4. Get all products (code, name, price, stock) from order 10257.
SELECT products.ProductID, products.ProductName, products.UnitPrice, products.UnitsInStock 
FROM products 
JOIN orderdetails ON products.ProductID = orderdetails.ProductID 
WHERE orderdetails.OrderID = "10257";

-- 5. Get all products (code, name, price, stock) from orders placed between 1997 and today.
SELECT products.ProductID, products.ProductName, products.UnitPrice, products.UnitsInStock 
FROM products
JOIN orderdetails ON products.ProductID = orderdetails.ProductID
JOIN orders ON orderdetails.OrderID = orders.OrderID
WHERE orders.OrderDate BETWEEN "1997-01-01" 
	AND CURDATE();

-- 6. Show order ID, order date, and total number of products per order.
SELECT orders.OrderID, orders.OrderDate, COUNT(*) AS "Total Products" 
FROM orders 
JOIN orderdetails ON orders.OrderID = orderdetails.OrderID
GROUP BY orders.OrderID;
 
-- 7. Get category name, product name, price and stock.
SELECT categories.CategoryName, products.ProductName, products.UnitPrice, products.UnitsInStock 
FROM products
JOIN categories ON categories.CategoryID = products.CategoryID;

-- 8. Get number of products per category (only for categories 3, 5, 8), ordered by category name.
SELECT COUNT(*) AS ProductCount, categories.CategoryName, categories.CategoryID 
FROM categories
JOIN products ON categories.CategoryID = products.CategoryID
WHERE categories.CategoryID IN (3, 5, 8)
GROUP BY categories.CategoryName
ORDER BY categories.CategoryName;

-- 9. View category name and number of products per category.
SELECT categories.CategoryName, COUNT(*) AS ProductCount 
FROM categories
JOIN products ON products.CategoryID = categories.CategoryID
GROUP BY categories.CategoryName;

-- 10. For each order, get order ID, product ID, supplier ID, and company name.
SELECT orderdetails.OrderID, orderdetails.ProductID, suppliers.SupplierID, suppliers.CompanyName 
FROM orderdetails
JOIN products ON products.ProductID = orderdetails.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID;

-- 11. For each order, get order ID, employee ID, and employee name.
SELECT orders.OrderID, orders.EmployeeID, employees.FirstName 
FROM orders
JOIN employees ON employees.EmployeeID = orders.EmployeeID;

-- 12. For each product, get product ID, category ID, and category name.
SELECT products.ProductID, products.CategoryID, categories.CategoryName 
FROM products
JOIN categories ON categories.CategoryID = products.CategoryID;

-- 13. For each employee, print employee ID, full name, and territory ID.
SELECT employees.EmployeeID, CONCAT(employees.FirstName, " ", employees.LastName) AS FullName, employeeterritories.TerritoryID 
FROM employees
JOIN employeeterritories ON employeeterritories.EmployeeID = employees.EmployeeID;

-- 14. For each customer, show customer ID, contact name, and orders.
SELECT customers.CustomerID, customers.ContactName, orders.OrderID 
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID;

-- 15. For each customer, show customer ID, contact name, and total number of orders.
SELECT customers.CustomerID, customers.ContactName, COUNT(*) AS "Total Orders" 
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
GROUP BY customers.CustomerID;

-- 16. For each order in orderdetails, print all info and category name.
SELECT orderdetails.*, categories.CategoryName 
FROM orderdetails
JOIN products ON products.ProductID = orderdetails.ProductID
JOIN categories ON categories.CategoryID = products.CategoryID;

-- 17. For each order, show order ID, customer address, and employee address.
SELECT orders.OrderID, customers.Address AS "Customer Address", employees.Address AS "Employee Address" 
FROM orders
JOIN customers ON customers.CustomerID = orders.CustomerID
JOIN employees ON employees.EmployeeID = orders.EmployeeID;

-- 18. For each product, show product ID, name, and supplier address.
SELECT products.ProductID, products.ProductName, suppliers.Address AS "Supplier Address" 
FROM products
JOIN suppliers ON suppliers.SupplierID = products.SupplierID;

-- 19. Show company name, customer ID, order date, unit price and product ID of each order.
SELECT customers.CompanyName, customers.CustomerID, orders.OrderDate, orderdetails.UnitPrice, orderdetails.ProductID 
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN orderdetails ON orderdetails.OrderID = orders.OrderID;

-- 20. Show product name, price, stock, and category name.
SELECT products.ProductName, products.UnitPrice, products.UnitsInStock, categories.CategoryName 
FROM products
JOIN categories ON categories.CategoryID = products.CategoryID;

-- 21. Show product name, price, supplier ID, and supplier company name.
SELECT products.ProductName, products.UnitPrice, suppliers.SupplierID, suppliers.CompanyName 
FROM products
JOIN suppliers ON suppliers.SupplierID = products.SupplierID;

-- 22. Show order ID, date, product ID, price, employee ID, and full employee name.
SELECT orders.OrderID, orders.OrderDate, products.ProductID, products.UnitPrice, employees.EmployeeID, 
	CONCAT(employees.FirstName, " ", employees.LastName) AS FullName 
FROM orders
JOIN orderdetails ON orderdetails.OrderID = orders.OrderID
JOIN products ON products.ProductID = orderdetails.ProductID
JOIN employees ON employees.EmployeeID = orders.EmployeeID;

-- 23. Calculate stock of products per category. Show category name and total stock.
SELECT SUM(products.UnitsInStock) AS TotalStock, categories.CategoryID, categories.CategoryName 
FROM products
JOIN categories ON categories.CategoryID = products.CategoryID
GROUP BY categories.CategoryName;

-- 24. Get customer name, supplier name, employee name, and product names in order 10794.
SELECT customers.ContactName AS "Customer", suppliers.ContactName AS "Supplier", 
	CONCAT(employees.FirstName, " ", employees.LastName) AS "Employee", products.ProductName FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN orderdetails ON orderdetails.OrderID = orders.OrderID
JOIN products ON products.ProductID = orderdetails.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
JOIN employees ON employees.EmployeeID = orders.EmployeeID
WHERE orders.OrderID = "10794";

-- 25. Select company name, order ID, order date, product code, quantity per unit, product name, supplier company and supplier city.
SELECT cus.CompanyName, ord.OrderID, ord.OrderDate, pr.ProductID, pr.QuantityPerUnit, pr.ProductName, sup.CompanyName AS Supplier, sup.City 
FROM customers AS cus
JOIN orders AS ord ON ord.CustomerID = cus.CustomerID
JOIN orderdetails AS ordt ON ordt.OrderID = ord.OrderID
JOIN products AS pr ON pr.ProductID = ordt.ProductID
JOIN suppliers AS sup ON sup.SupplierID = pr.SupplierID;

-- 26. Count suppliers per country whose name starts from E to P, and show only countries with more than 2 suppliers.
SELECT suppliers.Country, 
	COUNT(*) AS SupplierCount 
FROM suppliers
WHERE LOWER(LEFT(ContactName, 1)) BETWEEN "e" AND "p"
GROUP BY suppliers.Country 
HAVING COUNT(*) > 2;

-- 27. Show employee name and number of subordinates each manager has.
SELECT Boss.EmployeeID, CONCAT(Boss.FirstName, " ", Boss.LastName) AS "Manager", 
	COUNT(*) AS "Employees Under Supervision" 
FROM employees AS Boss
JOIN employees AS Subordinate ON Subordinate.ReportsTo = Boss.EmployeeID
GROUP BY Boss.EmployeeID;

-- 28. Show employee name and number of orders handled, only for those who handled more than 15 orders.
SELECT CONCAT(employees.FirstName, " ", employees.LastName) AS "Employee", 
	COUNT(*) AS "Orders" 
FROM employees
JOIN orders ON employees.EmployeeID = orders.EmployeeID
GROUP BY employees.EmployeeID 
HAVING COUNT(*) > 15;

-- 29. Show customer name, number of orders, and total money spent for customers from USA with more than 5 orders.
SELECT customers.ContactName, COUNT(*) AS "Orders", 
	SUM(orderdetails.UnitPrice * orderdetails.Quantity) AS "Total Spent" 
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN orderdetails ON orderdetails.OrderID = orders.OrderID
WHERE customers.Country = "USA"
GROUP BY customers.ContactName 
HAVING COUNT(*) > 5;

-- 30. Show the name of the manager who has the most subordinates.
SELECT Boss.EmployeeID, 
	CONCAT(Boss.FirstName, " ", Boss.LastName) AS "Manager", 
    COUNT(*) AS "Employees Under Supervision" 
FROM employees AS Boss
JOIN employees ON employees.ReportsTo = Boss.EmployeeID
GROUP BY Boss.EmployeeID
ORDER BY COUNT(*) DESC 
LIMIT 1;

-- 31. Get the name of the customer and number of orders of the most frequent buyer.
SELECT customers.ContactName, 
	COUNT(*) AS "Orders" 
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
GROUP BY customers.CustomerID
ORDER BY COUNT(*) DESC 
LIMIT 1;
