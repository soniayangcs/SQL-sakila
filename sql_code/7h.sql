#7h. List the top five genres in gross revenue in descending order. 
#(Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)

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
