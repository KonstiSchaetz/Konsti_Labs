USE sakila;

# CHALLENGE 1 
#1.1
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration
FROM film;

#1.2
SELECT FLOOR(AVG(length)) as avg_len_min, ROUND(AVG(length/60)) AS avg_len_hrs
FROM film;

#2.1
SELECT MIN(rental_date), MAX(return_date)
FROM rental;

SELECT DATEDIFF(DAY,'2005-09-02','2005-05-24') AS duration
FROM rental;

#2.2
SELECT rental_date, MONTH(rental_date), DAY(rental_date)
FROM rental
GROUP BY rental_date;

#2.3
SELECT rental_date, IF (weekday(rental_date) in (5,6), "weekend","workday") AS DAY_TYPE
FROM rental;

#3
SELECT title, IF(ISNULL(rental_duration),"NOT AVAILABLE",rental_duration)
FROM film;

#4
SELECT CONCAT(first_name, " ", last_name), SUBSTRING(email,1,3)
FROM customer
ORDER BY last_name ASC;

#CHALLENGE 2

#1.1
SELECT COUNT(film_id)
FROM film;

#1.2 & 1.3
SELECT COUNT(title) AS no_films, rating
FROM film
GROUP BY rating
ORDER BY no_films DESC;

#2
SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id;

#3.1 
SELECT rating,ROUND(AVG(length),1) AS mean_duration
FROM film
GROUP BY rating
ORDER BY mean_duration DESC;

#3.2 (?)
SELECT film_id,rating,ROUND(AVG(length),1) AS mean_duration
FROM film
WHERE mean_duration > 120
GROUP BY rating
ORDER BY mean_duration DESC;

#4
SELECT DISTINCT(last_name)
FROM actor;









	 