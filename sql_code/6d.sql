#6d. How many copies of the film Hunchback Impossible exist in the inventory system?

use sakila;

SELECT title, COUNT(title) AS copies
FROM film f
LEFT JOIN inventory i
ON f.film_id = i.film_id
WHERE title = "Hunchback Impossible"