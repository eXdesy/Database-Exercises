-- 1. From the Orders table, for each employee, print the employee ID and the number of orders.
-- Show employee ID as EMPLOYEE_ID and number of orders as NUM_ORDERS.
SELECT EmployeeID AS EMPLOYEE_ID, 
	COUNT(OrderID) AS NUM_ORDERS
FROM Orders
GROUP BY EmployeeID;

-- 2. From the OrderDetails table, for each order, print the order ID and the total quantity of units.
SELECT OrderID, 
	SUM(Quantity) AS TOTAL_UNITS
FROM OrderDetails
GROUP BY OrderID;

-- 3. Repeat the previous query, but only show orders with a total quantity less than 50.
SELECT OrderID, 
	SUM(Quantity) AS TOTAL_UNITS
FROM OrderDetails
GROUP BY OrderID
HAVING TOTAL_UNITS < 50;

-- 4. From the Employees table, for each country, print the number of employees with the title "Sales Representative".
SELECT Country, 
	COUNT(*) AS NUM_SALES_REPRESENTATIVES
FROM Employees
WHERE Title = 'Sales Representative'
GROUP BY Country;

-- 5. From the Employees table, for each country, print the number of employees whose title is NOT "Sales Representative".
SELECT Country, 
	COUNT(*) AS NUM_NON_SALES_REPRESENTATIVES
FROM Employees
WHERE Title <> 'Sales Representative'
GROUP BY Country;
