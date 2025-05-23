-- 1. Select purchase orders (Orders) made by employees with ID between 2 and 5, with an order date of July 31st of any year. Look up the EXTRACT function.
SELECT * 
FROM orders 
WHERE EmployeeID BETWEEN 2 AND 5 
  AND EXTRACT(MONTH FROM OrderDate) = 7 
  AND EXTRACT(DAY FROM OrderDate) = 31;

-- 2. Select purchase orders made by employee with ID 3, in any year, but only from the last 5 months (August–December). Look up the MONTH function.
SELECT * 
FROM orders 
WHERE EmployeeID = 3 
  AND EXTRACT(MONTH FROM OrderDate) BETWEEN 8 AND 12;

-- 3. Select order details (OrderDetails) with quantities between 10 and 250.
SELECT * 
FROM orderdetails 
WHERE Quantity BETWEEN 10 AND 250;

-- 4. Select order details where the total cost (unit price x quantity) is between 10 and 330. Show cost as TOTAL.
SELECT Quantity * UnitPrice AS TOTAL 
FROM orderdetails 
WHERE Quantity * UnitPrice BETWEEN 10 AND 330;

-- 5. List all distinct countries of the customers (check the DISTINCT operator).
SELECT DISTINCT Country 
FROM customers;

-- 6. Show the 15 best-selling products.
SELECT * 
FROM orderdetails 
ORDER BY Quantity DESC 
LIMIT 15;

-- 7. Print the name of all employees, along with the length (in characters) of their name (in two columns).
SELECT FirstName, 
	LENGTH(FirstName) 
FROM employees;

-- 8. Print full name (first and last) of all employees in a single column, concatenated.
SELECT CONCAT(LastName, " ", FirstName) AS FullName 
FROM employees;

-- 9. Print employees' first names in lowercase and last names in uppercase.
SELECT LCASE(FirstName), 
	UPPER(LastName) 
FROM employees;

-- 10. Print employees' first names excluding the first and last character.
SELECT SUBSTRING(FirstName, 2, LENGTH(FirstName) - 2) AS TrimmedName 
FROM employees;

-- 11. Print first name, last name, and birth date of all employees. Date must be in European format (DD-MM-YYYY).
SELECT FirstName, LastName, 
	DATE_FORMAT(BirthDate, "%d-%m-%Y") AS BirthDate 
FROM employees;

-- 12. For each employee, print their name and the number of years between their birth and hiring date.
SELECT FirstName, LastName, 
	FLOOR(DATEDIFF(HireDate, BirthDate) / 365) AS YearsBetweenBirthAndHire 
FROM employees;

-- 13. For each employee, print the number of months between their hire date and today.
SELECT PERIOD_DIFF(DATE_FORMAT(CURDATE(), "%Y%m"), DATE_FORMAT(HireDate, "%Y%m")) AS MonthsSinceHire 
FROM employees;

-- 14. Repeat the previous query using TIMESTAMPDIFF to express the result in months.
SELECT TIMESTAMPDIFF(MONTH, HireDate, CURDATE()) AS MonthsSinceHire 
FROM employees;

-- 15. Repeat the previous query expressing the result in days.
SELECT TIMESTAMPDIFF(DAY, HireDate, CURDATE()) AS DaysSinceHire 
FROM employees;

-- 16. Print the name of the weekday on which each employee was born, along with their name.
SELECT FirstName, LastName, 
	DAYNAME(BirthDate) AS BirthWeekday 
FROM employees;

-- 17. Print the name of the month in which each employee was born, along with their name.
SELECT FirstName, LastName, 
	MONTHNAME(BirthDate) AS BirthMonth 
FROM employees;

-- 18. For each order, print the order ID, product name, and total profit (unit price x quantity).
SELECT OrderID, ProductID, Quantity * UnitPrice AS Profit 
FROM orderdetails;

-- 19. For each employee, print name, hire date, days since hire, and age at the time of hire.
SELECT FirstName, LastName, HireDate, 
       TIMESTAMPDIFF(DAY, HireDate, CURDATE()) AS DaysSinceHire, 
       TIMESTAMPDIFF(YEAR, BirthDate, HireDate) AS AgeAtHire 
FROM employees;

-- 20. Repeat the previous exercise adding a column for the age at hire.
SELECT FirstName, LastName, HireDate, 
       DATEDIFF(CURRENT_TIMESTAMP, HireDate) AS DaysSinceHire, 
       FLOOR(DATEDIFF(HireDate, BirthDate)/365) AS AgeAtHire 
FROM employees;

-- 21. Select the 7 most expensive products that are in stock. Check the LIMIT function.
SELECT * 
FROM products 
WHERE UnitsInStock > 0 
ORDER BY UnitPrice DESC 
LIMIT 7;

-- 22. Select the 9 products with the lowest stock, that belong to category 3, 5, or 8.
SELECT ProductName, UnitsInStock, CategoryID 
FROM products 
WHERE CategoryID IN (3, 5, 8) 
ORDER BY UnitsInStock ASC 
LIMIT 9;
