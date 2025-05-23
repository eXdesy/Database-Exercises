-- 1. Insert multiple employees with the same EmployeeID = 0.
INSERT INTO employees (EmployeeID, LastName, FirstName)
	VALUES 
		(0, 'Fernández', 'Alberto'),
		(0, 'Pérez', 'JoseMari'),
		(0, 'Márquez', 'Jouse');

-- 2. Insert multiple categories with the same CategoryID = 0.
INSERT INTO categories (CategoryID, CategoryName, Description, Picture)
	VALUES 
		(0, 'Hola', 'Mundo', NULL),
		(0, 'Base de Datos', 'MySQL', NULL),
		(0, 'Profesor', 'Jorge Juan', NULL),
		(0, 'No sé', 'qué más poner', NULL);

-- 3. Insert a single row using SET syntax.
INSERT INTO categories
	SET CategoryName = 'Ejemplo1', Description = 'Desc', Picture = NULL;

-- 4. Insert rows into employees table by selecting from itself.
INSERT INTO employees (LastName, FirstName)
SELECT LastName, FirstName
FROM employees
WHERE EmployeeID >= 5 
	AND EmployeeID <= 9;

-- 5. Use REPLACE INTO to update or insert a record.
REPLACE INTO employees (EmployeeID, LastName, FirstName)
	VALUES (59, 'Fer', 'Alb');

-- 6. Delete categories where CategoryID > 8.
DELETE FROM categories
WHERE CategoryID > 8;

-- 7. Update category name to 'Bebidas' for the category with the highest ID.
UPDATE categories
SET CategoryName = 'Bebidas'
WHERE CategoryID = (
	SELECT MAX(CategoryID) 
    FROM categories
    );

-- 8. Update the last category (by ID descending) to 'Comida del mar'.
UPDATE categories
SET CategoryName = 'Comida del mar'
ORDER BY CategoryID DESC
LIMIT 1;
