-- 1. Write a function that receives an integer and returns TRUE if the number is even, or FALSE otherwise.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_is_even$$;
CREATE FUNCTION func_is_even(num INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    IF MOD(num, 2) = 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END $$;
DELIMITER ;

-- Example:
SELECT func_is_even(4);

-- 2. Write a function that returns the value of the hypotenuse of a triangle based on the values of its sides.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_hypotenuse$$;
CREATE FUNCTION func_hypotenuse(side1 FLOAT, side2 FLOAT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN SQRT(POW(side1, 2) + POW(side2, 2));
END $$;
DELIMITER ;

-- Example:
SELECT func_hypotenuse(2, 2);

-- 3. Write a function that receives a numeric value representing a day of the week and returns the corresponding day name as a string.
-- Example: input 1 should return "Monday".
DELIMITER $$;
DROP FUNCTION IF EXISTS func_day_of_week$$;
CREATE FUNCTION func_day_of_week(day_num INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(30);
    CASE day_num
        WHEN 1 THEN SET result = 'Monday';
        WHEN 2 THEN SET result = 'Tuesday';
        WHEN 3 THEN SET result = 'Wednesday';
        WHEN 4 THEN SET result = 'Thursday';
        WHEN 5 THEN SET result = 'Friday';
        WHEN 6 THEN SET result = 'Saturday';
        WHEN 7 THEN SET result = 'Sunday';
        ELSE SET result = 'Invalid number';
    END CASE;
    RETURN result;
END $$;
DELIMITER ;

-- 4. Write a function that receives three real numbers as input and returns the largest of the three.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_max_of_three$$;
CREATE FUNCTION func_max_of_three(a INT, b INT, c INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE max_value INT;
    IF a > b AND a > c THEN
        SET max_value = a;
    ELSEIF b > a AND b > c THEN
        SET max_value = b;
    ELSE
        SET max_value = c;
    END IF;
    RETURN max_value;
END $$;
DELIMITER ;

-- Example:
SELECT func_max_of_three(1, 2, 3);
SELECT func_max_of_three(2, 1, 3);
SELECT func_max_of_three(3, 1, 2);

-- 5. Write a procedure that prints numbers from 1 to 10.
DELIMITER $$;
DROP PROCEDURE IF EXISTS print_loop$$;
CREATE PROCEDURE print_loop()
BEGIN
    DECLARE counter INT DEFAULT 0;
    loop_label: LOOP
        SET counter = counter + 1;
        SELECT counter;
        IF counter >= 10 THEN
            LEAVE loop_label;
        END IF;
    END LOOP;
END $$;
DELIMITER ;
CALL print_loop();

-- 6. Write a function that returns the number of years between two dates given as input. You can use DATEDIFF and TRUNCATE.
-- Example: 2018-01-01 and 2008-01-01 should return 10.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_years_between$$;
CREATE FUNCTION func_years_between(date1 DATE, date2 DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TRUNCATE(DATEDIFF(date1, date2) / 365, 0);
END $$;
DELIMITER ;

-- Example:
SELECT func_years_between('2018-01-01', '2008-01-01');

-- REPEAT loop: print odd numbers from 0 to 9.
DELIMITER $$;
DROP PROCEDURE IF EXISTS repeat_until$$;
CREATE PROCEDURE repeat_until()
BEGIN    
    DECLARE i INT DEFAULT 0;
    REPEAT        
        IF MOD(i, 2) != 0 THEN
            SELECT CONCAT(i, ' is odd');
        END IF;
        SET i = i + 1;
    UNTIL i >= 10
    END REPEAT;
END $$;
DELIMITER ;

-- Example:
CALL repeat_until();

-- WHILE loop: print odd numbers from 0 to 9.
DELIMITER $$;
DROP PROCEDURE IF EXISTS while_loop$$;
CREATE PROCEDURE while_loop()
BEGIN    
    DECLARE i INT DEFAULT 0;
    WHILE i < 10 DO        
        IF MOD(i, 2) <> 0 THEN
            SELECT CONCAT(i, ' is odd');
        END IF;
        SET i = i + 1;
    END WHILE;
END $$;
DELIMITER ;
CALL while_loop();

-- Sum of the first N natural numbers.
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_sum_first_n$$;
CREATE PROCEDURE proc_sum_first_n(IN n INT)
BEGIN    
    DECLARE i INT DEFAULT 1;
    DECLARE total INT DEFAULT 0;
    WHILE i <= n DO        
        SET total = total + i;
        SET i = i + 1;
    END WHILE;
    SELECT total;
END $$;
DELIMITER ;
CALL proc_sum_first_n(8);

-- Sum of the first N harmonic terms (1 + 1/2 + 1/3 + ... + 1/n).
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_sum_harmonics$$;
CREATE PROCEDURE proc_sum_harmonics(IN n INT)
BEGIN    
    DECLARE i INT DEFAULT 1;
    DECLARE total FLOAT DEFAULT 0;
    WHILE i <= n DO        
        SET total = total + 1/i;
        SET i = i + 1;
    END WHILE;
    SELECT total;
END $$;
DELIMITER ;
CALL proc_sum_harmonics(3);

-- 7. Write a function that receives a string and returns the same string without accented characters.
-- Example: input 'María' should return 'Maria'.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_remove_accents$$;
CREATE FUNCTION func_remove_accents(input_text VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    SET input_text = REPLACE(input_text, 'á', 'a');
    SET input_text = REPLACE(input_text, 'é', 'e');
    SET input_text = REPLACE(input_text, 'í', 'i');
    SET input_text = REPLACE(input_text, 'ó', 'o');
    SET input_text = REPLACE(input_text, 'ú', 'u');
    SET input_text = REPLACE(input_text, 'Á', 'A');
    SET input_text = REPLACE(input_text, 'É', 'E');
    SET input_text = REPLACE(input_text, 'Í', 'I');
    SET input_text = REPLACE(input_text, 'Ó', 'O');
    SET input_text = REPLACE(input_text, 'Ú', 'U');
    RETURN input_text;
END $$;
DELIMITER ;
SELECT func_remove_accents('María');
