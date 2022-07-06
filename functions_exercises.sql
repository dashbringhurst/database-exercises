USE employees;

SHOW TABLES;

DESCRIBE employees;

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

SELECT * FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya'
ORDER BY first_name, last_name;

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

/* Write a query to to find all employees whose 
last name starts and ends with 'E'. 
Use concat() to combine their first and last name 
together as a single column named full_name. */

SELECT CONCAT(first_name, last_name)
AS full_name FROM employees
WHERE (last_name LIKE 'E%'
AND last_name LIKE '%E');

-- Convert the names produced in your last query to all uppercase.

SELECT UPPER(CONCAT(first_name, last_name))
AS full_name FROM employees
WHERE (last_name LIKE 'E%'
AND last_name LIKE '%E');

/* Find all employees hired in the 90s and born on Christmas. 
Use datediff() function to find how many days they have been 
working at the company (Hint: You will also need to use NOW() 
or CURDATE())
*/

SELECT *, DATEDIFF(CURDATE(), hire_date) FROM employees
WHERE (hire_date LIKE '199%'
AND birth_date LIKE '%12-25');

/* Find the smallest and largest current salary from 
the salaries table. */

SELECT MAX(salary) FROM salaries;
-- 158220

SELECT MIN(salary) FROM salaries;
-- 38623

/* Use your knowledge of built in SQL functions to generate a 
username for all of the employees. A username should be all 
lowercase, and consist of the first character of the employees 
first name, the first 4 characters of the employees last name, 
an underscore, the month the employee was born, and the last 
two digits of the year that they were born. */

SELECT *, LOWER(CONCAT(
SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', 
SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username
FROM employees;






