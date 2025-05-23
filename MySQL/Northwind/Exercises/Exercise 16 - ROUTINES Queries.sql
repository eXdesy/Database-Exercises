-- 0. Same as above, but also concatenate the employee's age (calculated from birth date). Name it getFullNameWithAge.
DELIMITER $$;
DROP FUNCTION IF EXISTS getFullNameWithAge $$
CREATE FUNCTION getFullNameWithAge (employee_id INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE lastName, firstName VARCHAR(30);
	DECLARE birth DATE;
	DECLARE age INT;

	SELECT FirstName, LastName, BirthDate INTO firstName, lastName, birth
	FROM Employees
	WHERE EmployeeID = employee_id;

	SET age = TIMESTAMPDIFF(YEAR, birth, CURDATE());

	RETURN CONCAT(firstName, ' ', lastName, ' (Age: ', age, ')');
END$$
DELIMITER ;

-- Example:
SELECT getFullNameWithAge(6);

-- 1. Create a procedure that receives an employee ID and returns first and last name using output variables.
DELIMITER $$;
DROP PROCEDURE IF EXISTS getEmployeeName $$
CREATE PROCEDURE getEmployeeName (
	IN emp_id INT,
	OUT firstName VARCHAR(50),
	OUT lastName VARCHAR(50)
)
BEGIN
	SELECT FirstName, LastName INTO firstName, lastName
	FROM Employees
	WHERE EmployeeID = emp_id;
END$$
DELIMITER ;

-- Example:
SET @first = '', @last = '';
CALL getEmployeeName(6, @first, @last);
SELECT @first AS FirstName, @last AS LastName;

-- 1. Create a procedure that receives an employee ID and returns first and last name using output variables.
DELIMITER $$;
DROP PROCEDURE IF EXISTS getEmployeeName $$
CREATE PROCEDURE getEmployeeName (
	IN emp_id INT,
	OUT firstName VARCHAR(50),
	OUT lastName VARCHAR(50)
)
BEGIN
	SELECT FirstName, LastName INTO firstName, lastName
	FROM Employees
	WHERE EmployeeID = emp_id;
END$$
DELIMITER ;

-- Example:
SET @first = '', @last = '';
CALL getEmployeeName(6, @first, @last);
SELECT @first AS FirstName, @last AS LastName;

-- 3. Same as above, but return the full name of the customer who placed the order.
DELIMITER $$;
DROP PROCEDURE IF EXISTS getOrderCustomer $$
CREATE PROCEDURE getOrderCustomer (
	IN order_id INT,
	OUT customer_name VARCHAR(100)
)
BEGIN
	SELECT CompanyName INTO customer_name
	FROM Customers
	WHERE CustomerID = (
		SELECT CustomerID
		FROM Orders
		WHERE OrderID = order_id
	);
END$$
DELIMITER ;

-- Example:
SET @cust = '';
CALL getOrderCustomer(10248, @cust);
SELECT @cust;

-- 4. Create a procedure that returns the number of orders placed by employee ID 3.
DELIMITER $$;
DROP PROCEDURE IF EXISTS getEmployeeOrdersCount $$
CREATE PROCEDURE getEmployeeOrdersCount (
	OUT total_orders INT
)
BEGIN
	SELECT COUNT(*) INTO total_orders
	FROM Orders
	WHERE EmployeeID = 3;
END$$
DELIMITER ;

-- Example:
SET @count = 0;
CALL getEmployeeOrdersCount(@count);
SELECT @count;

-- 5. Create a procedure that receives two employee names and returns the one with the most orders.
DELIMITER $$;
DROP PROCEDURE IF EXISTS compareEmployeeOrders $$
CREATE PROCEDURE compareEmployeeOrders (
	IN name1 VARCHAR(50),
	IN name2 VARCHAR(50),
	OUT result_name VARCHAR(100)
)
BEGIN
	DECLARE id1 INT;
	DECLARE id2 INT;
	DECLARE count1 INT;
	DECLARE count2 INT;

	SELECT EmployeeID INTO id1 FROM Employees WHERE FirstName = name1 LIMIT 1;
	SELECT EmployeeID INTO id2 FROM Employees WHERE FirstName = name2 LIMIT 1;

	SELECT COUNT(*) INTO count1 FROM Orders WHERE EmployeeID = id1;
	SELECT COUNT(*) INTO count2 FROM Orders WHERE EmployeeID = id2;

	IF count1 > count2 THEN
		SET result_name = name1;
	ELSEIF count2 > count1 THEN
		SET result_name = name2;
	ELSE
		SET result_name = CONCAT(name1, ' and ', name2, ' have the same number of orders');
	END IF;
END$$
DELIMITER ;

-- Example:
SET @result = '';
CALL compareEmployeeOrders('Nancy', 'Andrew', @result);
SELECT @result;

-- 6. Create a procedure that receives an Order ID and returns the employee who handled it (as full name).
DELIMITER $$;
DROP PROCEDURE IF EXISTS getEmployeeByOrderID $$
CREATE PROCEDURE getEmployeeByOrderID (
	IN order_id INT,
	OUT employee_full_name VARCHAR(100)
)
BEGIN
	SELECT CONCAT(e.FirstName, ' ', e.LastName) INTO employee_full_name
	FROM Orders o
	JOIN Employees e ON o.EmployeeID = e.EmployeeID
	WHERE o.OrderID = order_id;
END$$
DELIMITER ;

-- Example:
SET @emp_name = '';
CALL getEmployeeByOrderID(10248, @emp_name);
SELECT @emp_name;

-- 7. Create a procedure that receives an Order ID and returns the customer who placed it.
DELIMITER $$;
DROP PROCEDURE IF EXISTS getCustomerByOrderID $$
CREATE PROCEDURE getCustomerByOrderID (
	IN order_id INT,
	OUT customer_name VARCHAR(100)
)
BEGIN
	SELECT c.CompanyName INTO customer_name
	FROM Orders o
	JOIN Customers c ON o.CustomerID = c.CustomerID
	WHERE o.OrderID = order_id;
END$$
DELIMITER ;

-- Example:
SET @cust_name = '';
CALL getCustomerByOrderID(10248, @cust_name);
SELECT @cust_name;

-- 7. Create a procedure that receives an Order ID and returns the customer who placed it.
DELIMITER $$;
DROP PROCEDURE IF EXISTS getCustomerByOrderID $$
CREATE PROCEDURE getCustomerByOrderID (
	IN order_id INT,
	OUT customer_name VARCHAR(100)
)
BEGIN
	SELECT c.CompanyName INTO customer_name
	FROM Orders o
	JOIN Customers c ON o.CustomerID = c.CustomerID
	WHERE o.OrderID = order_id;
END$$
DELIMITER ;

-- Example:
SET @cust_name = '';
CALL getCustomerByOrderID(10248, @cust_name);
SELECT @cust_name;

-- 8. Create a procedure that returns the number of orders made by employee with ID = 3.
DELIMITER $$;
DROP PROCEDURE IF EXISTS getOrdersCountByEmployee3 $$
CREATE PROCEDURE getOrdersCountByEmployee3 (
	OUT total INT
)
BEGIN
	SELECT COUNT(*) INTO total
	FROM Orders
	WHERE EmployeeID = 3;
END$$
DELIMITER ;

-- Example:
SET @total = 0;
CALL getOrdersCountByEmployee3(@total);
SELECT @total;

-- 9. Create a procedure that receives two employee names and returns the one with the most orders.
DELIMITER $$;
DROP PROCEDURE IF EXISTS getMostActiveEmployee $$
CREATE PROCEDURE getMostActiveEmployee (
	IN emp1 VARCHAR(50),
	IN emp2 VARCHAR(50),
	OUT most_active VARCHAR(100)
)
BEGIN
	DECLARE id1, id2, count1, count2 INT;

	SELECT EmployeeID INTO id1 FROM Employees WHERE FirstName = emp1 LIMIT 1;
	SELECT EmployeeID INTO id2 FROM Employees WHERE FirstName = emp2 LIMIT 1;

	SELECT COUNT(*) INTO count1 FROM Orders WHERE EmployeeID = id1;
	SELECT COUNT(*) INTO count2 FROM Orders WHERE EmployeeID = id2;

	IF count1 > count2 THEN
		SET most_active = emp1;
	ELSEIF count2 > count1 THEN
		SET most_active = emp2;
	ELSE
		SET most_active = CONCAT(emp1, ' and ', emp2, ' have the same number of orders');
	END IF;
END$$
DELIMITER ;

-- Example:
SET @winner = '';
CALL getMostActiveEmployee('Nancy', 'Andrew', @winner);
SELECT @winner;

-- 10. Modify previous routine to allow employee IDs as input (instead of names).
DELIMITER $$;
DROP PROCEDURE IF EXISTS getMostActiveEmployeeByID $$
CREATE PROCEDURE getMostActiveEmployeeByID (
	IN id1 INT,
	IN id2 INT,
	OUT result TEXT
)
BEGIN
	DECLARE count1, count2 INT;
	DECLARE name1, name2 VARCHAR(100);

	SELECT COUNT(*) INTO count1 FROM Orders WHERE EmployeeID = id1;
	SELECT COUNT(*) INTO count2 FROM Orders WHERE EmployeeID = id2;

	SELECT CONCAT(FirstName, ' ', LastName) INTO name1 FROM Employees WHERE EmployeeID = id1;
	SELECT CONCAT(FirstName, ' ', LastName) INTO name2 FROM Employees WHERE EmployeeID = id2;

	IF count1 > count2 THEN
		SET result = name1;
	ELSEIF count2 > count1 THEN
		SET result = name2;
	ELSE
		SET result = CONCAT(name1, ' and ', name2, ' have the same number of orders');
	END IF;
END$$
DELIMITER ;

-- Example:
SET @result = '';
CALL getMostActiveEmployeeByID(1, 2, @result);
SELECT @result;
