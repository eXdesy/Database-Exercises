-- Create a database called WAREHOUSES to store information about warehouses and the boxes they contain.
CREATE DATABASE WAREHOUSES;
USE WAREHOUSES;

-- Table: Warehouses
-- - warehouse_id: integer, primary key, not null
-- - warehouse_location: varchar(255), not null
-- - warehouse_capacity: integer, not null
CREATE TABLE Warehouses (
   warehouse_id INTEGER PRIMARY KEY,
   warehouse_location VARCHAR(255) NOT NULL,
   warehouse_capacity INTEGER NOT NULL
) ENGINE=INNODB;

-- Table: Boxes
-- - box_id: varchar(255), primary key, not null
-- - box_contents: varchar(255), not null
-- - box_value: real, not null
-- - box_warehouse_id: integer, foreign key to Warehouses(warehouse_id)
CREATE TABLE Boxes (
   box_id VARCHAR(255) PRIMARY KEY,
   box_contents VARCHAR(255) NOT NULL,
   box_value REAL NOT NULL,
   box_warehouse_id INTEGER NOT NULL,
   FOREIGN KEY (box_warehouse_id) REFERENCES Warehouses(warehouse_id)
) ENGINE=INNODB;


-- Insert warehouses.
INSERT INTO Warehouses (warehouse_id, warehouse_location, warehouse_capacity) 
	VALUES (1, 'Chicago', 3);
INSERT INTO Warehouses (warehouse_id, warehouse_location, warehouse_capacity) 
	VALUES (2, 'Chicago', 4);
INSERT INTO Warehouses (warehouse_id, warehouse_location, warehouse_capacity) 
	VALUES (3, 'New York', 7);
INSERT INTO Warehouses (warehouse_id, warehouse_location, warehouse_capacity) 
	VALUES (4, 'Los Angeles', 2);
INSERT INTO Warehouses (warehouse_id, warehouse_location, warehouse_capacity) 
	VALUES (5, 'San Francisco', 8);

-- Insert boxes.
INSERT INTO Boxes (box_id, box_contents, box_value, box_warehouse_id) 
	VALUES ('0MN7', 'Rocks', 180, 3);
INSERT INTO Boxes (box_id, box_contents, box_value, box_warehouse_id) 
	VALUES ('4H8P', 'Rocks', 250, 1);
INSERT INTO Boxes (box_id, box_contents, box_value, box_warehouse_id) 
	VALUES ('4RT3', 'Scissors', 190, 4);
INSERT INTO Boxes (box_id, box_contents, box_value, box_warehouse_id) 
	VALUES ('7G3H', 'Rocks', 200, 1);
INSERT INTO Boxes (box_id, box_contents, box_value, box_warehouse_id) 
	VALUES ('8JN6', 'Papers', 75, 1);
INSERT INTO Boxes (box_id, box_contents, box_value, box_warehouse_id) 
	VALUES ('8Y6U', 'Papers', 50, 3);
INSERT INTO Boxes (box_id, box_contents, box_value, box_warehouse_id) 
	VALUES ('9J6F', 'Papers', 175, 2);
INSERT INTO Boxes (box_id, box_contents, box_value, box_warehouse_id) 
	VALUES ('LL08', 'Rocks', 140, 4);
INSERT INTO Boxes (box_id, box_contents, box_value, box_warehouse_id) 
	VALUES ('P0H6', 'Scissors', 125, 1);
INSERT INTO Boxes (box_id, box_contents, box_value, box_warehouse_id) 
	VALUES ('P2T6', 'Scissors', 150, 2);
INSERT INTO Boxes (box_id, box_contents, box_value, box_warehouse_id) 
	VALUES ('TU55', 'Papers', 90, 5);


-- 1. Create a new warehouse in New York with capacity for 3 boxes.
INSERT INTO Warehouses (warehouse_id, warehouse_location, warehouse_capacity) 
	VALUES (6, 'New York', 3);

-- 2. Create a new box with ID "H5RT", containing "Papers", valued at $200, and stored in warehouse 2.
INSERT INTO Boxes (box_id, box_contents, box_value, box_warehouse_id) 
	VALUES ('H5RT', 'Papers', 200, 2);

-- 3. Reduce the value of all boxes by 15%.
UPDATE Boxes 
SET box_value = box_value * 0.85;

-- 4. Apply a 20% reduction to boxes whose value is above the average.
UPDATE Boxes 
SET box_value = box_value * 0.80
WHERE box_value > (
    SELECT AVG(tmp.box_value)
    FROM (SELECT box_value FROM Boxes) AS tmp
);

-- 5. Delete all boxes with a value less than $100.
DELETE FROM Boxes 
WHERE box_value < 100;

-- 6. Delete all boxes stored in full (saturated) warehouses.
DELETE FROM Boxes
WHERE box_warehouse_id IN (
    SELECT warehouse_id
    FROM (
        SELECT w.warehouse_id
        FROM Warehouses w
        JOIN Boxes b ON w.warehouse_id = b.box_warehouse_id
        GROUP BY w.warehouse_id, w.warehouse_capacity
        HAVING COUNT(b.box_id) >= w.warehouse_capacity
    ) AS full_warehouses
);
