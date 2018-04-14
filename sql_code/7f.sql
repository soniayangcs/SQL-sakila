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