USE employees;

SHOW TABLES;

DESCRIBE employees;
-- numeric type: emp_no, gender
-- string type: first_name, last_name
-- date type: birth_date, hire_date

DESCRIBE departments;
/* What is the relationship between
the employees and departments tables?
	- They have the same number of columns
		and a primary key. They are both in the
        employees schema. Nulls are not allowed.
*/

SHOW CREATE TABLE dept_manager;
/* CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/
