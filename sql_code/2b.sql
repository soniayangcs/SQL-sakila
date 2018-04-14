#2b. Find all actors whose last name contain the letters GEN:

USE sakila;

SELECT *
FROM actor
WHERE last_name LIKE "%GEN%"