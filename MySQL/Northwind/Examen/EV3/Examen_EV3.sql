-- 1. Create a routine that takes an integer as input. The routine returns three output variables:
-- the number itself, the number squared, and the number cubed.
DELIMITER //
CREATE PROCEDURE Ejercicio1(IN numeros INT, OUT cuadrado INT, OUT cubo INT, OUT numero INT)
BEGIN
	SET numero = numeros;
    SET cuadrado = numeros * numeros;
    SET cubo = numeros * numeros * numeros;
END//
DELIMITER ;

CALL Ejercicio1(5, @cuadrado, @cubo, @numero);
SELECT @numero, @cuadrado, @cubo;

-- 2. Create a routine that receives a category ID and returns its description.
DELIMITER //
CREATE PROCEDURE Ejercicio2(IN categoria_id INT, OUT descripcion VARCHAR(255))
BEGIN
    SELECT CategoryName INTO descripcion
    FROM Categories
    WHERE CategoryID = categoria_id;
END//
DELIMITER ;

CALL Ejercicio2(1, @descripcion);
SELECT @descripcion;

-- 3. Create a routine that receives a letter and a number. The routine must return a string where the letter 
-- is repeated as many times as the number indicates. It must validate the number: if it is negative or zero, 
-- it should return a string with only the letter.
DELIMITER //
CREATE PROCEDURE Ejercicio3(IN letra CHAR(1), IN numero INT, OUT cadena VARCHAR(255))
BEGIN
    IF numero <= 0 THEN
        SET cadena = letra;
    ELSE
        SET cadena = REPEAT(letra, numero);
    END IF;
END//
DELIMITER ;

CALL Ejercicio3('A', 3, @cadena);
SELECT @cadena;

-- 4. Create a routine that sums the unit prices of all products. The routine MUST NOT use a SQL statement 
-- with the SUM operator, but must instead retrieve each product's unit price iteratively and sum them up.
-- The routine returns the total in an output variable. Keep in mind that product IDs go from 1 to 77.
-- NOTE: this can be done without a cursor, but you're free to use one if preferred.
DELIMITER //
CREATE PROCEDURE Ejercicio4(OUT total DECIMAL(10,2))
BEGIN
    DECLARE producto_id INT DEFAULT 1;
    DECLARE precio_unitario DECIMAL(10,2) DEFAULT 0;
    SET total = 0;
    REPEAT
        SELECT UnitPrice INTO precio_unitario
        FROM Products
        WHERE ProductID = producto_id;
        SET total = total + precio_unitario;
        SET producto_id = producto_id + 1;
    UNTIL producto_id > 77 END REPEAT;
END//
DELIMITER ;

CALL Ejercicio4(@total);
SELECT @total;
