#3a. Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type.

USE sakila;

ALTER TABLE actor
ADD COLUMN middle_name varchar(45) AFTER first_name;

#check to see if it worked
SELECT * FROM actor LIMIT 10