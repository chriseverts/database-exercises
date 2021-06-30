


## 2. Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.

SELECT CONCAT(first_name, ' ', last_name) AS Full_Name FROM employees
WHERE last_name LIKE ('E%E');



##3 Convert the names produced in your last query to all uppercase.

SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS Full_Name FROM employees
WHERE last_name LIKE ('E%E');


##4. Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),


SELECT hire_date, birth_date, datediff(curdate(), (hire_date)) as number_of_days_employed from employees
WHERE hire_date LIKE '199%' AND '1999' AND birth_date LIKE ('%-12-25')
order by number_of_days_employed DESC;

##5 Find the smallest and largest current salary from the salaries table.

SELECT max(salary), min(salary) FROM salaries;

#6. Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:


SELECT lower(concat(
    substr(first_name, 1, 1), # first initial of first name
    substr(last_name, 1, 4), # first 4 of last name
		 "_",
		 substr(hire_date, 6, 2), # month
		 substr(hire_date, 3, 2) # 2 yr
)) AS username,first_name, last_name, birth_date
FROM employees;

