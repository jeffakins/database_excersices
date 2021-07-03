-- Case Exercises

USE employees;

-- 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

SELECT emp_no AS "Employee_Number",
	dept_no AS "Department_Number", 
	to_date AS "Start_Date", 
	from_date AS "End_Date",
	IF(to_date > NOW(), TRUE, FALSE) AS "Is_Current_Employee" -- IF Statement returns whether a current emplyee or not
FROM dept_emp
ORDER BY emp_no; 

-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT first_name, last_name,
	CASE 
		WHEN last_name LIKE "a%" THEN "A-H"
		WHEN last_name LIKE "b%" THEN "A-H"
		WHEN last_name LIKE "c%" THEN "A-H"
		WHEN last_name LIKE "d%" THEN "A-H"
		WHEN last_name LIKE "e%" THEN "A-H"
		WHEN last_name LIKE "f%" THEN "A-H"
		WHEN last_name LIKE "g%" THEN "A-H"
		WHEN last_name LIKE "h%" THEN "A-H"
	
		WHEN last_name LIKE "i%" THEN "I-Q"
		WHEN last_name LIKE "j%" THEN "I-Q"
		WHEN last_name LIKE "k%" THEN "I-Q"
		WHEN last_name LIKE "l%" THEN "I-Q"
		WHEN last_name LIKE "m%" THEN "I-Q"
		WHEN last_name LIKE "n%" THEN "I-Q"
		WHEN last_name LIKE "o%" THEN "I-Q"
		WHEN last_name LIKE "p%" THEN "I-Q"
		WHEN last_name LIKE "q%" THEN "I-Q"
		
		ELSE "R-Z"
		
		END AS "alpha_group"
FROM employees;

-- 3. How many employees (current or previous) were born in each decade?

SELECT 
	CASE 
		WHEN birth_date LIKE "194%" THEN "1940s"
		WHEN birth_date LIKE "195%" THEN "1950s"
		WHEN birth_date LIKE "196%" THEN "1960s"
		WHEN birth_date LIKE "197%" THEN "1970s"
		ELSE "50s<80s"
		END AS "Birth_Decade", -- CASE separates emp birthdates into buckets by decade
		
		COUNT(*) AS "Number_Employees" -- COUNTs the number of employees in each bucket
		
FROM employees
GROUP BY Birth_decade; -- GROUPs the buckets
/* 
1950s	182886
1960s	117138 
*/

-- Bonus: 1. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT AVG(salary)
	CASE 
		WHEN 
FROM salaries
WHERE to_date > NOW();
	
	
	
	IN("Developement", "Reseach")
	IN("Sales", "Marketing")
	IN("Production", "Quality Management")
	IN("Finance", "Human Resources")
	IN("Customer Services")

	CASE
		WHEN THEN AVG();
		
SELECT *
FROM departments;