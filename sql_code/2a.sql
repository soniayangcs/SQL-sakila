/*2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." 
What is one query would you use to obtain this information?*/

USE sakila;

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = "Joe"