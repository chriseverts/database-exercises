## 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
Use employees;
Select * 
From `employees`
Where first_name IN ('Irena','Vidya','Maya');
## 709 rows

## 3.Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
Select * 
From `employees`
Where first_name = 'Irena' or first_name = 'Vidya' or first_name =  'Maya';
## 709 rows, yes

##4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.

Select * 
From `employees`
Where (first_name = 'Irena' or first_name = 'Vidya' or first_name =  'Maya') and gender = 'm';
## 441 records returned

## 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.

Select Distinct	last_name
From `employees`
Where last_name LIKE 'e%';
## 40 rows

## 6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?

Select DISTINCT last_name
From `employees`
Where last_name LIKE ('%E') or ('E%');
## 132 ROWS
Select DISTINCT last_name
From `employees`
Where last_name LIKE ('%E'); 
## wtf

## 7.Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?

Select DISTINCT last_name
From `employees`
Where last_name LIKE ('E%E'); 
## 5 Rows

Select DISTINCT last_name
From `employees`
Where last_name LIKE ('%E');
## 132 Rows

## 8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
Select *		 
From `employees`
Where hire_date between '1990-1-1' and '1999-12-31';
## 135,214


## 9.Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
Select *
From `employees`
Where birth_date like ('%-12-25');
## 842 rows

## 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.

Select *
From `employees`
Where birth_date like ('%-12-25') and hire_date between '1990-1-1' and '1999-12-31';
## 362 rows

## 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.

Select DISTINCT last_name
From `employees`
Where last_name LIKE ('%q%'); 
## 10 rows

## 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?

Select DISTINCT last_name
From `employees`
Where last_name LIKE ('%q%') and last_name not like ('%qu%');
## 3 rows

