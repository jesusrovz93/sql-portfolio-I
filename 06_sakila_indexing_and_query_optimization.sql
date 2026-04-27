USE sakila;

-- Ejercicio 1: Index B-Tree para búsquedas por release_year y length

DROP INDEX idx_film_year_length ON film;

CREATE INDEX idx_film_year_length 
ON sakila.film (release_year, length);



SELECT 
    title, 
    release_year, 
    length 
FROM sakila.film
WHERE release_year = 2006
  AND length BETWEEN 120 AND 180;



-- Ejercicio 2: Index B-Tree para búsqueda exacta de clientes por email

DROP INDEX idx_customer_email ON customer;

CREATE INDEX idx_customer_email
ON sakila.customer (email);


SELECT * 
FROM sakila.customer
WHERE email = 'KATHLEEN.ADAMS@sakilacustomer.org';


-- Ejercicio 3: Index Full Text para búsqueda avanzada en description

DROP INDEX idx_film_description ON film;

CREATE FULLTEXT INDEX idx_film_description 
ON sakila.film (description);


SELECT 
    title, 
    description
FROM sakila.film
WHERE MATCH(description)
AGAINST('+Drama' IN BOOLEAN MODE);
