#1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name. 

USE sakila;

SELECT CONCAT_WS(" ", `first_name`, `last_name`) AS `Actor Name` FROM actor