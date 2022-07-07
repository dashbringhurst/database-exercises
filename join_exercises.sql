-- Use the join_example_db. 

USE join_example_db;

-- Select all the records from both the users and roles tables.

SELECT * FROM users;
SELECT * FROM roles;

/* Use join, left join, and right join to combine results from 
the users and roles tables as we did in the lesson. 
Before you run each query, guess the expected number of results.
*/

SELECT users.name as user_name, roles.name as role_name  
FROM users 
JOIN roles ON users.role_id = roles.id;

SELECT users.name as user_name, roles.name as role_name  
FROM users 
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name as user_name, roles.name as role_name  
FROM users 
RIGHT JOIN roles ON users.role_id = roles.id;

/* Although not explicitly covered in the lesson, aggregate 
functions like count can be used with join queries. 
Use count and the appropriate join type to get a list of 
roles along with the number of users that has the role. 
Hint: You will also need to use group by in the query. */

SELECT users.name as user_name, roles.name as role_name
FROM users 
JOIN roles ON users.role_id = roles.id;


-- Use the employees database.

USE employees;

/* Using the example in the Associative Table Joins section as a 
guide, write a query that shows each department along with the 
name of the current manager for that department. */

SELECT CONCAT(first_name, ' ', last_name) as full_name, 
d.dept_name 
FROM employees AS e
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN dept_emp as de
ON de.emp_no = dm.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE dm.to_date = '9999-01-01';

-- Find the name of all departments currently managed by women.

SELECT CONCAT(first_name, ' ', last_name) as full_name, 
d.dept_name 
FROM employees AS e
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN dept_emp as de
ON de.emp_no = dm.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE e.gender = 'F' AND dm.to_date = '9999-01-01';

-- Find the current titles of employees currently working in the Customer Service department.

SELECT title, COUNT(title) 
FROM titles as t
JOIN employees as e
ON e.emp_no = t.emp_no
JOIN dept_emp as de
ON de.emp_no = e.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Customer Service'
AND t.to_date = '9999-01-01'
AND de.to_date = '9999-01-01'
GROUP BY title;

-- Find the current salary of all current managers.

SELECT s.salary, CONCAT(e.first_name, ' ', e.last_name), 
d.dept_name FROM salaries AS s
JOIN employees AS e
ON e.emp_no = s.emp_no
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
AND s.to_date = '9999-01-01';

-- Find the number of current employees in each department.

SELECT d.dept_no, COUNT(de.emp_no), d.dept_name
FROM departments AS d
JOIN dept_emp as de
ON de.dept_no = d.dept_no
JOIN employees as e
ON e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY d.dept_no;

/* Which department has the highest average salary? 
Hint: Use current not historic information. */

SELECT d.dept_name, AVG(s.salary) AS average_salary
FROM departments AS d
JOIN dept_emp AS de
ON de.dept_no = d.dept_no
JOIN employees AS e
ON e.emp_no = de.emp_no
JOIN salaries AS s
ON s.emp_no = e.emp_no
WHERE s.to_date = '9999-01-01'
AND de.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- Who is the highest paid employee in the Marketing department?

SELECT first_name, last_name
FROM employees AS e
JOIN salaries AS s
ON s.emp_no = e.emp_no
JOIN dept_emp AS de
ON de.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;

-- Which current department manager has the highest salary?

SELECT first_name, last_name, s.salary, d.dept_name
FROM employees AS e
JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no
JOIN salaries AS s
ON s.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 1;

/* Determine the average salary for each department. 
Use all salary information and round your results. */

SELECT d.dept_name, ROUND(AVG(s.salary)) AS average_salary
FROM departments AS d
JOIN dept_emp AS de
ON de.dept_no = d.dept_no
JOIN employees AS e
ON e.emp_no = de.emp_no
JOIN salaries AS s
ON s.emp_no = e.emp_no
GROUP BY d.dept_name;

/* Bonus Find the names of all current employees, their 
department name, and their current manager's name. */










