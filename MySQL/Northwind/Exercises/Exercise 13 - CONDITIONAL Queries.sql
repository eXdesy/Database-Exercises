-- 1. Create a function that returns 1 if integer a is divisible by integer b, or 0 otherwise.
DELIMITER $$;
DROP FUNCTION IF EXISTS is_divisible $$;
CREATE FUNCTION is_divisible (a INT, b INT)
RETURNS INT
BEGIN
	DECLARE result INT DEFAULT 0;
	IF a % b = 0 THEN
		SET result = 1;
	END IF;
	RETURN result;
END $$;
DELIMITER ;

-- 2. Create a procedure that receives an integer between 1 and 12 and returns the corresponding month name.
-- If the input is not a valid month number, return: 'You're a bit distracted, enter a valid month.'.
DELIMITER $$;
DROP PROCEDURE IF EXISTS get_month_name $$;
CREATE PROCEDURE get_month_name (IN month_number INT, OUT message VARCHAR(50))
BEGIN
	CASE month_number
		WHEN 1 THEN SET message = 'JANUARY';
		WHEN 2 THEN SET message = 'FEBRUARY';
		WHEN 3 THEN SET message = 'MARCH';
		WHEN 4 THEN SET message = 'APRIL';
		WHEN 5 THEN SET message = 'MAY';
		WHEN 6 THEN SET message = 'JUNE';
		WHEN 7 THEN SET message = 'JULY';
		WHEN 8 THEN SET message = 'AUGUST';
		WHEN 9 THEN SET message = 'SEPTEMBER';
		WHEN 10 THEN SET message = 'OCTOBER';
		WHEN 11 THEN SET message = 'NOVEMBER';
		WHEN 12 THEN SET message = 'DECEMBER';
		ELSE SET message = 'You''re a bit distracted, enter a valid month';
	END CASE;
END $$;
DELIMITER ;

-- Example:
SET @x = 3;
SET @res = '';
CALL get_month_name(@x, @res);
SELECT @res;

-- 3. Create a procedure that receives a string and prints whether it is a palindrome.
-- It must read the same forwards and backwards (no need to remove spaces or punctuation).
DELIMITER $$;
DROP PROCEDURE IF EXISTS is_palindrome $$;
CREATE PROCEDURE is_palindrome (IN input_text VARCHAR(50), OUT result VARCHAR(20))
BEGIN
	IF input_text = REVERSE(input_text) THEN
		SET result = 'Is a palindrome';
	ELSE
		SET result = 'Not a palindrome';
	END IF;
END $$;
DELIMITER ;

-- Example:
SET @x = 'Dilior';
CALL is_palindrome(@x, @y);
SELECT @y;
