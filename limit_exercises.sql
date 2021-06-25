USE employees;

SELECT DISTINCT title 
FROM titles;

SELECT DISTINCT last_name 
FROM employees
ORDER BY last_name DESC; 
/* 
Zykh
Zyda
Zwicker
Zweizig
Zumaque
Zultner
Zucker
Zuberek
Zschoche
Zongker 
*/

SELECT first_name, Last_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%12-25'
	AND hire_date LIKE '199%'
ORDER BY hire_date
LIMIT 5;
/* 
Alselm	Cappello
Utz	Mandell
Bouchung	Schreiter
Baocai	Kushner
Petter	Stroustrup 
*/

SELECT first_name, Last_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%12-25'
	AND hire_date LIKE '199%'
ORDER BY hire_date
LIMIT 5 OFFSET 10;
/* 
Kendra	Stafford
Sanjai	Isaac
Aiichiro	Neiman
Kwangjo	Bage
Tamiya	Kambil 
*/