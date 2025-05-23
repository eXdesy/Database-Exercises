-- 1. For each order, show the number of lines (from OrderDetails table).
SELECT COUNT(OrderID) 
FROM orderdetails 
GROUP BY OrderID;

-- 2. For each product, show the number of lines (from OrderDetails table).
SELECT COUNT(ProductID) 
FROM orderdetails 
GROUP BY ProductID;

-- 3. For each customer, show the number of orders.
SELECT CustomerID, 
	COUNT(OrderID) 
FROM orders 
GROUP BY CustomerID;

-- 4. Repeat the previous one, only for customers from London.
SELECT CustomerID, ShipCity, 
	COUNT(OrderID) 
FROM orders 
WHERE ShipCity = 'London' 
GROUP BY CustomerID;

-- 5. Repeat exercise 1, showing only those with more than 4 lines.
SELECT OrderID, 
	COUNT(OrderID)
FROM orderdetails 
GROUP BY OrderID 
HAVING COUNT(OrderID) > 4;

-- 6. For each customer, show the number of orders, only for those with more than 10 orders.
SELECT CustomerID, 
	COUNT(OrderID)
FROM orders 
GROUP BY CustomerID 
HAVING COUNT(OrderID) > 10;

-- 7. Show the number of employees in each city.
SELECT City, 
	COUNT(EmployeeID) 
FROM employees 
GROUP BY City;

-- 8. Show the number of employees in each city that has at least two employees.
SELECT City, 
	COUNT(EmployeeID) 
FROM employees 
GROUP BY City 
HAVING COUNT(EmployeeID) > 1;

-- 9. Show the number of employees in each city with the title 'Sales Representative', only for cities with at least two such employees. Order by number of employees.
SELECT City, Title, 
	COUNT(EmployeeID)
FROM employees 
WHERE Title = 'Sales Representative' 
GROUP BY City 
HAVING COUNT(EmployeeID) > 2 
ORDER BY COUNT(EmployeeID);

-- 10. Show the distinct cities where employees work.
SELECT City 
FROM employees 
GROUP BY City;

-- 11. Count the number of employees in each city.
SELECT City, 
	COUNT(EmployeeID) AS "Employees" 
FROM employees 
GROUP BY City;

-- 12. For each shipping country and city, show the total number of orders.
SELECT ShipCountry, ShipCity, 
	COUNT(EmployeeID) 
FROM orders 
GROUP BY ShipCity, ShipCountry;

-- 13. For each country and city, count employees with the title 'Sales Representative'.
SELECT Country, City, 
	COUNT(EmployeeID), Title 
FROM employees 
WHERE Title = 'Sales Representative' 
GROUP BY City, Country;

-- 14. For each shipping country and city, count the number of customers.
SELECT ShipCountry, ShipCity, 
	COUNT(ShipName) 
FROM orders 
GROUP BY ShipCountry, ShipCity;

-- 15. Repeat the previous one, showing only those with more than one customer.
SELECT ShipCountry, ShipCity, 
	COUNT(ShipName) 
FROM orders 
GROUP BY ShipCountry, ShipCity 
HAVING COUNT(ShipName) > 1;

-- 16. For each product, find the total quantity sold and the average per order.
SELECT SUM(Quantity), 
	AVG(Quantity) AS "Average per order", ProductID 
FROM orderdetails 
GROUP BY ProductID;

-- 17. For each order, count the distinct products sold (not quantities).
SELECT OrderID, 
	COUNT(ProductID) 
FROM orderdetails 
GROUP BY OrderID;

-- 18. Repeat the previous one, showing only orders with a single product.
SELECT OrderID, 
	COUNT(ProductID) 
FROM orderdetails 
GROUP BY OrderID 
HAVING COUNT(ProductID) = 1;

-- 19. In the suppliers table, count the number of suppliers by contact title.
SELECT ContactTitle, 
	COUNT(SupplierID) 
FROM northwind.suppliers 
GROUP BY ContactTitle;

-- 20. Count the number of products whose name starts with the letter C.
SELECT COUNT(ProductName) AS 'Products starting with C' 
FROM Products 
WHERE ProductName LIKE 'C%';

-- 21. Count the number of orders placed in a July month (OrderDate).
SELECT COUNT(*) AS 'Orders in July' 
FROM Orders 
WHERE EXTRACT(MONTH FROM OrderDate) = 7;

-- 22. Count the number of orders placed by customer DUMON in the year 1997.
SELECT CustomerID, 
	COUNT(*) AS "No. of Orders"
FROM orders 
WHERE YEAR(OrderDate) = 1997 
GROUP BY CustomerID 
HAVING CustomerID = 'DUMON';

-- 23. Count the number of orders where the years of the date-type fields are not all equal.
SELECT COUNT(*) AS "Orders with different year values in date fields" 
FROM orders;
