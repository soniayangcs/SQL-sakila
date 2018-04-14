#6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:

use sakila;

SELECT first_name, last_name, address
FROM staff s
LEFT JOIN address a
ON s.address_id = a.address_id;

