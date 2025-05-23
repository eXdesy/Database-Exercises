-- 1. Create a table named CATEGORIES2 with exactly the same structure and data types as the CATEGORIES table.
CREATE TABLE IF NOT EXISTS categories2 (
    CategoryID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    CategoryName VARCHAR(15) NOT NULL,
    Description LONGTEXT,
    Picture LONGBLOB
)  ENGINE=INNODB;

-- 2. Fill the new table with all the data from the original table, using a single SQL statement 
-- (you cannot use the reserved word VALUES).
INSERT INTO categories2
SELECT * 
FROM categories;

-- 3. Print (without repeating) the names of those cities that have FEWER customers than the number of customers in Buenos Aires minus those in Barcelona.
SELECT cust.City
FROM customers cust
GROUP BY cust.City
HAVING COUNT(*) < ((
	SELECT COUNT(*)
    FROM customers c
    WHERE c.City = 'Buenos Aires') - (SELECT
        COUNT(*)
    FROM customers c2
    WHERE c2.City = 'Barcelona'));
     
-- 4. Print the products whose unit price and units in stock are below the average unit price and average stock units.
SELECT *
FROM products prod
WHERE prod.UnitsInStock < (
	SELECT AVG(p.UnitsInStock)
	FROM products p)
		AND prod.UnitPrice < (
			SELECT AVG(p.UnitPrice)
            FROM products p);
           
-- 5. Print the first and last names of those employees who have fewer orders than the total number of orders from employee 1 and employee 4 combined.
SELECT EMP.FirstName, EMP.LastName, 
	COUNT(ORD.OrderID)
FROM orders AS ORD
JOIN employees AS EMP ON ORD.EmployeeID = EMP.EmployeeID
GROUP BY EMP.EmployeeID
HAVING COUNT(ORD.OrderID) < (
	SELECT COUNT(*)
    FROM orders
    WHERE EmployeeID IN (1 , 4));
       
-- 6. Delete from the CATEGORIES2 table those categories whose description contains the words ‘meats’, ‘candies’ or ‘fish’.
DELETE FROM categories2
WHERE Description LIKE ('%meats%')
    OR Description LIKE ('%candies%')
    OR Description LIKE ('%fish%');