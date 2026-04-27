-- Vamos a crear nuestra propia base de datos y nuestras tablas

-- PROYECTO FINAL ## SISTEMA DE BIBLIOTECA

-- PRIMERO DECLARAMOS LA BASE DE DATOS ***************************************************


DROP DATABASE IF EXISTS libros_db;
CREATE DATABASE libros_db;
USE libros_db;

-- DENTRO DE LA BASE DE DATOS CREAMOS LAS TABLAS Y LAS COLUMNAS QUE EXISTIRAN DENTRO

-- CREACION DE TABLAS ***************************************************

CREATE TABLE libros(
	id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador unico (primary_key)
	titulo VARCHAR(100) NOT NULL,
	autor VARCHAR(100) NOT NULL,
	anio INT, -- Validacion basica que hade que anio > 1800
	disponible BOOLEAN DEFAULT TRUE
);

CREATE TABLE usuarios(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE -- unico y no repetido
);

-- Vamos a relacionar la tabla libros con usuarios (Clase 5 - Relaciones)
CREATE TABLE prestamos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	libro_id INT,
	usuario_id INT,
	fecha_prestamo DATE DEFAULT (CURRENT_DATE()),
	fecha_devolucion DATE,
	FOREIGN KEY (libro_id) REFERENCES libros(id), -- Aqui linkiamos en la primary key de los libros referenciados
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id)	
);

-- POBLADO DE DATOS ***************************************************
INSERT INTO libros(titulo, autor, anio) VALUES
	('Cien anios de soledad','Gabriel Garcia Marquez',1967),
	('1984','George Orwell',1949),
	('El principito','Antonie de Saint Exupery',1943),
	('Harry Potter y la piedra filosofal','JK Rowling',1997),
	('La sombra del viento','Carlos Ruiz',2001);

INSERT INTO usuarios (nombre, email) VALUES 
	('Ana Rodriguez','ana@gmail.com'),
	('Marcelo Gorriti','marcelo@gmail.com'),
	('Juan Caballero','juan@gmail.com');

INSERT INTO prestamos(libro_id,usuario_id) VALUES
	(1,1), -- Ana tiene el primer libro
	(3,2); -- Marcelo tiene el principito

UPDATE libros SET disponible = FALSE WHERE id IN (1,3);

-- Explorar libros:  
SELECT * FROM libros;

-- HAGAMOS CONSULTAS ***************************************************

-- Libros disponibles
SELECT titulo, autor, anio 
FROM libros
WHERE disponible = TRUE
ORDER BY anio DESC;

-- Vemamos quien tiene los libros prestados, usamos JOIN
SELECT
	u.nombre as usuario,
	l.titulo as titulo,
	p.fecha_prestamo as fecha_de_prestamo,
	DATEDIFF(CURRENT_DATE(), p.fecha_prestamo) AS dias_prestados
FROM prestamos p
JOIN libros l ON p.libro_id = l.id -- Relacion libros-prestamos
JOIN usuarios u ON p.usuario_id = u.id -- Relacion usuario--prestamo
WHERE p.fecha_devolucion IS NULL; -- Solo prestamos que no han sido devueltos

-- INDICES - OPTIMIZACION ***************************************************

-- Indexar libros por titulo - Busqueda por catalogo
CREATE INDEX idx_libros_titulos ON libros(titulos);

-- INDEXAR prestamos por los usuarios. Podemos tener el historial de prestamos de un usuario.
CREATE INDEX idx_prestamos_usuarios ON prestamos(usuarios_id);

-- Actividad adicional
-- 1 Extendedr el modelo (Normalizacion)
-- Nueva tabla de Autores, tenga id y se linkee con libros con un foreing_key es decir 
-- Update de libros para relacionar la tabla autores con los libros con un foreing_key
