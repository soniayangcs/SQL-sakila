/*4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, 
the name of Harpo's second cousin's husband's yoga teacher. 
Write a query to fix the record.*/

USE sakila;

UPDATE actor 
SET first_name ="HARPO" WHERE first_name = "GROUCHO";

SELECT * FROM actor 
WHERE first_name = "HARPO" AND last_name = "WILLIAMS"