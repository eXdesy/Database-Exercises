-- 1. Create a table named CATEGORIES2 with exactly the same structure and data types as the CATEGORIES table.
CREATE TABLE categories2(
	CategoryID int NOT NULL,
    CategoryName varchar(25) NOT NULL,
	Description longtext,
	Picture longblob,
	PRIMARY KEY (CategoryID),
	KEY Categories_CategoryName (CategoryName)
) ENGINE=InnoDB;

-- 2. Fill the new table with all the data from the original table, using a single SQL statement 
-- (you cannot use the reserved word VALUES).
INSERT INTO categories2 SET CategoryID=1, CategoryName='Beverages', Description='Soft drinks, coffees, teas, beers, and ales';
INSERT INTO categories2 SET CategoryID=2, CategoryName='Condiments', Description='Sweet and savory sauces, relishes, spreads, and seasonings';
INSERT INTO categories2 SET CategoryID=3, CategoryName='Confections', Description='Desserts, candies, and sweet breads';
INSERT INTO categories2 SET CategoryID=4, CategoryName='Dairy Products', Description='Cheeses';
INSERT INTO categories2 SET CategoryID=5, CategoryName='Grains/Cereals', Description='Breads, crackers, pasta, and cereal';
INSERT INTO categories2 SET CategoryID=6, CategoryName='Meat/Poultry', Description='Prepared meats';
INSERT INTO categories2 SET CategoryID=7, CategoryName='Produce', Description='Dried fruit and bean curd';
INSERT INTO categories2 SET CategoryID=8, CategoryName='Seafood', Description='Seaweed and fish';

-- 3. Print (without repeating) the names of those cities that have FEWER customers than the number of customers in Buenos Aires minus those in Barcelona.

-- 4. Print the products whose unit price and units in stock are below the average unit price and average stock units.
SELECT * FROM products WHERE UnitPrice AND UnitsInStock < (SELECT AVG(UnitPrice) AND AVG(UnitsInStock) FROM products);

-- 5. Print the first and last names of those employees who have fewer orders than the total number of orders from employee 1 and employee 4 combined.

-- 6. Delete from the CATEGORIES2 table those categories whose description contains the words ‘meats’, ‘candies’ or ‘fish’.
DELETE FROM categories2 WHERE Description="%meats%";
DELETE FROM categories2 WHERE Description="%candies%";
DELETE FROM categories2 WHERE Description="%fish%";
