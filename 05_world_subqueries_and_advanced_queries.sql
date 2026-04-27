USE world;
#Ejercicio 1 >> Subconsulta con IN, Identificar paisese que contienen cuidades con mas de 5M de habitantes


SELECT
	Name, Continent
	FROM world.country c
	WHERE
		Code IN (
					
				SELECT DISTINCT Countrycode
				FROM world.city WHERE Population > 5000000
			
				); #Subconsulta que devuelve los codigos de paises con poblaciones > 5M

				
				
				
SELECT
	Language, CountryCode
	FROM world.countrylanguage cl1
	WHERE NOT EXISTS(	SELECT 1 FROM world.countrylanguage cl2 WHERE 
	cl2.Language  = cl1.Language # Mismo Idioma
	AND
	cl2.CountryCode != cl1.CountryCode # Diferente pais 
	#Modelo de M a N
	#Busca el mismo idioma en otros paises / Se detiene en el primer caso que cumple la condicion
	);


# EJERCICIO 3 Subconsulta escalar en SELECT >> Calcular % de poblacion que cada cuidad representa en el pais

# Usamos JOIN para obtener datos basicos del pais
# Usamos subsonculta escalar para el calculo especifico 
SELECT
	ci.Name AS CityName,
	ci.Population AS CityPopulation,
	co.Name AS CountryName,
	co.Population AS CountryPopulation,
	# Expresion que calcula el porcentaje con subconsulta
	ROUND(
	(ci.Population*100)/ (SELECT Population FROM world.country WHERE Code = ci.CountryCode), 1) AS Percentage_country
	# Devuelve el total de poblacion del pais
	FROM world.city ci
	JOIN
		world.country co ON ci.CountryCode = co.Code;