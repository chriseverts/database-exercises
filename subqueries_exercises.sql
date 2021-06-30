##1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT first_name, Last_name, hire_date
FROM employees
  WHERE hire_date = 
    ( SELECT hire_date
        FROM employees
            WHERE emp_no = 101010);




##2. Find all the titles ever held by all current employees with the first name Aamod.


SELECT first_name, Last_name
FROM employees
  WHERE emp_no = 
    ( SELECT title
        FROM titles
            WHERE first_name = 'Aamod');


##3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.





##4. Find all the current department managers that are female. List their names in a comment in your code.






##5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.








##6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?


