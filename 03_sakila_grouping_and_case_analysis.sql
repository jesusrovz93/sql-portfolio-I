use sakila;
# Selecionamos la  columna de clasificacion por edad, 
#seleccionamos caracteristicas especiales, 
#contamos cuantas peliculas hay en el grupo
#calculamos promedio de duracion por grupo
#sumamos el costo de reemplazo de cada grupo
#Luego agrupapos por la columna de rating y special features al mismo tiempo
#Al final ordenamos por rating y luego por cantidad de peliculas de manera descendente.
select rating,special_features, count(*) as total_peliculas, avg(length) as duracion_promedio,
SUM(replacement_cost) as costo_total 
FROM sakila.film 
group by rating,special_features
order by rating, total_peliculas desc;

# Peliculas en tres grupos segun su costo de reemplazo
SELECT
    CASE  # Inicia una expresion condiconal. Usada para crear un segmentador.
        WHEN replacement_cost < 15 THEN "Bajo"
        WHEN replacement_cost BETWEEN 15 AND 20 THEN "Medio"
        ELSE "Alto"
    END AS segmento_costo,#Crea una nueva columna con la segmentacion de categoria de costo

    COUNT(*) AS cantidad, # Contamos las peliculas en cada seggmento de costo
    AVG(rental_rate) AS tarifa_promedio, # Promedia el precio de renta o de alquiler
    AVG(length) AS duracion_promedio # Promedio de la duracion de cada pelicula
FROM sakila.film # Llamamos a la base de datos
GROUP BY segmento_costo # Agrupamos por categoria
ORDER BY cantidad DESC; # Ordenamos con cantidad


# Es mejor escribir primero en lenguaje natural lo que queremos hacer y luego lo implementamos.


# Veamos ahora agrupaciones con agregados MIN MAX

#  Ejercio 3 -> Obtengamos las peliculas con tiempo mayor y menor al promedio
select title, length
from sakila.film 
where length > (
select avg(length) from sakila.film
)
order by length desc;

#Ejercicio 4 -> Comparar el precio promedio de cada categoria contra el promedio general.
SELECT 
		rating, avg(rental_rate) as tarifa_promedio,
		
		(select avg(rental_rate) from sakila.film) as tarifa_global, # Primera subconsulta que obtiene  el primedio general para comparacion
		avg(rental_rate) - (select avg(rental_rate) from sakila.film) as diferencia #Segunda subconsulta que seria la desviacion estandart de cuanto se desvia cada rating del promedio
		
	from sakila.film
	group by rating 
	order by diferencia desc;
	
	
# Ejercicio 5 ->  Apartado 3 sera un listado de titulos por rating
	# El group concat une tosos los titulos con | entre ellos
	# SUBTRAINING_INDEX corta la cadena hasta el n 5
	# liMITACION -> No puedes controlar que 5 titulos se seleccionen, se selecionan los primeros que se enuentren
SELECT 
	rating,
	SUBSTRING_INDEX(group_concat(
	title separator ' | '), ' | ' , 5 ) as muestra_titulos,
	count(*) as total_peliculas
from sakila.film 
group by rating
order by total_peliculas desc;


# Ejercicio 6 -> DISTINCT, Crear un listado compacto que muestra todos los rating disponibles para cada tipo de caracteristica especial.

SELECT
	special_features,
	GROUP_CONCAT(
				distinct rating
				separator '|') as rating_disponibles,
	avg(replacement_cost) as costo_promedio
from sakila.film
group by special_features
order by count(*) desc;

# Ejercicio 7 -> WITH ROLLPU - Subtotales
# Subtotal por rating y por year
# Crea filas adicionales con subtotales
# Subtotal por rating( anio =NULL)
# Total general (rating t anio =  NULL)
# ifnull convierte los nulls en etiquetas legibles
SELECT 
	ifnull(rating, 'TOTAL') as rating, # Reemplaza los nulos por total
	ifnull(release_year, 'SUBTOTAL') as anio,
	count(*) as total,
	avg(length) as duracion_promedio
from sakila.film
group by rating, release_year with rollup;