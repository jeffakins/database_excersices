# More SQL Exercises

-- 1. How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?

SELECT * 
FROM salaries
JOIN dept_manager 
	ON salaries.emp_no = dept_manager.emp_no
JOIN dept_emp 
	ON dept_manager.emp_no = dept_emp.emp_no
JOIN departments 
	ON dept_emp.dept_no = departments.dept_no

