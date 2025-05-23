-- Create a database called PARTS to store products from various providers.
CREATE DATABASE PARTS;
USE PARTS;

-- Table: Parts
-- - part_id: integer, primary key, not null
-- - part_name: text, not null
CREATE TABLE Parts (
	part_id INTEGER PRIMARY KEY NOT NULL,
	part_name TEXT NOT NULL
);

-- Table: Suppliers
-- - supplier_id: variable-length string (max 40), primary key, not null
-- - supplier_name: text, not null
CREATE TABLE Suppliers (
	supplier_id VARCHAR(40) PRIMARY KEY NOT NULL,
	supplier_name TEXT NOT NULL
);

-- Table: Providers
-- - Part: integer, foreign key to Parts(part_id)
-- - Supplier: string(40), foreign key to Supplier(supplier_id)
-- - Price: integer, not null
-- - Primary key: (Part, Supplier)
CREATE TABLE Providers (
	part_id INTEGER NOT NULL,
	supplier_id VARCHAR(40) NOT NULL,
	price INTEGER NOT NULL,
	PRIMARY KEY (Part, Supplier),
	FOREIGN KEY (Part) REFERENCES Parts(part_id),
	FOREIGN KEY (Supplier) REFERENCES Suppliers(supplier_id)
);


-- Insert parts.
INSERT INTO Parts (part_id, part_name) 
	VALUES (1, 'Gears');
INSERT INTO Parts (part_id, part_name) 
	VALUES (2, 'Screws');
INSERT INTO Parts (part_id, part_name) 
	VALUES (3, 'Nuts');
INSERT INTO Parts (part_id, part_name) 
	VALUES (4, 'Nails');

-- Insert suppliers.
INSERT INTO Suppliers (supplier_id, supplier_name) 
	VALUES ('HAL', 'Clarke Enterprises');
INSERT INTO Suppliers (supplier_id, supplier_name) 
	VALUES ('RBT', 'Susan Calvin Corporation');
INSERT INTO Suppliers (supplier_id, supplier_name) 
	VALUES ('TNBC', 'Skellington Supplies');

-- Insert suppliers providers
INSERT INTO Providers (part_id, supplier_id, price) 
	VALUES (1, 'HAL', 10);
INSERT INTO Providers (part_id, supplier_id, price) 
	VALUES (1, 'RBT', 15);
INSERT INTO Providers (part_id, supplier_id, price) 
	VALUES (2, 'HAL', 20);
INSERT INTO Providers (part_id, supplier_id, price) 
	VALUES (2, 'RBT', 15);
INSERT INTO Providers (part_id, supplier_id, price) 
	VALUES (2, 'TNBC', 14);
INSERT INTO Providers (part_id, supplier_id, price) 
	VALUES (3, 'RBT', 50);
INSERT INTO Providers (part_id, supplier_id, price) 
	VALUES (3, 'TNBC', 45);
INSERT INTO Providers (part_id, supplier_id, price) 
	VALUES (4, 'HAL', 5);
INSERT INTO Providers (part_id, supplier_id, price) 
	VALUES (4, 'RBT', 7);


-- 1. Add a new entry indicating that "Skellington Supplies" (code "TNBC") will supply gearwheels (code "1") for 7 cents each.
INSERT INTO Providers (part_id, supplier_id, price) 
	VALUES (1, 'TNBC', 7);

-- 2. Increase all prices by one cent.
UPDATE Providers 
SET price = price + 1;

-- 3. Update the database to reflect that "Susan Calvin Corporation" (code "RBT") will no longer supply nails (code 4).
DELETE FROM Providers
WHERE supplier_id = 'RBT' 
	AND part_id = 4;

-- 4. Update the database to reflect that "Susan Calvin Corporation" (code "RBT") will no longer supply any parts (the supplier should remain in the database).
DELETE FROM Providers
WHERE supplier_id = 'RBT';
