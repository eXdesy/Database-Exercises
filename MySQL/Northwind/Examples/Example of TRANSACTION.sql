-- Use the database
USE northwind;

-- Drop table if it exists
DROP TABLE IF EXISTS trantest;

-- Create a table with a primary key and description
CREATE TABLE trantest (
    campo INT NOT NULL PRIMARY KEY,
    descripcion VARCHAR(50)
) ENGINE = InnoDB;

-- Insert initial records
INSERT INTO trantest 
VALUES (1, "First record"), 
       (2, "Second record"), 
       (3, "Third record");

-- Start a transaction
START TRANSACTION;

-- Insert new records inside transaction
INSERT INTO trantest 
VALUES (4, "Fourth record"), 
       (5, "Fifth record");

-- Rollback the transaction (undo changes)
ROLLBACK;

-- Create a savepoint
SAVEPOINT S1;

-- Insert more records
INSERT INTO trantest 
VALUES (6, "Sixth record"), 
       (7, "Seventh record");

-- Rollback to savepoint (undo just last two inserts)
ROLLBACK TO S1;

-- Start a new transaction
START TRANSACTION;

-- Re-insert the same records again
INSERT INTO trantest 
VALUES (6, "Sixth record"), 
       (7, "Seventh record");

-- Commit the transaction (make changes permanent)
COMMIT;
