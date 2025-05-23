-- 1. Create a routine that takes an integer as input. The routine returns three output variables:
-- the number itself, the number squared, and the number cubed.
DELIMITER $$
DROP PROCEDURE IF EXISTS get_powers$$
CREATE PROCEDURE get_powers(
	IN n INT,
    OUT original INT,
    OUT squared INT,
    OUT cubed INT
)
BEGIN
	SET original = n;
	SET squared = n * n;
	SET cubed = n * n * n;
END$$
DELIMITER ;

-- 2. Create a routine that receives a category ID and returns its description.
DELIMITER $$
DROP PROCEDURE IF EXISTS get_powers$$
CREATE PROCEDURE get_powers(
	IN n INT,
    OUT original INT,
    OUT squared INT,
    OUT cubed INT
)
BEGIN
	SET original = n;
	SET squared = n * n;
	SET cubed = n * n * n;
END$$
DELIMITER ;

-- 3. Create a routine that receives a letter and a number. The routine must return a string where the letter 
-- is repeated as many times as the number indicates. It must validate the number: if it is negative or zero, 
-- it should return a string with only the letter.
DELIMITER $$
DROP PROCEDURE IF EXISTS repeat_letter$$
CREATE PROCEDURE repeat_letter(
	IN input_letter CHAR(1),
	IN repeat_count INT,
	OUT result VARCHAR(255)
)
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE output_str VARCHAR(255) DEFAULT '';
    
	IF repeat_count <= 0 THEN
		SET result = input_letter;
	ELSE
		WHILE i < repeat_count DO
			SET output_str = CONCAT(output_str, input_letter);
			SET i = i + 1;
		END WHILE;
		SET result = output_str;
	END IF;
END$$
DELIMITER ;

-- 4. Create a routine that sums the unit prices of all products. The routine MUST NOT use a SQL statement 
-- with the SUM operator, but must instead retrieve each product's unit price iteratively and sum them up.
-- The routine returns the total in an output variable. Keep in mind that product IDs go from 1 to 77.
-- NOTE: this can be done without a cursor, but you're free to use one if preferred.
DELIMITER $$
DROP PROCEDURE IF EXISTS manual_sum_prices$$
CREATE PROCEDURE manual_sum_prices(
	OUT total_price DECIMAL(10,2)
)
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE current_price DECIMAL(10,2);
	DECLARE temp_total DECIMAL(10,2) DEFAULT 0;

	WHILE i <= 77 DO
		SELECT UnitPrice INTO current_price
		FROM Products
		WHERE ProductID = i;

		IF current_price IS NOT NULL THEN
			SET temp_total = temp_total + current_price;
		END IF;

		SET i = i + 1;
	END WHILE;

	SET total_price = temp_total;
END$$
DELIMITER ;
