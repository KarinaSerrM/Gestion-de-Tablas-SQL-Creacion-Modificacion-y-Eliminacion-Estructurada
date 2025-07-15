# Gestión de Tablas SQL: Creación, Modificación y Eliminación Estructurada

Este repositorio documenta una serie de ejercicios prácticos sobre el manejo de estructuras en bases de datos relacionales utilizando SQL Server. Se abordan temas como la creación inicial de tablas, inserción y edición de registros, modificación estructural y depuración controlada.

## Objetivo

Practicar los comandos fundamentales para el diseño y gestión de tablas en SQL, fortaleciendo competencias en manipulación de estructuras y registros dentro de una base de datos.

## Flujo de trabajo

### 1. Creación de tabla "Ventas"
- Campos definidos: `IdOrden`, `FechaEntrega`, `NombreCliente`, `Estado`, entre otros.
- Inserción de registros representativos
- Verificación de la estructura con `SELECT` y `DESCRIBE`

### 2. Modificación estructural
- Renombrado de tabla de `Ventas` a `Ordenes` con `EXEC sp_rename`
- Agregado de nueva columna mediante `ALTER TABLE`  
  - Ejemplo: `ALTER TABLE Ordenes ADD Comentarios VARCHAR(100)`

### 3. Eliminación de registros y tablas
- Eliminación selectiva con `DELETE FROM Ordenes WHERE Estado = 'Cancelada'`
- Limpieza completa con `TRUNCATE TABLE Prueba`
- Eliminación definitiva con `DROP TABLE Prueba`

## Comandos utilizados

- `CREATE TABLE`  
- `INSERT INTO`  
- `SELECT`, `WHERE`, `ORDER BY`  
- `EXEC sp_rename`  
- `ALTER TABLE`, `ADD COLUMN`  
- `DELETE`, `TRUNCATE`, `DROP`

## Conclusiones

- La gestión estructural de tablas SQL es esencial para el control y limpieza de datos.
- Comandos como `sp_rename` y `ALTER TABLE` permiten evolucionar esquemas sin perder información.
- La combinación de `DELETE`, `TRUNCATE` y `DROP` permite depurar con distintos niveles de alcance y seguridad.

