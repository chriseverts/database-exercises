
USE germain_1467;


##1 Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.

##Add a COLUMN named full_name TO this table. It should be a VARCHAR whose length IS the sum of the lengths of the FIRST NAME AND LAST NAME COLUMNS
##UPDATE the TABLE so that FULL NAME COLUMN CONTAINS the correct DATA
##Remove the first_name AND last_name COLUMNS FROM the table.
##What IS another way you could have ended up WITH this same TABLE?

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT first_name, last_name, dept_name 
FROM employees.employees
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
WHERE to_date > curdate();


SELECT *
FROM employees_with_departments;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(200);

SELECT *
FROM employees_with_departments;

UPDATE employees_with_departments SET full_name = concat(first_name, ' ',last_name);


SELECT *
FROM employees_with_departments;

ALTER TABLE employees_with_departments DROP COLUMN first_name;

ALTER TABLE employees_with_departments DROP COLUMN last_name;

SELECT *
FROM employees_with_departments;

DESCRIBE employees_with_departments;


## 2 Create a temporary table based on the payment table from the sakila database.

## Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.


USE germain_1467;

CREATE TEMPORARY TABLE paid AS
SELECT payment_id, amount, payment_date, last_update
FROM sakila.payment;

SELECT *
FROM paid;

CREATE TEMPORARY TABLE pay AS
SELECT payment_id, amount * 100 AS 'amount in cents', payment_date, last_update
FROM sakila.payment;

SELECT *
FROM pay;


## 3 Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?


USE germain_1467;

SELECT AVG(salary) AS avgsalary, std(salary) AS stdsalary
FROM employees.salaries;

CREATE TEMPORARY TABLE historic AS
SELECT AVG(salary) AS avgsalary, std(salary) AS stdsalary
FROM employees.salaries;

SELECT * 
FROM historic pay;

CREATE TEMPORARY TABLE current AS (
    SELECT dept_name, AVG(salary) AS current_avg
    FROM employees.salaries
    JOIN employees.dept_emp USING(emp_no)
    JOIN employees.departments USING(dept_no)
    WHERE employees.dept_emp.to_date > curdate()
    AND employees.salaries.to_date > curdate()
    GROUP BY current_avg);


SELECT * 
FROM current;

