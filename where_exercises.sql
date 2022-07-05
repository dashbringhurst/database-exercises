USE employees;

SHOW TABLES;

DESCRIBE employees;

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- 709 rows returned

SELECT * FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya';
-- 709 rows returned

SELECT * FROM employees
WHERE gender = 'M' 
AND (first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya');
-- 441 rows returned

SELECT * FROM employees
WHERE last_name LIKE 'E%';
-- 7330 rows returned

SELECT * FROM employees
WHERE last_name LIKE 'E%'
OR last_name LIKE '%E';
-- 30723 rows returned
-- 23393 people have last names that end with E
-- but do not start with E

SELECT * FROM employees
WHERE (last_name LIKE 'E%'
AND last_name LIKE '%E');
-- 899 rows returned

SELECT * FROM employees
WHERE last_name LIKE '%E';
-- 24292 people have last names that end with E

SELECT * FROM employees
WHERE hire_date LIKE '199%';
-- 135214 rows returned

SELECT * FROM employees
WHERE birth_date LIKE '%12-25';
-- 842 rows returned

SELECT * FROM employees
WHERE (hire_date LIKE '199%'
AND birth_date LIKE '%12-25');
-- 362 rows returned

SELECT * FROM employees
WHERE last_name LIKE '%q%';
-- 1873 rows returned

SELECT * FROM employees
WHERE (last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%');
-- 547 rows returned



