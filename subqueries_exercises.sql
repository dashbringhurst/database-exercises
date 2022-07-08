USE employees;

-- Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT * FROM employees
WHERE hire_date = 
(SELECT hire_date FROM employees
WHERE emp_no = 101010)
;

SELECT emp_no FROM employees
WHERE hire_date = 
(SELECT emp_no from dept_emp 
WHERE emp_no = 101010
AND to_date > NOW());

-- Find all the titles ever held by all current employees with the first name Aamod. 

SELECT title, emp_no
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod')
ORDER BY emp_no;

-- How many people in the employees table are no longer working for the company? 
-- Give the answer in a comment in your code.

SELECT * FROM employees
WHERE emp_no NOT IN
(SELECT emp_no FROM dept_emp
WHERE to_date = '9999-01-01');
-- 59900 rows returned

-- Find all the current department managers that are female. 
-- List their names in a comment in your code.

SELECT * FROM employees
WHERE emp_no IN
(SELECT emp_no FROM dept_manager
WHERE to_date > CURDATE())
AND gender = 'F';
/* 	Isamu Legleitner
	Karsten Sigstam
	Leon DasSarma
    Hilary Kambil */
    
-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT * FROM employees
WHERE emp_no IN
	(SELECT emp_no FROM salaries
	WHERE salary > 
		(SELECT AVG(salary) FROM salaries
		WHERE to_date < NOW())
	AND to_date > CURDATE())
;
-- 158675 rows returned

/* How many current salaries are within 1 standard deviation of the current highest salary? 
(Hint: you can use a built in function to calculate the standard deviation.) */

-- max salary: 158220
-- std of max: 

SELECT salary from salaries
WHERE salary > (SELECT MAX(salary) FROM salaries as ms
				WHERE to_date > NOW()) -
	(SELECT STDDEV(salary) FROM
		salaries as sd
		WHERE to_date > NOW())
-- AND salary > ((SELECT MAX(salary) FROM salaries as ms) - (SELECT STDDEV(salary) FROM
-- 		(SELECT MAX(salary) FROM salaries as ms) as sd))        
AND to_date > NOW();

/* What percentage of all salaries is this?
Hint You will likely use multiple subqueries in a variety of ways
Hint It's a good practice to write out all of the small queries that you can. 
Add a comment above the query showing the number of rows returned. 
You will use this number (or the query that produced it) in other, larger queries. */

SELECT salary from salaries
WHERE salary > (SELECT MAX(salary) FROM salaries as ms) -
	(SELECT STDDEV(salary) FROM
		salaries as sd
		WHERE to_date > NOW())        
AND to_date > NOW();
-- 83 rows returned  

-- 17309.95933634675
-- SELECT STD(salary) FROM salaries
-- WHERE to_date > NOW();

-- select salary from salaries
-- where salary > (158220 - 17309.95933634675)
-- and to_date > NOW();
-- 83 rows returned
