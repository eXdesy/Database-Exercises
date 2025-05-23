-- Create a database called MANUFACTURERS to store manufacturers and their products.
CREATE DATABASE MANUFACTURERS;
USE MANUFACTURERS;

-- Table: Manufacturers
-- - manufacturer_id: integer, primary key
-- - manufacturer_name: varchar(255), not null
CREATE TABLE Manufacturers (
  manufacturer_id INTEGER PRIMARY KEY,
  manufacturer_name VARCHAR(255) NOT NULL
) ENGINE=INNODB;

-- Table: Products
-- - product_id: integer, primary key
-- - product_name: varchar(255), not null
-- - product_price: decimal, not null
-- - product_manufacturer_id: integer, foreign key to Manufacturers(manufacturer_id)
CREATE TABLE Products (
  product_id INTEGER PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  product_price DECIMAL NOT NULL,
  product_manufacturer_id INTEGER NOT NULL,
  FOREIGN KEY (product_manufacturer_id) REFERENCES Manufacturers(manufacturer_id)
) ENGINE=INNODB;


-- Insert manufacturers.
INSERT INTO Manufacturers (manufacturer_id, manufacturer_name) 
	VALUES (1, 'Sony');
INSERT INTO Manufacturers (manufacturer_id, manufacturer_name) 
	VALUES (2, 'Creative Labs');
INSERT INTO Manufacturers (manufacturer_id, manufacturer_name) 
	VALUES (3, 'Hewlett-Packard');
INSERT INTO Manufacturers (manufacturer_id, manufacturer_name) 
	VALUES (4, 'Iomega');
INSERT INTO Manufacturers (manufacturer_id, manufacturer_name) 
	VALUES (5, 'Fujitsu');
INSERT INTO Manufacturers (manufacturer_id, manufacturer_name) 
	VALUES (6, 'Winchester');

-- Insert products.
INSERT INTO Products (product_id, product_name, product_price, product_manufacturer_id) 
	VALUES (1, 'Hard drive', 240, 5);
INSERT INTO Products (product_id, product_name, product_price, product_manufacturer_id) 
	VALUES (2, 'Memory', 120, 6);
INSERT INTO Products (product_id, product_name, product_price, product_manufacturer_id) 
	VALUES (3, 'ZIP drive', 150, 4);
INSERT INTO Products (product_id, product_name, product_price, product_manufacturer_id) 
	VALUES (4, 'Floppy disk', 5, 6);
INSERT INTO Products (product_id, product_name, product_price, product_manufacturer_id) 
	VALUES (5, 'Monitor', 240, 1);
INSERT INTO Products (product_id, product_name, product_price, product_manufacturer_id) 
	VALUES (6, 'DVD drive', 180, 2);
INSERT INTO Products (product_id, product_name, product_price, product_manufacturer_id) 
	VALUES (7, 'CD drive', 90, 2);
INSERT INTO Products (product_id, product_name, product_price, product_manufacturer_id) 
	VALUES (8, 'Printer', 270, 3);
INSERT INTO Products (product_id, product_name, product_price, product_manufacturer_id) 
	VALUES (9, 'Toner cartridge', 66, 3);
INSERT INTO Products (product_id, product_name, product_price, product_manufacturer_id) 
	VALUES (10, 'DVD burner', 180, 2);


-- 1. Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO Products (product_id, product_name, product_price, product_manufacturer_id) 
	VALUES (11, 'Loudspeakers', 70, 2);

-- 2. Update the name of the product with ID 8 to "Laser Printer".
UPDATE Products 
SET product_name = 'Laser Printer' 
WHERE product_id = 8;

-- 3. Apply a 10% discount to all products.
UPDATE Products 
SET product_price = product_price * 0.90;

-- 4. Apply a 10% discount to all products with a price of $120 or more.
UPDATE Products 
SET product_price = product_price * 0.90
WHERE product_price >= 120;
