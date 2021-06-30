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

-- 3. Find the name of all departments currently managed by women.

SELECT dept_name AS "Department Name", 
	CONCAT(first_name, " ", last_name) AS "Department Manager"
FROM departments
JOIN dept_manager
	ON departments.dept_no = dept_manager.dept_no
JOIN employees
	ON employees.emp_no = dept_manager.emp_no
WHERE CURDATE() < to_date AND employees.gender = "F";

-- 4. Find the current titles of employees currently working in the Customer Service department.
SELECT dept_name
FROM departments;


SELECT title AS "Title", COUNT(*) AS "Count"
FROM titles
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE departments.dept_name = "Customer Service" -- Customer Service Department only
	AND dept_emp.to_date > CURDATE() -- Current department emplyees
	AND titles.to_date > CURDATE() 	-- Current title
GROUP BY title
ORDER BY title;

-- 5. Find the current salary of all current managers.

SELECT dept_name AS "Department Name", 
	CONCAT(first_name, " ", last_name) AS "Department Manager",
	salary AS Salary
FROM departments
JOIN dept_manager
	ON departments.dept_no = dept_manager.dept_no
JOIN employees
	ON employees.emp_no = dept_manager.emp_no
JOIN salaries
	ON salaries.emp_no = dept_manager.emp_no
WHERE CURDATE() < dept_manager.to_date
	AND CURDATE() < salaries.to_date
ORDER BY "Department Name" ASC;

-- 6. Find the number of current employees in each department.

SELECT dept_no, dept_name, COUNT(*) AS num_employees
FROM departments
JOIN dept_emp USING(dept_no)
WHERE dept_emp.to_date > CURDATE()
GROUP BY dept_name
ORDER BY dept_no;

-- 7. Which department has the highest average salary? Hint: Use current not historic information.

SELECT dept_name, AVG(salaries.salary) AS "average_salary"
FROM departments
JOIN dept_emp USING(dept_no) -- Brings in emp_no
JOIN salaries USING(emp_no) -- Brings in salary info
WHERE dept_emp.to_date > CURDATE() -- Ensures current employees
	AND salaries.to_date > CURDATE() -- Ensures current salary
GROUP BY dept_name -- Organizes by department
ORDER BY average_salary DESC. -- Organizes highest to lowest salaries
LIMIT 1; -- Returns only the highest average salary

-- 8. Who is the highest paid employee in the Marketing department?
SELECT dept_name
FROM departments;

SELECT first_name, last_name, salary, dept_name
FROM employees
JOIN salaries USING(emp_no) -- Brings in salary info
JOIN dept_emp USING(emp_no) -- Connects employee info to department
JOIN departments USING(dept_no) -- Brings in department info
WHERE departments.dept_name = "Marketing" -- Selects only the marketing dept
	AND dept_emp.to_date > CURDATE() -- Ensures current employees
	AND salaries.to_date > CURDATE() -- Ensures current salary
ORDER BY salary DESC -- Places the highest salary at the top of the list
LIMIT 1; -- Selects only the top row

-- 9. Which current department manager has the highest salary?

SELECT first_name, last_name
FROM departments -- Department info
JOIN dept_manager -- Brings in manager info
	ON departments.dept_no = dept_manager.dept_no 
JOIN employees -- Brings in employee info
	ON employees.emp_no = dept_manager.emp_no
WHERE CURDATE() < dept_manager.to_date
	

-- 10. Bonus - Find the names of all current employees, their department name, and their current manager's name.

SELECT CONCAT(first_name, " ", last_name) AS "Employee Name",
	dept_name AS "Department Name",
	

-- 11. Bonus - Who is the highest paid employee within each department.
