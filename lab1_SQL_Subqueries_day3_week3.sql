USE sakila;
#1 Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT COUNT(film_id)
FROM film
	JOIN inventory
    USING(film_id)
WHERE title = 'Hunchback Impossible' ;

#2 List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT title
FROM film
WHERE length > (SELECT AVG(length)
				FROM film);

#3 Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT first_name, last_name
FROM actor
WHERE actor_id IN (SELECT actor_id
					FROM film_actor
					WHERE film_id = (SELECT film_id
									FROM film	
                                    WHERE title = 'Alone Trip'));

#4 Sales have been lagging among young families, and you want to target family movies for a promotion. Identify all movies categorized as family films.
SELECT title
FROM film
WHERE film_id IN (SELECT film_id
					FROM film_category
                    WHERE category_id = (SELECT category_id
										FROM category
                                        WHERE name = 'Family'));
 
 #5 Retrieve the name and email of customers from Canada using both subqueries and joins. To use joins, you will need to identify the relevant tables and their primary and foreign keys.
 SELECT first_name, last_name, email
 FROM customer   
 WHERE customer_id IN (SELECT customer_id
						FROM address 
                        WHERE city_id IN (SELECT city_id
											FROM city 
                                            WHERE country_id = (SELECT country_id
																FROM country 
                                                                WHERE country = 'Canada')));

SELECT first_name, last_name, email
FROM customer 
	JOIN address
    USING (address_id)
    JOIN city
    USING(city_id)
    JOIN country
    USING(country_id)
WHERE country = 'Canada';

#6 Determine which films were starred by the most prolific actor in the Sakila database. A prolific actor is defined as the actor who has acted in the most number of films. First, you will need to find the most prolific actor and then use that actor_id to find the different films that he or she starred in.
  SELECT actor_id, first_name, last_name, COUNT(actor_id)
  FROM actor
	JOIN film_actor
    USING (actor_id)
  GROUP BY film_id
  ORDER BY COUNT(actor_id) DESC;