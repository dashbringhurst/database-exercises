USE employees;

SHOW TABLES;

-- In your script, use DISTINCT to find the unique titles in the titles table.

DESCRIBE titles;

SELECT DISTINCT title FROM titles;

-- How many unique titles have there ever been?
-- 	7

/* Write a query to to find a list of all unique last names of all 
employees that start and end with 'E' using GROUP BY. */

SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;
-- 5 names returned

/* Write a query to to find all unique combinations of first and 
last names of all employees whose last names start and end 
with 'E'. */

SELECT first_name, last_name 
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name;
-- 846 rows returned

/* Write a query to find the unique last names with a 'q' but not 'qu'. 
Include those names in a comment in your sql code. */

SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%';
-- Chleq, Lindqvist, Qiwen

/* Add a COUNT() to your results (the query above) to find 
the number of employees with the same last name. */

SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
-- Chelq: 189; Lindqvist: 190; Qiwen: 168

/* Find all all employees with first names 'Irena', 'Vidya', 
or 'Maya'. Use COUNT(*) and GROUP BY to find the number of 
employees for each gender with those names. */

SELECT first_name, gender, COUNT(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;
/* 	Irena(F): 97
	Irena(M): 144
    Maya(F): 90
    Maya(M): 146
    Vidya(F): 81
    Vidya(M): 151
*/

/* Using your query that generates a username for all of the 
employees, generate a count employees for each unique username. 
Are there any duplicate usernames? 
BONUS: How many duplicate usernames are there? */

SELECT LOWER(CONCAT(
SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', 
SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)))
AS username, COUNT(*) FROM employees
GROUP BY username;
-- 285872 rows returned
-- Yes, there are duplicates

SELECT LOWER(CONCAT(
SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', 
SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)))
AS username, COUNT(*) FROM employees
GROUP BY username
HAVING COUNT(username) > 1;
-- Number of duplicate usernames: 13251

-- Bonus: More practice with aggregate functions:

/* Determine the historic average salary for each employee. 
When you hear, read, or think "for each" with regard to SQL, 
you'll probably be grouping by that exact column. */

SELECT emp_no, AVG(salary), 
COUNT(*) FROM salaries
GROUP BY emp_no;

/* Using the dept_emp table, count how many current employees 
work in each department. The query result should show 9 rows, 
one for each department and the employee count. */

SELECT dept_no, COUNT(emp_no)
FROM dept_emp
GROUP BY dept_no;

-- Determine how many different salaries each employee has had. 
-- This includes both historic and current.

SELECT emp_no, COUNT(salary) 
FROM salaries
GROUP BY emp_no;

-- Find the maximum salary for each employee.

SELECT emp_no, MAX(salary), COUNT(emp_no)
FROM salaries
GROUP BY emp_no;

-- Find the minimum salary for each employee.

SELECT emp_no, MIN(salary), COUNT(emp_no)
FROM salaries
GROUP BY emp_no;

-- Find the standard deviation of salaries for each employee.

SELECT emp_no, STD(salary), COUNT(emp_no) 
FROM salaries
GROUP BY emp_no;

-- Now find the max salary for each employee where that max salary is greater than $150,000.

SELECT emp_no, MAX(salary), COUNT(emp_no)
FROM salaries
GROUP BY emp_no
HAVING MAX(salary) > 150000;

/* Find the average salary for each employee where that average 
salary is between $80k and $90k. */

SELECT emp_no,
CAST(AVG(salary) AS DECIMAL(10,2)) AS avg_salary,
COUNT(*) FROM salaries
GROUP BY emp_no
HAVING avg_salary BETWEEN 80000 AND 90000;