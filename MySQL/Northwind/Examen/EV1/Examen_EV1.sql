-- 1. Show the category ID, category name, and description (in this order) for all existing categories. 
-- The column headers in the result grid must appear exactly as "ID de categoría", "Nombre de categoría", 
-- and "Descripcion", preserving the spaces. The names of the categories must be shown entirely in uppercase.

-- 2. For each product, display the product name, character length of the product name, 
-- unit price rounded down to the nearest integer, number of units in stock, and profit. 
-- The profit is calculated using the number of units and the rounded unit price of the product.

-- 3. Count the number of products that belong to the "Beverages" category.
SELECT COUNT(products.UnitsInStock) AS "Bebidas" FROM products 
JOIN categories ON products.CategoryID = categories.CategoryID 
WHERE categories.CategoryName = "Beverages";

-- 4. For each product, show the product name, name of the supplier company, 
-- and city of the supplier company, for products that are out of stock.

-- 5. Show the suppliers with a visible value in the Homepage field.
SELECT * FROM suppliers WHERE HomePage NOT LIKE "";

-- 6. Find the total units in stock for products whose category description is "Prepared meats".
SELECT COUNT(products.UnitsInStock), categories.Description FROM products
JOIN categories ON products.CategoryID = categories.CategoryID
WHERE categories.Description = "Prepared meats";

-- 7. For each customer, find the total number of orders, only for those customers from 
-- Germany, Canada, or Venezuela who have a visible value in the Region field.
SELECT customers.*, COUNT(orderdetails.Quantity) FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
JOIN orderdetails ON orders.OrderID = orderdetails.OrderID
WHERE customers.Country IN("Germany", "Canada", "Venezuela") AND customers.Region NOT LIKE ""
GROUP BY customers.CustomerID;

-- 8. For each customer, order made, and associated employee, show the distinct products (product ID).
SELECT customers.CustomerID, orders.OrderID, employees.EmployeeID FROM customers 
JOIN orders ON customers.CustomerID = orders.CustomerID 
JOIN employees ON orders.EmployeeID = employees.EmployeeID
GROUP BY customers.CustomerID;

-- 9. Find the average age of female sales representatives from London and Redmond.
SELECT LastName, FirstName, City, BirthDate FROM employees 
WHERE TitleOfCourtesy LIKE "Ms%" AND City = "London" OR "Redmond" AND Title = "Sales Represantive" 
HAVING AVG(BirthDate); 

-- 10. For each city, show the number of employees older than 66 years. (2022 - 66 = 1956)
SELECT LastName, Firstname, City, BirthDate 
FROM northwind.employees WHERE BirthDate <= "1956-01-01"
GROUP BY City;