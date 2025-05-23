-- METHOD 1:
-- Query to obtain the IDs of orders associated with the employee Nancy Davolio.
SELECT OrderID, LastName, FirstName
FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE FirstName = 'Nancy' 
	AND LastName = 'Davolio';

-- METHOD 2:
-- This method is better because it makes it clear which table each column belongs to.
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Employees.FirstName = 'Nancy' 
	AND Employees.LastName = 'Davolio';

-- METHOD 3:
-- This method is the same as the previous one but with shortened table aliases.
SELECT ord.OrderID, emp.LastName, emp.FirstName
FROM Orders AS ord
JOIN Employees AS emp ON ord.EmployeeID = emp.EmployeeID
WHERE emp.FirstName = 'Nancy' 
	AND emp.LastName = 'Davolio';

-- 2. Retrieve all fields from the Orders table, also showing the customer company name.
SELECT Orders.*, Customers.CompanyName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- 3. For each product, show the product name and the name of the company that supplies it.
SELECT Products.ProductName, Suppliers.CompanyName
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

-- 4. Retrieve all fields from the OrderDetails table, also showing the customer ID.
SELECT OrderDetails.*, Orders.CustomerID
FROM OrderDetails
JOIN Orders ON Orders.OrderID = OrderDetails.OrderID;
