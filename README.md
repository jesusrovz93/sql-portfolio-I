# SQL Portfolio – Data Analysis & Optimization

Este repositorio contiene una colección de scripts en SQL desarrollados en MySQL usando DBeaver, enfocados en análisis de datos, relaciones entre tablas y optimización de consultas.

## Objetivo

Demostrar habilidades prácticas en SQL aplicadas a escenarios reales, incluyendo:

* Exploración de datos
* Relaciones entre entidades (JOINs)
* Agregaciones y análisis
* Subconsultas y CTEs
* Optimización de queries mediante índices

---

## Estructura del proyecto

```
sql-portfolio/

01_world_basic_queries.sql
02_sakila_aggregate_functions.sql
03_sakila_grouping_and_case_analysis.sql
04_sakila_joins_and_relationships.sql
05_world_subqueries_and_advanced_queries.sql
06_sakila_indexing_and_query_optimization.sql
07_library_management_project.sql
```

---

## Bases de datos utilizadas

* **world** → análisis geográfico y poblacional
* **sakila** → análisis de negocio (clientes, pagos, películas)
* **Proyecto propio** → sistema de gestión de biblioteca

---

## Habilidades demostradas

### 1. Data Exploration

Consultas básicas para exploración inicial de datos y filtrado.

### 2. Aggregation & Grouping

Uso de funciones agregadas:

* COUNT()
* SUM()
* AVG()
* GROUP BY
* HAVING

### 3. JOINs & Relationships

Relación entre múltiples tablas usando:

* INNER JOIN
* LEFT JOIN

### 4. Subqueries & Advanced Queries

* Subconsultas
* Consultas anidadas
* Lógica más compleja de filtrado

### 5. Indexing & Optimization

* Creación de índices (B-Tree)
* Uso de EXPLAIN ANALYZE
* Mejora de rendimiento de queries

### 6. Data Modeling (Proyecto Biblioteca)

* Creación de esquema desde cero
* Relaciones entre entidades
* Queries orientadas a uso real

---

## Herramientas

* MySQL
* DBeaver

---

## Ejemplo de optimización

Antes de indexar:

```sql
EXPLAIN ANALYZE
SELECT * 
FROM customer
WHERE email = 'test@test.com';
```

Después de indexar:

```sql
CREATE INDEX idx_customer_email ON customer(email);

EXPLAIN ANALYZE
SELECT * 
FROM customer
WHERE email = 'test@test.com';
```

Resultado: mejora en tiempo de ejecución gracias al uso de índices.

---

## Proyecto destacado: Sistema de Biblioteca

Incluye:

* Diseño de base de datos
* Creación de tablas
* Inserción de datos
* Queries de análisis:

  * Libros más prestados
  * Usuarios más activos
  * Control de inventario

---

## Autor

Desarrollador enfocado en backend, análisis de datos y optimización de sistemas.

---
