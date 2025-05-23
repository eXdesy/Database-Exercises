-- 1. Procedure that receives a number and returns its square.
DELIMITER $$
DROP PROCEDURE IF EXISTS square_number $$
CREATE PROCEDURE square_number (IN a INT, OUT b INT)
BEGIN
	SET b = a * a;
END $$
DELIMITER ;

-- Example:
SET @x = 3;
SET @y = 0;
CALL square_number(@x, @y);
SELECT @y;

-- 2. Procedure that receives two numbers and raises the first to the power of the second.
DELIMITER $$
DROP PROCEDURE IF EXISTS power_number $$
CREATE PROCEDURE power_number (IN a INT, IN b INT, OUT c INT)
BEGIN
	SET c = POWER(a, b);
END $$
DELIMITER ;

-- Example:
SET @x = 3;
SET @y = 3;
SET @z = 0;
CALL power_number(@x, @y, @z);
SELECT @z;

-- 3. Procedure that receives two strings and concatenates them with an underscore.
DELIMITER $$
DROP PROCEDURE IF EXISTS concat_with_underscore $$
CREATE PROCEDURE concat_with_underscore (IN a VARCHAR(10), IN b VARCHAR(10), OUT c VARCHAR(20))
BEGIN
	SET c = CONCAT(a, '_', b);
END $$
DELIMITER ;

-- Example:
SET @x = 'Hello';
SET @y = 'World';
CALL concat_with_underscore(@x, @y, @z);
SELECT @z;

-- 4. Procedure that trims spaces at the beginning and end of a string.
DELIMITER $$
DROP PROCEDURE IF EXISTS trim_spaces $$
CREATE PROCEDURE trim_spaces (IN a VARCHAR(50), OUT b VARCHAR(50))
BEGIN
	SET b = TRIM(a);
END $$
DELIMITER ;

-- Example:
SET @x = '      Hello     ';
CALL trim_spaces(@x, @y);
SELECT @y;

-- 5. Procedure that receives a string and returns the same string in uppercase.
DELIMITER $$
DROP PROCEDURE IF EXISTS to_uppercase $$
CREATE PROCEDURE to_uppercase (IN a VARCHAR(50), OUT b VARCHAR(50))
BEGIN
	SET b = UPPER(a);
END $$
DELIMITER ;

-- Example:
SET @x = 'Hello World';
CALL to_uppercase(@x, @y);
SELECT @y;
