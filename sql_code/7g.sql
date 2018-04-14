#7g. Write a query to display for each store its store ID, city, and country.

USE sakila;

SELECT s.store_id, city, country
FROM store s
LEFT JOIN customer cust
ON s.store_id = cust.store_id
LEFT JOIN staff st
ON s.store_id = st.store_id
LEFT JOIN address a
ON cust.address_id = a.address_id
LEFT JOIN city c
ON a.city_id = c.city_id
LEFT JOIN country ctry
ON c.country_id = ctry.country_id;