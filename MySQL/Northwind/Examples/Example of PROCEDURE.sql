-- ------ BASIC PROCEDURES ------ --
DELIMITER $$;
DROP PROCEDURE IF EXISTS hello_world$$;
CREATE PROCEDURE Northwind.hello_world()
BEGIN
	SELECT 'Hello world';
END$$;
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS greet$$;
CREATE PROCEDURE Northwind.greet()
BEGIN
	SELECT 'Good evening';
END$$;
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS show_version$$;
CREATE PROCEDURE Northwind.show_version()
BEGIN
	SELECT VERSION();
END$$;
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS show_date$$;
CREATE PROCEDURE Northwind.show_date()
BEGIN
	SELECT CURDATE();
END$$;
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS generate_random$$;
CREATE PROCEDURE Northwind.generate_random()
BEGIN
	SELECT FLOOR(RAND() * 10);
END$$;
DELIMITER ;

-- ------ BASIC FUNCTIONS ------ --
DELIMITER $$;
DROP FUNCTION IF EXISTS add_numbers$$;
CREATE FUNCTION Northwind.add_numbers(n1 INT, n2 INT)
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (n1 + n2);
END$$;
DELIMITER ;

DELIMITER $$;
DROP FUNCTION IF EXISTS to_upper$$;
CREATE FUNCTION Northwind.to_upper(name VARCHAR(100))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	RETURN UPPER(name);
END$$;
DELIMITER ;

-- Example:
CALL hello_world();
CALL greet();
SHOW CREATE PROCEDURE hello_world;
CALL show_version();
CALL show_date();
CALL generate_random();
SELECT add_numbers(2.7, 7);
SELECT to_upper("Alberto");

-- ------ ADD TWO NUMBERS (PROCEDURE) ------ --
DELIMITER $$;
DROP PROCEDURE IF EXISTS sum_numbers$$;
CREATE PROCEDURE sum_numbers(IN a INT, IN b INT, OUT c INT)
BEGIN
	SET c = a + b;
END$$;
DELIMITER ;

-- Example:
SET @x = 3;
SET @y = 7;
SET @z = 0;
CALL sum_numbers(@x, @y, @z);
SELECT @z;

-- ------ SWAP TWO NUMBERS (INOUT) ------ --
DELIMITER $$;
DROP PROCEDURE IF EXISTS swap_numbers$$;
CREATE PROCEDURE swap_numbers(INOUT a INT, INOUT b INT)
BEGIN
	DECLARE tmp INT;
	SET tmp = a;
	SET a = b;
	SET b = tmp;
END$$;
DELIMITER ;

-- Example:
SET @x = 3;
SET @y = 7;
SELECT CONCAT(@x, ", ", @y);
CALL swap_numbers(@x, @y);
SELECT CONCAT(@x, ", ", @y);

-- ------ GREATER COMPARISON ------ --
DELIMITER $$;
DROP PROCEDURE IF EXISTS is_greater$$;
CREATE PROCEDURE is_greater(IN a INT, IN b INT, OUT message VARCHAR(30))
BEGIN
	IF a > b THEN
		SET message = "The first is greater";
	ELSEIF a < b THEN
		SET message = "The second is greater";
	ELSE
		SET message = "They are equal";
	END IF;
END$$;
DELIMITER ;

-- Example:
SET @x = 3;
SET @y = 13;
SET @res = '';
CALL is_greater(@x, @y, @res);
SELECT @res;
