-- Subqueries Exercises

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT first_name, last_name, emp_no, hire_date
FROM employees -- All of the info needed is in the employees table
WHERE hire_date IN -- hire_date is how we are sorting 
	(
	SELECT hire_date 
	FROM employees
	WHERE emp_no = 101010 -- Subquery to select matching employees
	) 
ORDER BY last_name; -- 69 results
		
-- 2. Find all the titles ever held by all current employees with the first name Aamod.

SELECT title 
FROM titles
WHERE emp_no IN -- Employee number is what links the tables
	(
	SELECT emp_no
	FROM employees
	WHERE first_name = "Aamod" -- Selecting only the emp number with first name Aamod
	)
GROUP BY title
ORDER BY title; -- Organizing

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT emp_no, first_name, last_name
FROM employees -- Utilizing the emplyees table
WHERE emp_no IN -- emp_no links to the dept_emp table 
	(
	SELECT DISTINCT(emp_no) -- Removes duplicate employees that have worked in multiple departments
	FROM dept_emp
	WHERE to_date < NOW()
/* 		AND emp_no != 
		(SELECT emp_no
		FROM dept_emp
		WHERE to_date > NOW() */
		) -- All emplyees that have left a department 
	)
ORDER BY emp_no; -- 85108 employees have left the company ** NOT CORRECT YET ** still need to remove current emp 

-- 4. Find all the current department managers that are female. List their names in a comment in your code.
	
SELECT first_name, last_name
FROM employees -- Names come from the employees table
WHERE emp_no IN
	(
	SELECT emp_no -- Link for the tables
	FROM dept_manager
	WHERE to_date > NOW() -- To get current managers
	)
	AND gender = "F";
/* 
Isamu	Legleitner
Karsten	Sigstam
Leon	DasSarma
Hilary	Kambil 
*/

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT first_name, last_name
FROM employees
WHERE emp_no IN -- emp_no link
	(
	SELECT emp_no 
	FROM salaries
	WHERE to_date > NOW() -- used to get current employees
		AND salary > -- compares salary to 
		(
		SELECT AVG(salary) -- the historical average salary
		FROM salaries -- from the salaries table
		)
	)
ORDER BY last_name; -- 154543 results

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

SELECT STDDEV(salary)
FROM salaries; -- 16904.82

SELECT salary
FROM salaries
ORDER BY salary DESC
LIMIT 1; -- 158220

SELECT MAX(salary)
FROM salaries; -- 158220

SELECT MAX(salary) - STDDEV(salary)
FROM salaries; -- 141315.17

SELECT first_name, last_name
FROM employees
WHERE emp_no IN 
	(
	SELECT emp_no 
	FROM salaries
	WHERE to_date > NOW()
		AND salary > 
			(
			SELECT MAX(salary) - STDDEV(salary)
			FROM salaries
			)
	)
ORDER BY last_name; -- 78 results, but that does not seem correct 

-- What percentage of all salaries is this?
SELECT COUNT(*)
FROM employees
WHERE emp_no IN 
	(
	SELECT emp_no 
	FROM salaries
	WHERE to_date > NOW()
		AND salary > 
			(
			SELECT MAX(salary) - STDDEV(salary)
			FROM salaries
			)
	)
;

-- Bonus
-- 1. Find all the department names that currently have female managers.
SELECT dept_name -- to get the department names
FROM departments 
WHERE dept_no IN
	(
	SELECT dept_no -- department numbers link dertment managers
	FROM dept_manager
	WHERE emp_no IN -- employee number links to employee table to get gender
		(
		 SELECT emp_no
		 FROM employees 
		 WHERE emp_no IN 
			(
			SELECT emp_no -- Link for the dept_manager table
			FROM dept_manager
			WHERE to_date > NOW() -- To get current managers
			)
			AND gender = "F"
		)
	);

/* 
Development
Finance
Human Resources
Research 
*/

-- 2. Find the first and last name of the employee with the highest salary.

-- 3. Find the department name that the employee with the highest salary works in.
	