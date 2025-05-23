-- 1. Show employee ID, first name and last name in uppercase using the 'to_upper' function.
-- Is a function or a procedure better? (Function is better for reusable transformations).
DELIMITER $$;
DROP PROCEDURE IF EXISTS show_employees_upper$$;
CREATE PROCEDURE Northwind.show_employees_upper()
BEGIN
	SELECT EmployeeID, to_upper(FirstName), to_upper(LastName)
	FROM Employees;
END$$;
DELIMITER ;

-- 2. Create a function 'multiply' that receives a float and an int, returns the product.
-- Use it to show product ID, name and profit (UnitPrice * UnitsInStock).
DELIMITER $$;
DROP FUNCTION IF EXISTS multiply$$;
CREATE FUNCTION Northwind.multiply(n1 FLOAT, n2 INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	RETURN (n1 * n2);
END$$;
DELIMITER ;

-- Example:
SELECT ProductID, ProductName, multiply(UnitPrice, UnitsInStock) AS profit
FROM Products;

-- 3. Create a function 'string_length' that receives a string and returns its length.
-- Use it to show employees' names and the length of each first name.
DELIMITER $$;
DROP FUNCTION IF EXISTS string_length$$;
CREATE FUNCTION Northwind.string_length(text VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN LENGTH(text);
END$$;
DELIMITER ;

-- Example:
SELECT FirstName, string_length(FirstName) AS name_length
FROM Employees;

-- 4. Create a function 'concat_with_underscore' that concatenates two strings with an underscore.
-- Use it to show employee ID and full name combined.
DELIMITER $$;
DROP FUNCTION IF EXISTS concat_with_underscore$$;
CREATE FUNCTION Northwind.concat_with_underscore(text1 VARCHAR(100), text2 VARCHAR(100))
RETURNS VARCHAR(201)
DETERMINISTIC
BEGIN
	RETURN CONCAT_WS('_', text1, text2);
END$$;
DELIMITER ;

-- Example:
SELECT EmployeeID, concat_with_underscore(FirstName, LastName) AS full_name
FROM Employees;
