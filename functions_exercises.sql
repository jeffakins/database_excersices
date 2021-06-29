USE employees;

SELECT first_name, last_name 
FROM employees
WHERE first_name IN('Irena', 'Vidya', 'Maya')
ORDER BY first_name; -- Irena Reutenauer; Vidya Simmen

SELECT first_name, last_name 
FROM employees
WHERE first_name IN('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name; -- Irena Acton; Vidya Zweizig

SELECT first_name, last_name 
FROM employees
WHERE first_name IN('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name; -- Irena Acton; Maya Zyda

SELECT first_name, last_name, emp_no
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no; -- 899 selected; 10021-Ramzi Erde; 499648-Tadahiro Erde

SELECT first_name, last_name, hire_date
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC; -- 899 selected; Teiji Eldidge, Sergi Erde

SELECT first_name, last_name, birth_date, hire_date
FROM employees
WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%12-25'
ORDER BY birth_date ASC, hire_date DESC; -- 362 selected; Khun Berini, Douadi Pettis

-- Start of the Functions Exercises --

-- #2
SELECT CONCAT(first_name," ", last_name) AS "Full_Name"
FROM employees
WHERE last_name LIKE 'e%e'; -- Using the CONCAT() function to combine first and last names

-- #3
SELECT UPPER(CONCAT(first_name," ", last_name)) AS "Full_Name"
FROM employees
WHERE last_name LIKE 'e%e'; -- Using UPPER() to capitalize the above list

-- #4
SELECT first_name, 
	last_name, 
	birth_date, 
	hire_date, 
	DATEDIFF(CURDATE(), hire_date) AS "days_since_hire"
FROM employees
WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%12-25'
ORDER BY days_since_hire DESC; -- Created a Days Sinces Hired column

-- #5 
USE salaries;
SELECT MIN(salary) AS "Min Salary",
	MAX(salary) AS "Max Salary"
FROM salaries;

-- #6
SELECT LOWER(CONCAT(SUBSTR(first_name,1 ,1), 
	SUBSTR(last_name, 1, 4),
	"_", 
	SUBSTR(birth_date, 6, 2),
	SUBSTR(birth_date, 3, 2))) 
	AS "username", 
	first_name,
	last_name,
	birth_date
FROM employees;