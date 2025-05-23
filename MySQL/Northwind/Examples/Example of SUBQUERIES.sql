-- Check for blank or whitespace region values.
SELECT * 
FROM employees 
WHERE Region = " ";

SELECT * 
FROM Employees 
WHERE Region LIKE '_%';

SELECT * 
FROM Employees 
WHERE Region != ' ';

SELECT * 
FROM Employees 
WHERE TRIM(Region) = '';


-- Using = and != in query.
SELECT * 
FROM Employees 
WHERE Country = 'Germany' 
	AND Age = 25;
-- AND

SELECT * 
FROM Employees 
WHERE EmployeeID IN (1, 3, 7) 
ORDER BY FirstName;
-- ORDER BY, ASC, DESC, LIMIT, GROUP BY

SELECT * 
FROM Employees 
WHERE EmployeeID NOT IN (1, 3, 7);
-- NOT IN

SELECT * 
FROM Employees 
WHERE EmployeeID = 1 
	OR EmployeeID = 7;
-- OR

SELECT * 
FROM Employees 
WHERE EmployeeID < 5;
-- <, <=

SELECT * 
FROM Employees 
WHERE EmployeeID BETWEEN 3 
	AND 6;
-- BETWEEN

SELECT * 
FROM Employees 
WHERE FirstName LIKE 'A%';
-- starts with A%, ends with %A

SELECT * 
FROM Employees 
WHERE SUBSTRING(City, 1, 1) BETWEEN "A" AND "C";  
-- from A to C — use SUBSTRING to avoid errors

SELECT CONCAT(FirstName, " ", LastName) 
FROM Employees;
-- can also use: LOWER(SUBSTRING(ContactName, 1, 1)) BETWEEN "e" AND "p"

-- SUM: sums values
-- COUNT(*): counts number of rows
-- LOWER(): convert to lowercase (UPPER for uppercase)
-- YEAR(OrderDate)=1997: extract only year
-- CHAR_LENGTH(FirstName): get number of characters in a word
-- EXTRACT(DAY FROM orderdate)=31 AND EXTRACT(MONTH FROM orderdate)=7
-- DIFFERENT
-- LIMIT 15;


-- Print employee names excluding first and last letter.
SELECT SUBSTRING(FirstName, 2, LENGTH(FirstName)-2) 
FROM Employees;

-- DATE_FORMAT(birthdate, "%d-%m-%Y") AS "Birthdays".
-- TIMESTAMPDIFF(YEAR, BirthDate, HireDate) AS "Years".
SELECT FirstName, LastName, DATEDIFF(HireDate, BirthDate)/365 AS Years 
FROM Employees;

-- CONCAT_WS adds separator.
-- POSITION returns position of substring.
-- WHERE YEAR(ord.OrderDate) BETWEEN 1997 AND YEAR(CURDATE()).
SELECT pro.ProductID, pro.ProductName, sup.Address 
FROM Products AS pro 
JOIN Suppliers AS sup ON pro.SupplierID = sup.SupplierID;

-- Count suppliers grouped by country whose name starts with letters from E to P and count > 2.
SELECT sup.Country, COUNT(*) 
FROM Suppliers AS sup 
WHERE SUBSTRING(sup.CompanyName, 1, 1) BETWEEN "E" AND "P" 
GROUP BY sup.Country 
HAVING COUNT(*) > 2;

-- Select all and extract year from OrderDate.
SELECT *, LEFT(OrderDate, 4) FROM Orders;

-- Reverse first names.
SELECT REVERSE(FirstName) FROM Employees;

-- Find position of "Anne" in FirstName.
SELECT *, POSITION("Anne" IN FirstName) FROM Employees;

-- Current date and time functions.
SELECT CURDATE();
SELECT NOW();
SELECT YEAR(NOW());
SELECT YEAR(BirthDate) FROM Employees;
SELECT UTC_TIME();
SELECT VERSION();

-- Average stock per category.
SELECT CategoryID, AVG(UnitsInStock) FROM Products;

-- GROUP BY something HAVING something (example structure).
SELECT DISTINCT Country FROM Customers;
-- COUNT(DISTINCT Country) gives number of different countries.

-- Modulo operation (even numbers).
SELECT * FROM Products WHERE MOD(ProductID, 2) = 0;
SELECT * FROM Products WHERE ProductID % 2 = 0;  -- same as above.

-- Show employee name and number of subordinates.
SELECT Boss.EmployeeID, 
	CONCAT(Boss.FirstName, " ", Boss.LastName) AS "Boss", 
	COUNT(*) AS "Employees Reporting"
FROM Employees AS Boss
JOIN Employees AS Slave ON Slave.ReportsTo = Boss.EmployeeID
GROUP BY Boss.EmployeeID;

-- Show the boss with the highest number of subordinates.
SELECT Boss.EmployeeID, 
	CONCAT(Boss.FirstName, " ", Boss.LastName) AS "Boss", 
	COUNT(*) AS "Employees Reporting"
FROM Employees AS Boss
JOIN Employees ON Employees.ReportsTo = Boss.EmployeeID
GROUP BY Boss.EmployeeID;

/*
MySQL DATE functions:
DAY           – Day of the month for a date
DAYNAME       – Name of the weekday
DAYOFMONTH    – Same as DAY
DAYOFWEEK     – Index of the weekday (1 = Sunday)
DAYOFYEAR     – Day number within the year
*/

