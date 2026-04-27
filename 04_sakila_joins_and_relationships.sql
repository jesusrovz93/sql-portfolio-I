SELECT 
    c.name AS category,
    COUNT(r.rental_id) AS rentas_totales,
    SUM(p.amount) AS total_generado,
    AVG(p.amount) AS total_generado_promedio_renta

FROM sakila.category c


# Relacion categoria-pelicula
INNER JOIN sakila.film_category fc 
    ON c.category_id = fc.category_id
 
#Obtenemos detalles de peliculas
INNER JOIN sakila.film f 
    ON fc.film_id = f.film_id

#Relacion con copias fisicas en inventario
INNER JOIN sakila.inventory i 
    ON f.film_id = i.film_id

INNER JOIN sakila.rental r 
    ON i.inventory_id = r.inventory_id

INNER JOIN sakila.payment p 
    ON r.rental_id = p.rental_id

GROUP BY c.name
ORDER BY total_generado DESC;

#Ejercicio 2 Actores mas populares.
SELECT 
    a.actor_id,
    CONCAT(a.first_name, ' ', a.last_name) AS nombre_actor,
    COUNT(f.film_id) AS conteo_peliculas,
    SUM(p.amount) AS total_generado

FROM actor a

INNER JOIN film_actor fa 
    ON a.actor_id = fa.actor_id

INNER JOIN film f 
    ON fa.film_id = f.film_id

INNER JOIN inventory i 
    ON f.film_id = i.film_id

INNER JOIN rental r 
    ON i.inventory_id = r.inventory_id

INNER JOIN payment p 
    ON r.rental_id = p.rental_id

GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY total_generado DESC
LIMIT 10;
	