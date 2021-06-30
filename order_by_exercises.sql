use employees;

## 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

Select * 
FROM employees;

Select *
FROM `employees`
	Where first_name IN ('Irena','Vidya') or ('Maya')  
		ORDER BY first_name;
## Irena	Reutenauer. Vidya Simmen

## 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

Select *
FROM `employees`
	Where first_name IN ('Irena','Vidya') or ('Maya')  
		ORDER BY first_name, last_name;
## Irena Acton. Vidya Zweizig

## 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

Select *
FROM `employees`
	Where first_name IN ('Irena','Vidya','Maya') 
		ORDER BY last_name, first_name;
## Irena Acton, Vidya Zweizig		

## 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.



Select *
FROM `employees`
	Where last_name LIKE ('E%') and last_name like ('%E')
		ORDER BY emp_no;


## 899, 10021 Ramzi Erde, 499648 Tadahiro Erde

## 6.  Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.

Select *
FROM `employees`
	Where last_name LIKE ('E%') and last_name like ('%E')
		ORDER BY hire_date desc;
## 899, Teiji Eldridhe, Sergi Erde, 


##7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.

Select *
From `employees`
Where birth_date like ('%-12-25') and hire_date between '1990-1-1' and '1999-12-31'
	ORDER BY birth_date, hire_date desc;
## 362, Tremaine Eugenio, Gudjon Vakili






