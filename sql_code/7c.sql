/*7c. You want to run an email marketing campaign in Canada, 
for which you will need the names and email addresses of all Canadian customers. 
Use joins to retrieve this information.*/

USE sakila;

SELECT first_name, last_name, email, country
FROM customer cust
LEFT JOIN address a
ON cust.address_id = a.address_id
LEFT JOIN city c
ON a.city_id = c.city_id
LEFT JOIN country ctry
ON c.country_id = ctry.country_id
WHERE ctry.country = "Canada"