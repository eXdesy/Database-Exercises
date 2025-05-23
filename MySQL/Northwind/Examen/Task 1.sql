-- 1. Show products with an EVEN Product ID.
SELECT * 
FROM products 
WHERE (ProductID % 2) = 0;

-- 2. Show orders placed in the year 1997 or 1998.
SELECT * 
FROM orders 
WHERE OrderDate LIKE '1997%' 
	OR OrderDate LIKE '1998%';

-- 3. Show suppliers from London or Venezuela.
SELECT * 
FROM suppliers 
WHERE City = 'London' 
	OR Country = 'Venezuela';
