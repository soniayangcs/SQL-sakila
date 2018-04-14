#1a. Display the first and last names of all actors from the table actor.

use sakila;

select first_name, last_name
from actor

#1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name. 

USE sakila;

SELECT CONCAT_WS(" ", `first_name`, `last_name`) AS `Actor Name` FROM actor

/*2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." 
What is one query would you use to obtain this information?*/

USE sakila;

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = "Joe"

#2b. Find all actors whose last name contain the letters GEN:

USE sakila;

SELECT *
FROM actor
WHERE last_name LIKE "%GEN%"

#2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:

USE sakila;

SELECT *
FROM actor
WHERE last_name LIKE "%LI%"
ORDER BY last_name, first_name

#2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:

USE sakila;

SELECT country_id, country
FROM country
WHERE country IN ( 'Afghanistan', 'Bangladesh', 'China')

#3a. Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type.

USE sakila;

ALTER TABLE actor
ADD COLUMN middle_name varchar(45) AFTER first_name;

#check to see if it worked
SELECT * FROM actor LIMIT 10

#3b. You realize that some of these actors have tremendously long last names. Change the data type of the middle_name column to blobs.

USE sakila;

ALTER TABLE actor
MODIFY COLUMN middle_name blob;

#check to see if it worked
SELECT * FROM actor LIMIT 10

#3c. Now delete the middle_name column.

USE sakila;

ALTER TABLE actor DROP COLUMN middle_name;

#check to see if it worked
SELECT * FROM actor LIMIT 10

#4a. List the last names of actors, as well as how many actors have that last name.

USE sakila;

SELECT last_name, COUNT(last_name) AS last_name_count
FROM actor
GROUP BY last_name

#4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors

USE sakila;

SELECT last_name, COUNT(last_name) AS last_name_count
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) >= 2


/*4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, 
the name of Harpo's second cousin's husband's yoga teacher. 
Write a query to fix the record.*/

USE sakila;

UPDATE actor 
SET first_name ="HARPO" WHERE first_name = "GROUCHO";

SELECT * FROM actor 
WHERE first_name = "HARPO" AND last_name = "WILLIAMS"

/*4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! 
In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO. 
Otherwise, change the first name to MUCHO GROUCHO, as that is exactly what the actor will be with the grievous error. 
BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO MUCHO GROUCHO, HOWEVER! (Hint: update the record using a unique identifier.)*/

USE sakila;

UPDATE actor
SET first_name = 
CASE 
	WHEN first_name = "HARPO" 
		THEN "GROUCHO"
	ELSE "MUCHO GROUCHO"
 END
 WHERE actor_id = 172; #use id as unique identifier
 

SELECT * FROM ACTOR 
WHERE last_name = "WILLIAMS"

/*5a. You cannot locate the schema of the address table. Which query would you use to re-create it? 
Hint: https://dev.mysql.com/doc/refman/5.7/en/show-create-table.html*/

USE sakila;

SHOW CREATE TABLE address;

#6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:

use sakila;

SELECT first_name, last_name, address
FROM staff s
LEFT JOIN address a
ON s.address_id = a.address_id;


#6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment. 

use sakila;

SELECT first_name, last_name, SUM(amount)
FROM payment p
LEFT JOIN staff s
ON s.staff_id = p.staff_id
GROUP BY p.staff_id


#6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.

use sakila;

SELECT title, COUNT(actor_id)
FROM film f
LEFT JOIN film_actor a
ON f.film_id = a.film_id
GROUP BY title


#6d. How many copies of the film Hunchback Impossible exist in the inventory system?

use sakila;

SELECT title, COUNT(title) AS copies
FROM film f
LEFT JOIN inventory i
ON f.film_id = i.film_id
WHERE title = "Hunchback Impossible"

/*6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
List the customers alphabetically by last name:*/

use sakila;

SELECT first_name, last_name, SUM(amount) AS total_paid
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY p.customer_id
ORDER BY last_name ASC

/*7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. 
As an unintended consequence, films starting with the letters K and Q have also soared in popularity. 
Use subqueries to display the titles of movies starting with the letters K and Q whose language is English. */

USE sakila;

SELECT title FROM film
WHERE language_id IN (
	SELECT language_id FROM `language`
    WHERE name = "English"
)
AND 
(title LIKE "K%") OR (title LIKE "Q%") 

#7b. Use subqueries to display all actors who appear in the film Alone Trip.

USE sakila;

SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
	SELECT actor_id FROM film_actor
    WHERE film_id IN (
		SELECT film_id FROM film
        WHERE title = "Alone Trip"
    )
)

/*7c. You want to run an email marketing campaign in Canada, 
for which you will need the names and email addresses of all Canadian customers. 
Use joins to retrieve this information.*/

USE sakila;

SELECT first_name, last_name, email, country
FROM customer cust
LEFT JOIN address a
ON cust.address_id = a.address_id
LEFT JOIN city c
ON a.city_id = c.city_id
LEFT JOIN country ctry
ON c.country_id = ctry.country_id
WHERE ctry.country = "Canada"

/*7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
Identify all movies categorized as famiy films.*/

USE sakila;

SELECT title, cat.name
FROM film f
LEFT JOIN film_category fc
ON f.film_id = fc.film_id
LEFT JOIN category cat
ON fc.category_id = cat.category_id
WHERE cat.name = "Family"
GROUP BY title


#7e. Display the most frequently rented movies in descending order.

USE sakila;

SELECT i.film_id, f.title, COUNT(r.inventory_id)
FROM inventory i
LEFT JOIN rental r
ON i.inventory_id = r.inventory_id
LEFT JOIN film_text f 
ON i.film_id = f.film_id
GROUP BY r.inventory_id
ORDER BY COUNT(r.inventory_id) DESC;

#7f. Write a query to display how much business, in dollars, each store brought in.

USE sakila;

SELECT s.store_id, SUM(amount)
FROM store s
LEFT JOIN staff stf
ON s.store_id = stf.store_id
LEFT JOIN payment p 
ON p.staff_id = stf.staff_id
GROUP BY s.store_id
ORDER BY SUM(amount)

#7g. Write a query to display for each store its store ID, city, and country.

USE sakila;

SELECT s.store_id, city, country
FROM store s
LEFT JOIN customer cust
ON s.store_id = cust.store_id
LEFT JOIN staff st
ON s.store_id = st.store_id
LEFT JOIN address a
ON cust.address_id = a.address_id
LEFT JOIN city c
ON a.city_id = c.city_id
LEFT JOIN country ctry
ON c.country_id = ctry.country_id;

/*7h. List the top five genres in gross revenue in descending order. 
(Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)*/

USE sakila;

SELECT name, SUM(p.amount)
FROM category c
LEFT JOIN film_category fc
ON fc.category_id = c.category_id
LEFT JOIN inventory i
ON i.film_id = fc.film_id
LEFT JOIN rental r
ON r.inventory_id = i.inventory_id
LEFT JOIN payment p
ON p.rental_id = r.rental_id
GROUP BY name
LIMIT 5


/*8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. 
Use the solution from the problem above to create a view. 
If you haven't solved 7h, you can substitute another query to create a view.*/

USE sakila;

CREATE VIEW top_five_genres AS

SELECT name, SUM(p.amount)
FROM category c
LEFT JOIN film_category fc
ON fc.category_id = c.category_id
LEFT JOIN inventory i
ON i.film_id = fc.film_id
LEFT JOIN rental r
ON r.inventory_id = i.inventory_id
LEFT JOIN payment p
ON p.rental_id = r.rental_id
GROUP BY name
LIMIT 5;

#8b. How would you display the view that you created in 8a?
SELECT * FROM top_five_genres;

#8c. You find that you no longer need the view top_five_genres. Write a query to delete it.
DROP VIEW top_five_genres;
