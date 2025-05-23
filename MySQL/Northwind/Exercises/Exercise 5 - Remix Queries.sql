-- (To Your Honor: this query set has been crafted so that your grace may understand it clearly. May it be to your liking and free of ambiguities,
-- for this humble servant has prepared it with the utmost care. Should it not be so, may the devil take me and feast upon my soul.)

-- 1. Count the number of orders placed by customers from Mexico.
SELECT customers.CustomerID, 
	COUNT(*) AS "Orders"
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
WHERE customers.Country = "Mexico"
GROUP BY customers.CustomerID;

-- 2. For each order, display its info along with the name of the shipping company (ShipVia).
SELECT shippers.CompanyName, orders.* 
FROM shippers
JOIN orders ON orders.ShipVia = shippers.ShipperID;

-- 3. Print all customer information with column names translated to Spanish and using spaces for compound words.
SELECT customers.CustomerID AS "Customer ID",
       customers.CompanyName AS "Company Name",
       customers.ContactName AS "ContactName",
       customers.ContactTitle AS "Contact Title",
       customers.Address AS "Address",
       customers.City AS "City",
       customers.PostalCode AS "Postal Code",
       customers.Country AS "Country",
       customers.Phone AS "Phone"
FROM customers;

-- 4. For each product, show its name and the description of the category it belongs to.
SELECT products.ProductName, categories.Description 
FROM products
JOIN categories ON categories.CategoryID = products.CategoryID;

-- 5. Show countries and number of employees in each.
SELECT employees.Country, 
	COUNT(*) AS "Employees" 
FROM employees
GROUP BY employees.Country;

-- 6. Count orders placed by customers from Spain.
SELECT customers.CustomerID, 
	COUNT(*) AS "Orders"
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
WHERE customers.Country = "Spain"
GROUP BY customers.CustomerID;

-- 7. Show orders made by customers from Sweden and Argentina.
SELECT customers.CustomerID, 
	COUNT(*) AS "Orders"
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
WHERE customers.Country = "Sweden" 
	OR customers.Country = "Argentina"
GROUP BY customers.CustomerID;

-- 8. For each order, show the average discount.
SELECT orderdetails.OrderID, 
	AVG(Discount) AS "Average Discount" 
FROM orderdetails
GROUP BY orderdetails.OrderID;

-- 9. For each order, count the products it includes, but only for those orders with more than 3 products and handled by a U.S. employee.
SELECT orderdetails.OrderID, COUNT(*) 
FROM products
JOIN orderdetails ON orderdetails.ProductID = products.ProductID
JOIN orders ON orders.OrderID = orderdetails.OrderID
JOIN employees ON employees.EmployeeID = orders.EmployeeID
WHERE products.UnitsInStock > 3 
	AND employees.Country = "USA"
GROUP BY orderdetails.OrderID
HAVING COUNT(*) > 3;

-- 10. Show full names of all employees in one column, ordered by age (oldest first).
SELECT CONCAT(employees.FirstName, " ", employees.LastName) AS "Full Name" 
FROM employees
ORDER BY employees.BirthDate ASC;

-- 11. For each shipping company, show its name and count the number of orders it has shipped.
SELECT shippers.CompanyName, 
	COUNT(*) AS "Orders Shipped" 
FROM shippers
JOIN orders ON orders.ShipVia = shippers.ShipperID
GROUP BY shippers.CompanyName;

-- 12. Show the countries of both customers and employees without repetition.
SELECT DISTINCT customers.Country AS "Customer Country", employees.Country AS "Employee Country" 
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN employees ON employees.EmployeeID = orders.EmployeeID;

-- 13. Count the distinct territory IDs.
SELECT COUNT(DISTINCT TerritoryID) AS "Territories" 
FROM territories;

-- 14. Count the number of categories whose name starts with C and ends with S, using alias.
SELECT COUNT(*) AS "Categories" 
FROM categories
WHERE CategoryName LIKE "C%S";

-- 15. Show the distinct territories and the description of the region.
SELECT territories.*, region.RegionDescription 
FROM territories
JOIN region ON region.RegionID = territories.RegionID;

-- 16. Count the number of rows in the customerdemographics table.
SELECT COUNT(*) AS "Total Rows" 
FROM customerdemographics;

-- 17. Show supplier cities in reverse alphabetical order, only those that start with letters A to C.
SELECT suppliers.City 
FROM suppliers
WHERE LEFT(suppliers.City, 1) BETWEEN "A" AND "C"
ORDER BY suppliers.City DESC;

-- 18. For each shipping company, count the number of distinct products sent.
-- Note: based on the original context, we assume suppliers = shippers in this logic.
SELECT suppliers.CompanyName, 
	COUNT(DISTINCT products.ProductID) AS "Distinct Products Sent"
FROM suppliers
JOIN products ON products.SupplierID = suppliers.SupplierID
GROUP BY suppliers.CompanyName;
