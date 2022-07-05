USE employees;

SHOW TABLES;

DESCRIBE employees;

/* Find all employees with first names 'Irena', 'Vidya', or 'Maya', 
and order your results returned by first name. */

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
/* What was the first and last name in the first row of the results?
	Irena Reutenauer
What was the first and last name of the last person in the table?
	Vidya Simmen */

/* Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order 
your results returned by first name and then last name. */

SELECT * FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya'
ORDER BY first_name, last_name;
/* What was the first and last name in the first row of the results?
	Irena Acton
What was the first and last name of the last person in the table?
	Vidya Zweizig */

/* Find all employees with first names 'Irena', 'Vidya', or 'Maya', 
and order your results returned by last name and then first name. */


SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

/* What was the first and last name in the first row of the results?
	Irena Acton
What was the first and last name of the last person in the table?
	Maya Zyda */

/* Write a query to to find all employees whose last name starts and ends with 'E'. 
Sort the results by their employee number. */

SELECT * FROM employees
WHERE (last_name LIKE 'E%'
AND last_name LIKE '%E')
ORDER BY emp_no;

/* Enter a comment with the number of employees returned, 
the first employee number and their first and last name, 
and the last employee number with their first and last name.
	899 rows returned
    first employee number = 10021, Ramzi Erde
    last employee number = 499648, Tadahiro Erde */

/* Write a query to to find all employees whose last name starts and ends with 'E'. 
Sort the results by their hire date, so that the newest employees are listed first. */

SELECT * FROM employees
WHERE (last_name LIKE 'E%'
AND last_name LIKE '%E')
ORDER BY hire_date DESC;

/* Enter a comment with the number of employees returned, 
the name of the newest employee, and the name of the oldest employee.
	899 rows returned
    Newest employee = Teiji Eldridge
    Oldest employee = Sergi Erde */

/* Find all employees hired in the 90s and born on Christmas. 
Sort the results so that the oldest employee who was hired 
last is the first result. */

SELECT * FROM employees
WHERE (hire_date LIKE '199%'
AND birth_date LIKE '%12-25')
ORDER BY hire_date DESC, birth_date ASC;
/* Sort the results so that the oldest employee who was hired last is the first result. 
Enter a comment with the number of employees returned, 
the name of the oldest employee who was hired last, 
and the name of the youngest employee who was hired first.
	362 rows returned
	Khun Bernini */

SELECT * FROM employees
WHERE (hire_date LIKE '199%'
AND birth_date LIKE '%12-25')
ORDER BY birth_date DESC, hire_date ASC;
-- Douadi Pettis




