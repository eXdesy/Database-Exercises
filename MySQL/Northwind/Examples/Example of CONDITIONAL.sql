-- ------ IF-THEN-ELSE CONDITIONAL ------ --
DELIMITER $$;
DROP PROCEDURE IF EXISTS is_greater $$;
CREATE PROCEDURE is_greater (IN a INT, IN b INT, OUT message VARCHAR(30))
BEGIN
	IF a > b THEN
		SET message = 'The first is greater';
	ELSEIF a < b THEN
		SET message = 'The second is greater';
	ELSE
		SET message = 'They are equal';
	END IF;
END $$;
DELIMITER ;

-- Example:
SET @x = 3;
SET @y = 13;
SET @res = '';
CALL is_greater(@x, @y, @res);
SELECT @res;