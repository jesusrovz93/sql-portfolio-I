
use world;
show tables;


SELECT Name, Continent from world.country;

SELECT Name, Population FROM world.country WHERE Continent = "Europe";

SELECT Name FROM world.city c ORDER BY Name;

SELECT Name FROM world.country c LIMIT 5;


SELECT Name, Population FROM world.country c 
WHERE Continent = "Asia" AND c.Population > 100000000;


Select Name, Population, c.CountryCode untr FROM world.city c 
ORDER BY c.CountryCode ASC, population DESC;


SELECT Name, IndepYear  from world.country c  
where  IndepYear BETWEEN 1900 and 2000;


SELECT Name AS "Nombre de Pais" , 
(Population/1000000) AS "Poblacion(Millones)" FROM world.country c;

SELECT Name, ( GNP/Population) AS "GNP PER CAPITA" 
FROM world.country WHERE Population > 0;


SELECT Name from world.city c WHERE Name LIKE "New%";


SELECT Name  FROM world.country c WHERE IndepYear IS NULL;

SELECT Name from world.city c  where c.CountryCode 
IN(SELECT Code From world.country WHERE Continent = "Europe"); vghuyobjkn   

































