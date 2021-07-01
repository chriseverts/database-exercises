##1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT first_name, Last_name, hire_date
FROM employees
  WHERE hire_date = 
    ( SELECT hire_date
        FROM employees
            WHERE emp_no = 101010);




##2. Find all the titles ever held by all current employees with the first name Aamod.


SELECT title
FROM titles
  WHERE emp_no IN 
    ( SELECT emp_no
        FROM employees
            WHERE first_name = 'Aamod');
            



##3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SELECT *
  FROM employees
    WHERE emp_no IN 
      (SELECT emp_no 
        FROM dept_emp
          WHERE to_date NOT IN ('9999-01-01')  );
          
          
          


      


##4. Find all the current department managers that are female. List their names in a comment in your code.

SELECT first_name, last_name, gender
  FROM employees
    WHERE emp_no IN (
      SELECT emp_no 
        FROM dept_manager
          WHERE to_date >= NOW()) AND gender = 'F';




##5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT first_name, last_name, salary
FROM employees
JOIN salaries on salaries.emp_no = employees.emp_no
WHERE salary > (
	SELECT AVG(salary)
	FROM salaries
)
AND to_date > curdate();




##6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?


SELECT max(salary)
  FROM salaries;
  
SELECT stddev(salary)
  FROM salaries;
  
SELECT * 
FROM salaries
  WHERE salary >= (
    SELECT max(salary)
      FROM salaries) - (SELECT stddev(salary) FROM salaries) AND to_date > curdate();  
      
      
SELECT count(*) AS 'salaries below std dev', 
  (count(*) / (SELECT count(*) FROM salaries)) * 100 AS 'percent of current salaries'
  FROM salaries
    WHERE salary >=
      ((SELECT max(salary) FROM salaries) - (SELECT stddev(salary) FROM salaries)
        AND to_date > curdate());
 
  
  




