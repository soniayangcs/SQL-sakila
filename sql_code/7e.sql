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