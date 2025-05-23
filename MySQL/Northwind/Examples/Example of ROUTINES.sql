-- Create a function that receives an employee ID and returns their last name. Name it getLastName.
DELIMITER $$;
DROP FUNCTION IF EXISTS getLastName $$;
CREATE FUNCTION getLastName (id INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	DECLARE lastName VARCHAR(30) DEFAULT '';
	SELECT LastName INTO lastName FROM Employees WHERE EmployeeID = id;
	RETURN lastName;
END$$
DELIMITER ;

-- Example:
SELECT getLastName(6);

-- Create a function that receives an employee ID and returns their full name (first + last). Name it getFullName.
DELIMITER $$;
DROP FUNCTION IF EXISTS getFullName $$
CREATE FUNCTION getFullName (employee_id INT)
RETURNS VARCHAR(61)
DETERMINISTIC
BEGIN
	DECLARE lastName, firstName VARCHAR(30) DEFAULT '';
	SELECT LastName, FirstName INTO lastName, firstName FROM Employees WHERE EmployeeID = employee_id;
	RETURN CONCAT(firstName, ' ', lastName);
END$$
DELIMITER ;

-- Example:
SELECT getFullName(6);
