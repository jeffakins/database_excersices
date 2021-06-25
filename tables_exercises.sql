USE employees; -- Types: CHAR, VARCHAR, INT, DATE, ENUM, 

-- All tables use numeric types except for departments

-- All tables have strings except for salaries

-- All tables have date except for departments

DESCRIBE employees;

DESCRIBE departments;

DESCRIBE dept_emp; -- emp_no and dept_no is the relationship between the employees and the departments tables.

DESCRIBE dept_manager;
