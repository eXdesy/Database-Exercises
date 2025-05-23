-- CREATE DATABASE:
-- https://www.mysqltutorial.org/mysql-create-database/
CREATE DATABASE Wishlist;
USE Wishlist;

-- CREATE TABLE:
-- https://www.mysqltutorial.org/mysql-create-table/
CREATE TABLE Lists(
	list_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    list_name VARCHAR(100) NOT NULL,
    list_price DECIMAL NOT NULL
);

-- INSERT TABLE:
INSERT INTO Lists(list_name, list_price) 
	VALUES('Nike-Brasilia',13);
INSERT INTO Lists(list_name, list_price) 
	VALUES('Nike-Elemental',18);
INSERT INTO Lists(list_name, list_price) 
	VALUES('Vans-Old Skool liii',30);

-- FOREING KEY:
-- https://www.mysqltutorial.org/mysql-foreign-key/

-- ALTER TABLE:
-- https://www.mysqltutorial.org/mysql-alter-table.aspx

-- AUTO_INCREMENT:
-- https://www.mysqltutorial.org/sql_autoincrement.asp
