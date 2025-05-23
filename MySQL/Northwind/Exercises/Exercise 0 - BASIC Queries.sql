-- 1. Select all rows from the employees table.
SELECT * 
FROM employees;

-- 2. Repeat the above, but show only the first name and last name of each employee.
SELECT LastName, FirstName 
FROM employees;

-- 3. Repeat the above, but display the column headers in Spanish.
SELECT LastName "Nombre", FirstName "Apellido" 
FROM employees;

-- 4. Select all rows from the orders table and note how many there are in total.
-- (830 Orders).
SELECT * 
FROM orders;

-- Then, select again all rows but only displaying the order ID, and count again how many there are. Does it match the previous count? Why?.
-- (830 Orders, becouse each row have his own ID).
SELECT OrderID 
FROM orders;

-- 5. Show the names of the different supplier companies, renaming the column header as Company Name (keep the spaces).
SELECT CompanyName "Company Name" 
FROM suppliers;

-- 6. Show the product ID and product name for all products.
SELECT ProductID, ProductName 
FROM products;

-- 7. Display all the content of the products table.
SELECT * 
FROM products;

-- Then do the same with the orders table, again.
SELECT * 
FROM orders;

-- Do the same with the order details table. Does the content of the three tables show any similarity or relation? Do you think they are connected?.
SELECT * 
FROM orderdetails;
