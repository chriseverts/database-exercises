/* Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
  Department Name    | Department Manager
 --------------------+--------------------
  Customer Service   | Yuchang Weedman
  Development        | Leon DasSarma
  Finance            | Isamu Legleitner */
  # How to setup a join problem
  # Step 1: list out the tables I know I'm going to need to talk to:
  # Step 1: departments table get the dept_name
  # Step 1: employees table to get the first_name and last_name (of manageer)
  # Step 1: What keys do these tables have in common?
  # Step 1: If no keys directly in common, then look for a j oiner table to find the relationship
  # Step 1: We've found dept_manager has dept_no and emp_no for managers on it
  # Step 1: departments, dept_manager, employees
  # Step 1: A -> B -> C, C -> B -> A
  # Step 2: start a "select *" from your first table?
/*   select *
  from departments     */
  # Step 3: Determine the type of join you might need
  # Step 3: Make your first join, and try it out.
  # Step 3: Small, tight feedback loops
  SELECT * 
  FROM departments
  JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
 JOIN employees ON employees.emp_no = dept_manager.emp_no;
 # Step 4, do we need any more tables to join? no
 # Step 5, do we need a where clause to whittle things down?
  SELECT * 
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date > curdate();
# Step 6, let's whittle down our columns
SELECT dept_name, first_name, last_name
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date > curdate();
  # Step 7: polish up any further output columns
  SELECT dept_name AS "Department Name", 
   concat(first_name, " ", last_name) AS "Current Manager Name"
FROM departments 
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE to_date > curdate()
ORDER BY "Department Name";
# Get the highest current salary from each department
# department_name, $salary
# Step 1: What tables do we need?
# Step 1: departments to get dept_name, salary to get $
SELECT dept_name, max(salary) AS highest_dept_salary
FROM salaries
JOIN dept_emp USING(emp_no) -- same join dept_emp on dept_emp.emp_no = salaries.emp_no;
JOIN departments USING(dept_no)
WHERE dept_emp.to_date > curdate()
AND salaries.to_date > curdate()
GROUP BY dept_name
ORDER BY highest_dept_salary DESC;
SELECT min(hire_date), first_name, count(*)
FROM employees
GROUP BY first_name;	
# Bonus Who is the highest paid employee within each department.
# Do you need the answer in 20 minutes?
# Do we need this query to run next year?
# Do you need one code query that we could run any time in the next 20 years?
# If there are only 9 departments, do we need a super squeeky clean solution?
# Quick answer: run 9 queries and stitch the answers together
(SELECT dept_no, salary, emp_no, first_name, last_name
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN employees USING(emp_no)
WHERE dept_no = 'd001'
ORDER BY salary DESC
LIMIT 1)
UNION
(SELECT dept_no, salary, emp_no, first_name, last_name
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN employees USING(emp_no)
WHERE dept_no = 'd002'
ORDER BY salary DESC
LIMIT 1);

SELECT 
	t1.dept_name AS 'Department Name',
	t1.salary AS 'Salary',
	CONCAT(first_name,' ', last_name) AS 'Employee Name'
FROM 
	(
	-- Part 1 which builds the base table to employee names, salaries and dept names
	SELECT
		salary, dept_name, first_name, last_name
	FROM
		salaries
	JOIN
		dept_emp 
	USING(emp_no)
	JOIN 
		departments 
	USING(dept_no)
	JOIN 
		employees
	USING(emp_no)
	WHERE 
		dept_emp.to_date >= NOW()
	AND 
		salaries.to_date >= NOW()
	) AS t1 # This is table_1 result created
INNER JOIN
	(
	-- Part 2 builds another table to cross reference the previous part with the calculated max salaries
	SELECT dept_name, MAX(salary) AS max_salary
	FROM 
		(
		SELECT
			salary, dept_name, first_name, last_name
		FROM
			salaries
		JOIN
			dept_emp 
		USING(emp_no)
		JOIN 
			departments 
		USING(dept_no)
		JOIN 
			employees
		USING(emp_no)
		WHERE 
			dept_emp.to_date >= NOW()
			AND 
			salaries.to_date >= NOW()
		) AS t2
	GROUP BY dept_name
	) AS t2 # This is table_2 result created
	-- Joins both tables based on the dept_name and matches the salary & department name with the max_salary
	ON 
	t1.dept_name = t2.dept_name
	AND
	t1.salary = t2.max_salary
ORDER BY 'Department Name' DESC;




##2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT * 
FROM employees 
LIMIT 5;

SELECT * 
FROM dept_manager;

SELECT * 
FROM departments;

SELECT
	d.dept_name,
	CONCAT(e.first_name, ' ', e.last_name) AS current_department_manager
FROM employees AS e

JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND to_date > CURDATE()
JOIN departments AS d USING(dept_no)
ORDER BY dept_name;

##3 Find the name of all departments currently managed by women.

SELECT
	d.dept_name,
	CONCAT(emp.first_name, ' ', emp.last_name) AS current_department_manager, gender
FROM employees AS emp
JOIN dept_manager AS dept ON emp.emp_no = dept.emp_no
	AND to_date > CURDATE()
	AND gender = 'f'
JOIN departments AS d USING(dept_no)
ORDER BY dept_name;


##4. Find the current titles of employees currently working in the Customer Service department.

SELECT Title, Count(*)
FROM `employees` AS e
JOIN dept_emp AS de ON de.emp_no = e.emp_no
JOIN titles ON titles.emp_no = de.emp_no
JOIN departments ON departments.dept_no = de.dept_no
WHERE titles.to_date = '9999-01-01' AND departments.dept_no = 'd009' AND de.to_date = '9999-01-01'
GROUP BY Title;


## 5. Find the current salary of all current managers.

select dept_no AS Department_Name, salary, concat(first_name, " ", last_name) as "Current Manager"
from salaries
join dept_manager ON dept_manager.emp_no = employees.emp_no
join employees ON employees.emp_no = dept_emp.emp_no
join departments ON departments.dept_no = dept_emp.dept_no
where dept_manager.to_date > curdate()
and salaries.to_date > curdate();


SELECT dept_no, salary, concat(first_name, " ", last_name) AS "Current Manager"
FROM salaries
JOIN dept_manager USING(emp_no)
JOIN employees USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_manager.to_date > curdate()
AND salaries.to_date > curdate();

##6 Find the number of current employees in each department.

SELECT dept_no, dept_name, count(*) AS num_employees
FROM departments
JOIN dept_emp USING(dept_no)
WHERE to_date > curdate()
GROUP BY dept_no
ORDER BY dept_no;



##7 Which department has the highest average salary? Hint: Use current not historic information.


SELECT dept_name, AVG(salary) AS average_salary
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_emp.to_date > curdate()
AND salaries.to_date > curdate()
GROUP BY dept_name
ORDER BY average_salary DESC;

##8 Who is the highest paid employee in the Marketing department?

SELECT first_name, last_name, salary
FROM departments
JOIN dept_emp USING(dept_no)
JOIN salaries USING(emp_no)
JOIN employees USING(emp_no)
WHERE salaries.to_date > curdate()
AND dept_emp.to_date > curdate()
AND dept_name = "Marketing"
ORDER BY salary DESC
LIMIT 1;


##9 Which current department manager has the highest salary?
select first_name, last_name, salary, dept_name
from salaries
join dept_manager using(emp_no)
join departments using(dept_no)
join employees using(emp_no)
where salaries.to_date > curdate()
and dept_manager.to_date > curdate()
order by salary DESC
limit 1;


