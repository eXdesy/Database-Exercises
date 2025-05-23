-- 1 - Count the number of products that are out of stock.
SELECT COUNT(*) 
FROM products 
WHERE UnitsInStock = 0;

-- 2 - Sum the total units in stock for all products where UnitsOnOrder is not zero.
SELECT SUM(UnitsInStock) AS 'Units in Stock' 
FROM products 
WHERE UnitsOnOrder != 0;

-- 3 - Count the number of employees whose first name starts with the letter A.
SELECT COUNT(*) 
FROM employees 
WHERE FirstName LIKE 'A%';
