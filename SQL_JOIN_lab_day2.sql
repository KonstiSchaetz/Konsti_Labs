USE sakila;

#1 List the number of films per category.

SELECT COUNT(title), c.name
FROM film_category AS fc
	JOIN film AS f
    USING(film_id)
    JOIN category AS c
    USING (category_id)
GROUP BY c.name;    

#2 Retrieve the store ID, city, and country for each store.
SELECT store_ID, city, country
FROM address AS a
	JOIN store AS s
    USING (address_id)
    JOIN city AS c
    USING (city_id)
    JOIN country AS cy
    USING (country_id)
 GROUP BY store_id;
 
 #3 Calculate the total revenue generated by each store in dollars.
 SELECT s.store_id, SUM(amount) as total_revenue
 FROM staff AS sf
	JOIN store AS s
    USING (store_id)
    JOIN payment AS p
    USING (staff_id)
 GROUP BY s.store_id;
 
 #4 Determine the average running time of films for each category.
 SELECT c.name,AVG(length) AS running_time
 FROM film_category cf
	JOIN film f
    USING(film_id)
    JOIN category c
    USING(category_id)
 GROUP BY c.name;
 
 #5 Identify the film categories with the longest average running time.
SELECT c.name,AVG(length) AS running_time
 FROM film_category cf
	JOIN film f
    USING(film_id)
    JOIN category c
    USING(category_id)
 GROUP BY c.name
 ORDER BY running_time DESC;
 
 #6 Display the top 10 most frequently rented movies in descending order.
 SELECT title, COUNT(rental_id) AS no_rented
 FROM inventory AS i
	JOIN film AS f
    USING (film_id)
    JOIN rental AS r
    USING(inventory_id)
GROUP BY title
ORDER BY no_rented DESC
LIMIT 10 ;

#7 Determine if "Academy Dinosaur" can be rented from Store 1.
SELECT count(f.title), s.store_id ,
CASE WHEN count(f.title) > 0 THEN 'yes' ELSE 'no'
END AS availability
FROM inventory AS i
	JOIN film AS f
    USING(film_id)
    JOIN store AS s
    USING(store_id)
GROUP BY s.store_id;

#8 Provide a list of all distinct film titles, along with their availability status in the inventory. Include a column indicating whether each title is 'Available' or 'NOT available.' Note that there are 42 titles that are not in the inventory, and this information can be obtained using a CASE statement combined with IFNULL."
SELECT DISTINCT(title),f.film_id, inventory_id, rental_id
#CASE WHEN IFNULL(inventory_id) = TRUE THEN "not available" ELSE "available"
#END AS availability_status
FROM inventory AS i
	JOIN film AS f
    USING(film_id)
    RIGHT JOIN rental AS r
    USING (inventory_id);