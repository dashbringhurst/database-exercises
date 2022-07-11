USE employees; 

/* Using the example from the lesson, create a temporary table called 
employees_with_departments that contains first_name, last_name, and 
dept_name for employees currently with that department. Be absolutely 
sure to create this table on your own database. If you see "Access 
denied for user ...", it means that the query was attempting to write 
a new table to a database that you can only read. */

CREATE TEMPORARY TABLE leavitt_1870.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
;
USE leavitt_1870;
DESCRIBE employees_with_departments;


/* Add a column named full_name to this table. It should be a VARCHAR whose 
length is the sum of the lengths of the first name and last name columns. */

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

-- Update the table so that full name column contains the correct data.

UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

-- Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments
DROP COLUMN first_name;

ALTER TABLE employees_with_departments
DROP COLUMN last_name;

-- What is another way you could have ended up with this same table?



-- Create a temporary table based on the payment table from the sakila database. */

USE sakila;

CREATE TEMPORARY TABLE leavitt_1870.sakpay AS
SELECT * FROM payment;



/* Write the SQL necessary to transform the amount column such that it is stored 
as an integer representing the number of cents of the payment. 
For example, 1.99 should become 199. */

USE leavitt_1870;

DESCRIBE sakpay;

ALTER TABLE sakpay 
MODIFY COLUMN amount INT UNSIGNED;
UPDATE sakpay
SET amount = amount * 100;

/* Find out how the current average pay in each department compares to the overall 
current pay for everyone at the company. In order to make the comparison easier, 
you should use the Z-score for salaries. In terms of salary, what is the best 
department right now to work for? The worst? */

USE employees;

SELECT AVG(salary) FROM salaries
WHERE salary = (SELECT salary,
    (salary - (SELECT AVG(salary) FROM salaries))
    /
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries)
AND to_date = '9999-01-01';


/* Hint Consider that the following code will produce the z score for current salaries.


-- Returns the historic z-scores for each salary
-- Notice that there are 2 separate scalar subqueries involved
SELECT salary,
    (salary - (SELECT AVG(salary) FROM salaries))
    /
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries;
*/

/* BONUS To your work with current salary zscores, determine the overall historic 
average departement average salary, the historic overall average, and the 
historic zscores for salary. Do the zscores for current department average salaries 
tell a similar or a different story than the historic department salary zscores? */


