-- Temporary Tables Exercises
USE employees;

-- 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.

CREATE TEMPORARY TABLE germain_1469.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no; 
-- Created temp table with name employees_with_departments

SELECT * 
FROM germain_1469.employees_with_departments;

-- a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE germain_1469.employees_with_departments
	ADD full_name VARCHAR(100); -- Add column
	
SELECT * 
FROM germain_1469.employees_with_departments;	

-- b. Update the table so that full name column contains the correct data

UPDATE germain_1469.employees_with_departments 
	SET full_name = CONCAT(first_name, " ", last_name); -- Add data to new column

SELECT * 
FROM germain_1469.employees_with_departments;	

-- c. Remove the first_name and last_name columns from the table.

ALTER TABLE germain_1469.employees_with_departments
	DROP COLUMN first_name; -- Remove first_name column

ALTER TABLE germain_1469.employees_with_departments
	DROP COLUMN last_name; -- Remove last_name column

SELECT * 
FROM germain_1469.employees_with_departments;	

-- d. What is another way you could have ended up with this same table?

SELECT dept_name, full_name
FROM germain_1469.employees_with_departments;	



-- 2. Create a temporary table based on the payment table from the sakila database. Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

CREATE TEMPORARY TABLE germain_1469.sakila_payment AS
SELECT * 
FROM payment; -- Creating the temp table with name sakila_payment

SELECT *
FROM germain_1469.sakila_payment; -- Check to see if the info is in the table

DESCRIBE germain_1469.sakila_payment; -- To see the 'type' for the amount column

ALTER TABLE germain_1469.sakila_payment
	MODIFY COLUMN amount DECIMAL(10,2); -- modify the type of the amount column so that I can perform scalar multiplication on the column
	
UPDATE germain_1469.sakila_payment
	SET amount = amount * 100; -- multiply the column by 100
	
ALTER TABLE germain_1469.sakila_payment
	MODIFY COLUMN amount INT; -- change the column type to integer

SELECT *
FROM germain_1469.sakila_payment; -- check to see that the information in the table has been modified/updated

DROP TABLE germain_1469.sakila_payment; -- If needed



-- 3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?

-- First temp table
CREATE TEMPORARY TABLE germain_1469.salary_compare AS
SELECT dept_name, salary, salaries.to_date AS "salary_to_date"
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no 
JOIN salaries ON salaries.emp_no = dept_emp.emp_no;

SELECT * 
FROM germain_1469.salary_compare;

SELECT STD(salary) AS historic_std
FROM salaries; -- historical standard deviation

SELECT AVG(salary) AS historic_average
FROM germain_1469.salary_compare; -- historical average salary
	
	
-- Second temp table	with just department name and current salary averages
CREATE TEMPORARY TABLE germain_1469.salary_zscore AS	
SELECT dept_name, AVG(salary) AS avg_salary
FROM germain_1469.salary_compare
WHERE salary_to_date > NOW()
GROUP BY dept_name; -- Created second table with just department name and current salary averages

SELECT *
FROM germain_1469.salary_zscore; -- To check

-- DROP TABLE germain_1469.salary_zscore; -- If needed

ALTER TABLE germain_1469.salary_zscore
	ADD historic_average DECIMAL(20, 2); -- To add historical average column
ALTER TABLE germain_1469.salary_zscore
	ADD historic_std DECIMAL(20, 2); -- To add historical stddev column
ALTER TABLE germain_1469.salary_zscore
	ADD zscore DECIMAL(20, 2); -- To add zscore column
	
SELECT *
FROM germain_1469.salary_zscore; -- To check
	
UPDATE germain_1469.salary_zscore
	SET historic_average = (SELECT AVG(salary) FROM germain_1469.salary_compare);
	-- Adds the historic salary average value to the historic_average column
UPDATE germain_1469.salary_zscore
	SET historic_std = (SELECT STD(salary) FROM salaries);
	-- Adds the historic stddev value to the historic_std column
UPDATE germain_1469.salary_zscore
	SET zscore = (avg_salary - historic_average) / historic_std;
	-- Zscore = (x - population_mean) / standard_deviation

SELECT *
FROM germain_1469.salary_zscore
ORDER BY zscore DESC; -- Results

