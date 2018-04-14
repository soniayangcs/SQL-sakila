#6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.

use sakila;

SELECT title, COUNT(actor_id)
FROM film f
LEFT JOIN film_actor a
ON f.film_id = a.film_id
GROUP BY title

