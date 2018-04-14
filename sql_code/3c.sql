#3c. Now delete the middle_name column.

USE sakila;

ALTER TABLE actor DROP COLUMN middle_name;

#check to see if it worked
SELECT * FROM actor LIMIT 10