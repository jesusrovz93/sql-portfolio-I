USE sakila;
SELECT * FROM sakila.film;

SELECT  COUNT(*) AS total_peliculas FROM sakila.film;

SELECT COUNT(*) AS peliculas_costosas FROM sakila.film WHERE replacement_cost > 20;
SELECT COUNT(DISTINCT rating) AS tipos_rating FROM sakila.film;

SELECT SUM(replacement_cost) AS costo_reemplazo_total FROM sakila.film;
SELECT SUM(rental_duration) AS dias_renta_pg FROM sakila.film WHERE rating ="PG";
SELECT AVG(length) AS duracion_promedio_NC17 FROM sakila.film WHERE rating ="NC-17";
SELECT rating, AVG(rental_rate) AS tarifa_promedio FROM sakila.film GROUP BY rating;


#Min y Max
SELECT MIN(length) AS pelicula_min_duracion, MAX(length) AS pelicula_max_duracion FROM sakila.film;
SELECT rating, MIN(replacement_cost) AS minimo_costo, MAX(replacement_cost) AS maximo_costo from sakila.film GROUP BY rating;
