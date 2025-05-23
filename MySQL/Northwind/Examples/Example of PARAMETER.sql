-- ------ INPUT PARAMETER ------ --
DELIMITER $$ 
DROP PROCEDURE IF EXISTS proc_input $$
CREATE PROCEDURE proc_input (IN p INT)
BEGIN
	SET p = 5;
END $$ 
DELIMITER ;

-- Example:
SET @y = 0;
SELECT @y;
CALL proc_input(@y);
SELECT @y;

-- ------ OUTPUT PARAMETER ------ --
DELIMITER $$
DROP PROCEDURE IF EXISTS proc_output $$
CREATE PROCEDURE proc_output (OUT p INT)
BEGIN
	SET p = 5;
END $$
DELIMITER ;

-- Example:
SET @y = 0;
SELECT @y;
CALL proc_output(@y);
SELECT @y;

-- ------ INPUT/OUTPUT PARAMETER ------ --
DELIMITER $$
DROP PROCEDURE IF EXISTS proc_inout $$
CREATE PROCEDURE proc_inout (INOUT p INT)
BEGIN
	SET p = p + 1;
END $$
DELIMITER ;

-- Example:
SET @y = 0;
SELECT @y;
CALL proc_inout(@y);
SELECT @y;

-- ------ ADD TWO NUMBERS ------ --
DELIMITER $$
DROP PROCEDURE IF EXISTS sum_numbers $$
CREATE PROCEDURE sum_numbers (IN a INT, IN b INT, OUT c INT)
BEGIN
	SET c = a + b;
END $$
DELIMITER ;

-- Example:
SET @x = 3;
SET @y = 7;
SET @z = 0;
CALL sum_numbers(@x, @y, @z);
SELECT @z;

-- ------ SWAP TWO NUMBERS ------ --
DELIMITER $$
DROP PROCEDURE IF EXISTS swap_numbers $$
CREATE PROCEDURE swap_numbers (INOUT a INT, INOUT b INT)
BEGIN
	DECLARE tmp INT;
	SET tmp = a;
	SET a = b;
	SET b = tmp;
END $$
DELIMITER ;

-- Example:
SET @x = 3;
SET @y = 7;
SELECT CONCAT(@x, ',', @y);
CALL swap_numbers(@x, @y);
SELECT CONCAT(@x, ',', @y);
