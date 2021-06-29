-- 1. 
USE employees;

-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT dept_name AS "Department Name", 
	CONCAT(first_name, " ", last_name) AS "Department Manager"
FROM departments
JOIN dept_manager
	ON departments.dept_no = dept_manager.dept_no
JOIN employees
	ON employees.emp_no = dept_manager.emp_no
WHERE CURDATE() < to_date;
