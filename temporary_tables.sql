-- Temporary Tables Exercises
USE employees;

-- 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.

CREATE TEMPORARY TABLE germain_1469.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no;

SELECT * 
FROM germain_1469.employees_with_departments;

-- a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE germain_1469.employees_with_departments
	ADD full_name VARCHAR(100);
	
SELECT * 
FROM germain_1469.employees_with_departments;	

-- b. Update the table so that full name column contains the correct data

UPDATE germain_1469.employees_with_departments 
	SET full_name = CONCAT(first_name, " ", last_name); 

SELECT * 
FROM germain_1469.employees_with_departments;	

-- c. Remove the first_name and last_name columns from the table.

ALTER TABLE germain_1469.employees_with_departments
	DROP COLUMN first_name;

ALTER TABLE germain_1469.employees_with_departments
	DROP COLUMN last_name;

SELECT * 
FROM germain_1469.employees_with_departments;	

-- d. What is another way you could have ended up with this same table?

SELECT dept_name, full_name
FROM germain_1469.employees_with_departments;	


-- 2. Create a temporary table based on the payment table from the sakila database. Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

SELECT * 
FROM payment;



