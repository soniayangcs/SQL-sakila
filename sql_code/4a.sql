#4a. List the last names of actors, as well as how many actors have that last name.

USE sakila;

SELECT last_name, COUNT(last_name) AS last_name_count
FROM actor
GROUP BY last_name