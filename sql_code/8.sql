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