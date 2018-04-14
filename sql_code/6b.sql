#6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment. 

use sakila;

SELECT first_name, last_name, SUM(amount)
FROM payment p
LEFT JOIN staff s
ON s.staff_id = p.staff_id
GROUP BY p.staff_id
