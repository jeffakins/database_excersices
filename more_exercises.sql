# More SQL Exercises

-- 1. How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?

SELECT * 
FROM salaries
JOIN dept_manager USING (emp_no)
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)

