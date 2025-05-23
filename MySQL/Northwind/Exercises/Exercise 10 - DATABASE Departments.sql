-- Create a database called DEPARTMENTS to store departments and their employees.
CREATE DATABASE DEPARTMENTS;
USE DEPARTMENTS;

-- Table: Departments
-- - department_id: integer, primary key
-- - department_name: varchar(255), not null
-- - department_budget: decimal, not null
CREATE TABLE Departments (
  department_id INTEGER PRIMARY KEY,
  department_name VARCHAR(255) NOT NULL,
  department_budget DECIMAL NOT NULL
) ENGINE=INNODB;

-- Table: Employees
-- - employee_ssn: integer, primary key
-- - employee_first_name: varchar(255), not null
-- - employee_last_name: varchar(255), not null
-- - employee_department_id: integer, foreign key to Departments(department_id)
CREATE TABLE Employees (
  employee_ssn INTEGER PRIMARY KEY,
  employee_first_name VARCHAR(255) NOT NULL,
  employee_last_name VARCHAR(255) NOT NULL,
  employee_department_id INTEGER NOT NULL,
  FOREIGN KEY (employee_department_id) REFERENCES Departments(department_id)
) ENGINE=INNODB;


-- Insert departments.
INSERT INTO Departments (department_id, department_name, department_budget) 
	VALUES (14, 'IT', 65000);
INSERT INTO Departments (department_id, department_name, department_budget) 
	VALUES (37, 'Accounting', 15000);
INSERT INTO Departments (department_id, department_name, department_budget) 
	VALUES (59, 'Human Resources', 240000);
INSERT INTO Departments (department_id, department_name, department_budget) 
	VALUES (77, 'Research', 55000);

-- Insert employees.
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (123234877, 'Michael', 'Rogers', 14);
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (152934485, 'Anand', 'Manikutty', 14);
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (222364883, 'Carol', 'Smith', 37);
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (326587417, 'Joe', 'Stevens', 37);
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (332154719, 'Mary-Anne', 'Foster', 14);
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (332569843, 'George', 'O''Donnell', 77);
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (546523478, 'John', 'Doe', 59);
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (631231482, 'David', 'Smith', 77);
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (654873219, 'Zacary', 'Efron', 59);
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (745685214, 'Eric', 'Goldsmith', 59);
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (845657245, 'Elizabeth', 'Doe', 14);
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (845657246, 'Kumar', 'Swamy', 14);


-- 1. Add a new department "Quality Assurance" with a budget of $40,000 and department ID 11.
INSERT INTO Departments (department_id, department_name, department_budget) 
	VALUES (11, 'Quality Assurance', 40000);

-- Add an employee "Mary Moore" to that department, with SSN 847219811.
INSERT INTO Employees (employee_ssn, employee_first_name, employee_last_name, employee_department_id) 
	VALUES (847219811, 'Mary', 'Moore', 11);

-- 2. Reduce all department budgets by 10%.
UPDATE Departments 
SET department_budget = department_budget * 0.90;

-- 3. Reassign all employees from department "Research" (ID 77) to department "IT" (ID 14).
UPDATE Employees 
SET employee_department_id = 14 
WHERE employee_department_id = 77;

-- 4. Delete all employees from the IT department (ID 14).
DELETE FROM Employees 
WHERE employee_department_id = 14;

-- 5. Delete all employees who work in departments with a budget of $60,000 or more.
DELETE FROM Employees 
WHERE employee_department_id IN (
    SELECT department_id 
    FROM Departments 
    WHERE department_budget >= 60000
);

-- 6. Delete all employees.
DELETE FROM Employees;
