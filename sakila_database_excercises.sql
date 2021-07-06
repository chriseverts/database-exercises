


## 1. How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?


SELECT d.dept_name, CONCAT(employees.first_name, ' ', employees.last_name) 
AS employee_name, s.salary, AVG(s.salary) AS avg_department_salary
FROM employees
JOIN salaries s ON employees.emp_no = s.emp_no
JOIN dept_manager ON s.emp_no = dept_manager.emp_no
JOIN departments d ON d.dept_no = dept_manager.dept_no
WHERE s.to_date > NOW() AND dept_manager.to_date > NOW()
ORDER BY dept_name;




##1. Display the first and last names in all lowercase of all the actors. 
SELECT lower(first_name) AS first_name, lower(last_name) AS last_name
  FROM actor;   
    
##2. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you could use to obtain this information?

SELECT * 
  FROM actor
    WHERE first_name LIKE ('joe');
    
  ##3. Find all actors whose last name contain the letters "gen":

SELECT * 
  FROM actor 	
    WHERE last_name LIKE ('%gen%');
    
##4. Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.


SELECT last_name, first_name  
  FROM actor 	
    WHERE last_name LIKE ('%li%');

##5 Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:

SELECT country_id, country
FROM country 
WHERE country IN 
('Afghanistan', 'Bangladesh', 'China');

##6 List the last names of all the actors, as well as how many actors have that last name.

SELECT last_name, count(last_name)
 FROM actor
   GROUP BY last_name;


##7 List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors

SELECT last_name, count(*) AS num_of_last_names
 FROM actor
   GROUP BY last_name HAVING count(*) >= 2;


##9. Use JOIN to display the first and last names, as well as the address, of each staff member.

SELECT first_name, last_name, address
  FROM staff
  JOIN address ON address.address_id = staff.address_id
 ORDER BY first_name;

  
##10 Use JOIN to display the total amount rung up by each staff member in August of 2005.


SELECT first_name, last_name, amount
  FROM staff
  JOIN payment ON payment.staff_id = staff.staff_id
  JOIN 
  WHERE payment.payment_date LIKE '2005-08-01'
  ORDER BY first_name;

SELECT payment.staff_id, staff.first_name, staff.last_name, payment.amount, payment.payment_date
FROM staff INNER JOIN payment ON
staff.staff_id = payment.staff_id AND payment_date LIKE '2005-08%';


##11 List each film and the number of actors who are listed for that film.

SELECT film.title, count(*) number_of_actors
  FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.title
ORDER BY number_of_actors DESC;



##12 How many copies of the film Hunchback Impossible exist in the inventory system?

SELECT film.title, count(*) number_of_copies
  FROM film
JOIN inventory ON film.film_id = inventory.film_id
WHERE film.title = 'Hunchback Impossible';

## 13 The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.

select title
from film 
where (title like 'K%' or title like 'Q%')
and language_id in (
	select language_id 
	from language 
	where name = 'English'
)
order by title;



##14 Use subqueries to display all actors who appear in the film Alone Trip.

SELECT first_name, last_name 
FROM actor
WHERE actor_id IN (
	SELECT actor_id
	FROM film_actor
	WHERE film_id IN (
		SELECT film_id FROM film WHERE title = 'Alone Trip'
	)
);


##15. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.


SELECT customer.first_name, customer.last_name, customer.email
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Canada';



## 16. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.



