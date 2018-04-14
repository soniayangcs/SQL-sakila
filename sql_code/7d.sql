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
