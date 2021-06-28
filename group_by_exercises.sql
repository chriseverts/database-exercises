USE `employees`

## 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
## 7 titles

SELECT * 
FROM titles;

SELECT DISTINCT title
FROM titles;

##3 Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

Select last_name
FROM `employees`
	Where last_name LIKE ('E%E')
		GROUP BY last_name;
		
##4 Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

Select first_name, last_name
FROM `employees`
	Where last_name LIKE ('E%E')
		GROUP BY first_name, last_name;	
		
##5 Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.	
		
SELECT last_name
FROM `employees`
	Where last_name LIKE ('%q%') and last_name not like ('%qu%')
		GROUP BY last_name;		
		
##6 Add a COUNT() to your results (the query above) to find the number of employees with the same last name.

SELECT DISTINCT last_name, count(*) last_name
FROM `employees`
Where last_name LIKE ('%q%') and last_name not like ('%qu%')
		GROUP BY last_name;	
		
##7 Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT first_name,
		 gender,
		COUNT(*)
FROM `employees`
		WHERE first_name IN ('Irena', 'Vidya','Maya')
		GROUP BY first_name, gender;


## 8 Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?		

SELECT DISTINCT
	(Lower(Concat(substr(first_name,1,1),
	Substr(last_name,1,4), '_',
	Substr(birth_date,6,2),
	Substr(birth_date,3,2)))
	AS 'username', 
Count(*) AS 'shared_user_count',
FROM employees
GROUP BY username 
HAVING shared_user_name != 1
ORDER BY shared_user_count DESC;



		