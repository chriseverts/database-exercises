

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



SELECT t.title AS Title, 
       COUNT(t.title) AS Count
FROM titles AS t
JOIN dept_emp AS de ON de.emp_no = t.emp_no 
    AND de.to_date > CURDATE() 
    AND t.to_date > CURDATE()
JOIN departments AS d ON d.dept_no = de.dept_no 
    AND d.dept_name = 'Customer Service'
GROUP BY t.title;




