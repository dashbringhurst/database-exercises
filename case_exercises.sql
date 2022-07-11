/* Write a query that returns all employees, their department number, their start date, their end date, 
and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. */

USE employees;

SELECT emp_no, dept_no, 
from_date, to_date, 
to_date > CURDATE() AS
is_current_employee
FROM dept_emp;
    
/* Write a query that returns all employee names (previous and current), 
and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' 
depending on the first letter of their last name.
*/

SELECT first_name, last_name,
	CASE
       WHEN left(last_name, 1) BETWEEN 'A' AND 'H' THEN 'A-H'
       WHEN left(last_name, 1) BETWEEN 'I' AND 'Q' THEN 'I-Q'
       WHEN left(last_name, 1) BETWEEN 'R' AND 'Z' THEN 'R-Z'
   END AS alpha_group
FROM employees;

-- How many employees (current or previous) were born in each decade?

SELECT 
COUNT(CASE WHEN birth_date BETWEEN '1930-01-01' AND '1939-12-31' THEN birth_date END) AS '1930s',
COUNT(CASE WHEN birth_date BETWEEN '1940-01-01' AND '1949-12-31' THEN birth_date END) AS '1940s',
COUNT(CASE WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN birth_date END) AS '1950s',
COUNT(CASE WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN birth_date END) AS '1960s',
COUNT(CASE WHEN birth_date BETWEEN '1970-01-01' AND '1979-12-31' THEN birth_date END) AS '1970s'
FROM employees;

/* What is the current average salary for each of the following department groups: 
R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service? */

SELECT
	CASE
		WHEN d.dept_name IN('Research', 'Development') THEN 'R&D'
        WHEN d.dept_name IN('Sales', 'Marketing') THEN 'Sales & Marketing'
        WHEN d.dept_name IN('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN d.dept_name IN('Finance', 'Human Resources') THEN 'Finance & HR'
        WHEN d.dept_name IN ('Customer Service') THEN 'Customer Service'
        ELSE d.dept_name
	END AS dept_group, AVG(salary)
FROM departments d
JOIN dept_emp AS de
ON de.dept_no = d.dept_no
JOIN salaries AS s
ON s.emp_no = de.emp_no
WHERE s.to_date > CURDATE()
AND de.to_date > CURDATE()
GROUP BY dept_group;