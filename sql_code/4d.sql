/*4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! 
In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO. 
Otherwise, change the first name to MUCHO GROUCHO, as that is exactly what the actor will be with the grievous error. 
BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO MUCHO GROUCHO, HOWEVER! (Hint: update the record using a unique identifier.)*/

USE sakila;

UPDATE actor
SET first_name = 
CASE 
	WHEN first_name = "HARPO" 
		THEN "GROUCHO"
	ELSE "MUCHO GROUCHO"
 END
 WHERE actor_id = 172; #use id as unique identifier
 

SELECT * FROM ACTOR 
WHERE last_name = "WILLIAMS"