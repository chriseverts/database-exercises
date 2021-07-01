




##1 Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
SELECT 
	dept_emp.emp_no,
	dept_no,
	hire_date,
	to_date,
	IF(to_date > '9999-01-01', TRUE, FALSE) AS current_employee
FROM dept_emp
JOIN (SELECT 
			emp_no,
			MAX(to_date) AS max_date
		FROM dept_emp
		GROUP BY emp_no) AS last_dept 
		ON dept_emp.emp_no = last_dept.emp_no AND dept_emp.to_date = last_dept.max_date
JOIN employees AS e ON e.emp_no = dept_emp.emp_no;

##2Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.


SELECT
	CONCAT(first_name, ' ', last_name) AS employee_name,
	CASE
		WHEN LEFT(last_name, 1) IN('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h') THEN 'A-H'
		WHEN LEFT(last_name, 1) IN('i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q') THEN 'I-Q'
		ELSE 'R-Z'
	END AS main_group
FROM employees;

## 3.How many employees (current or previous) were born in each decade?

  SELECT * 
FROM employees
ORDER BY birth_date ASC;

  
    
SELECT
	CASE
		WHEN birth_date LIKE '195%' THEN '50s'
		WHEN birth_date LIKE '196%' THEN '60s'
		ELSE 'young generations'
	END AS decade,
	COUNT(*)
FROM employees
GROUP BY decade;




