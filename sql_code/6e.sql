/*6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
List the customers alphabetically by last name:*/

use sakila;

SELECT first_name, last_name, SUM(amount) AS total_paid
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY p.customer_id
ORDER BY last_name ASC