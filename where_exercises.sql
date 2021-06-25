USE employees;

DESCRIBE employees;

SELECT first_name
FROM employees
WHERE first_name IN('Irena', 'vidya', 'Maya'); -- 709 selected

SELECT first_name
FROM employees
WHERE first_name = 'Irena'
	OR first_name = 'vidya'
	OR first_name = 'Maya'; -- 709 selected
	
SELECT first_name
FROM employees
WHERE first_name IN('Irena', 'vidya', 'Maya')
	AND gender = 'M'; -- 441 selected
	
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%'; -- 7330 selected

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%'
	OR last_name LIKE '%e'; -- 30723 selected
	
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%'
	AND last_name LIKE '%e'; -- 899 selected
	
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '199%'; -- 135214 selected

SELECT last_name, birth_date
FROM employees
WHERE birth_date LIKE '%12-25'; -- 842 Christmas birthdays!

SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%12-25'; -- 362 selected
	
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'; -- 1873 selected

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%'; -- 547 selected