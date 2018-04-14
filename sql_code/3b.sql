#3b. You realize that some of these actors have tremendously long last names. Change the data type of the middle_name column to blobs.

USE sakila;

ALTER TABLE actor
MODIFY COLUMN middle_name blob;

#check to see if it worked
SELECT * FROM actor LIMIT 10