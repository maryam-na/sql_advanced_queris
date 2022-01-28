# List each pair of actors that have worked together.
use sakila;
SELECT 
    a1.film_id,
    CONCAT(a1.first_name, ' ', a1.last_name) AS actor1,
    CONCAT(a2.first_name, ' ', a2.last_name) AS actor2
FROM
    (SELECT 
        a.actor_id, a.first_name, a.last_name, fa.film_id
    FROM
        sakila.actor a
    JOIN sakila.film_actor fa ON a.actor_id = fa.actor_id) a1
        JOIN
    (SELECT 
        a.actor_id, a.first_name, a.last_name, fa.film_id
    FROM
        sakila.actor a
    JOIN sakila.film_actor fa ON a.actor_id = fa.actor_id) a2
on
    a1.film_id = a2.film_id
        AND a1.actor_id <> a2.actor_id;

# For each film, list actor that has acted in more films.
SELECT 
    f.title AS film_title,
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    COUNT(f.film_id) number_of_films
FROM
    sakila.actor a
        JOIN
    sakila.film_actor fa ON a.actor_id = fa.actor_id
        JOIN
    sakila.film f ON fa.film_id = f.film_id
GROUP BY f.film_id
ORDER BY 3 DESC;
