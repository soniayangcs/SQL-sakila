#2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:

USE sakila;

SELECT country_id, country
FROM country
WHERE country IN ( 'Afghanistan', 'Bangladesh', 'China')