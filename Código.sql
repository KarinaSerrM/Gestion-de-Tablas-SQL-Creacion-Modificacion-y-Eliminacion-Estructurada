--Creaci�n de Tabla para las ventas de una tienda
CREATE TABLE dbo.Ventas (
    N�meroOrden INT PRIMARY KEY,
    FechaOrden DATETIME NOT NULL,
    FechaEntrega DATE,
    EstatusOrden VARCHAR(29) CHECK (EstatusOrden IN ('Pendiente', 'Cancelada', 'En Proceso', 'Completada')),
    NombreCliente VARCHAR(100) NOT NULL,
    DomicilioEntrega VARCHAR(200),
    CompraOnline CHAR(1) CHECK(CompraOnline IN ('S', 'N')),
    MetodoPago VARCHAR(30) CHECK (MetodoPago IN ('Tarjeta de Cr�dito', 'Tarjeta de D�bito', 'Efectivo')),
    Subtotal DECIMAL(10, 2),
    Observaciones VARCHAR(500)
);

-- 2. Insertar Datos mediante c�digo
INSERT INTO dbo.Ventas (
    N�meroOrden, FechaOrden, FechaEntrega, EstatusOrden, NombreCliente, DomicilioEntrega, CompraOnline, MetodoPago, Subtotal, Observaciones
)
VALUES
(10001, '2023-01-15 09:30:25', '2023-01-20', 'Completada', 'Abigael Garc�a', 'Bertha 123, Toluca', 'S', 'Tarjeta de Cr�dito', 1250.75, 'Entregar antes de las 5pm'),
(10002, '2023-02-16 14:15:33', '2023-02-18', 'En Proceso', 'Carlos L�pez', 'Porfirio D�az 606, Puebla', 'N', 'Efectivo', 899.99, 'El cliente pagar� al recibir'),
(10003, '2023-03-17 11:05:17', '2023-03-22', 'Pendiente', 'Ana P�rez', 'Av. Ju�rez 1005, Cdmx', 'S', 'Tarjeta de D�bito', 2345.50, 'Requiere factura'),
(10004, '2023-04-18 16:45:42', NULL, 'Cancelada', 'Patricia Mendoza', 'En Tienda', 'N', 'Tarjeta de Cr�dito', 175.25, 'El cliente cancel� por demora'),
(10005, GETDATE(), GETDATE(), 'Completada', 'Sara Hern�ndez', 'Avenida Morelos 654, Morelia', 'S', 'Tarjeta de D�bito', 560.80, 'Dejar en recepci�n');

--3. Cambiar el nombre de la tabla de �Ventas� a �Ordenes�
EXEC sp_rename 'dbo.Ventas', 'Ordenes';

--4. Agregar columna nueva para almacenar la Fecha de Env�o
ALTER TABLE dbo.Ordenes 
ADD FechaEnvio DATE;

--5. Cambio del nombre de la columna �CompraOnline� a �BanderaCompraOnline�
SELECT name --Debo eliminar la restricci�n que coloqu� al hacer la tabla y este comando me dar� el nombre de la restricci�n
FROM sys.check_constraints 
WHERE parent_object_id = OBJECT_ID('dbo.Ordenes') 
AND parent_column_id = COLUMNPROPERTY(OBJECT_ID('dbo.Ordenes'), 'CompraOnline', 'ColumnId');

ALTER TABLE dbo.Ordenes DROP CONSTRAINT CK__Ventas__CompraOn__6D2D2E85; --Elimino esta restricci�n de momento para poder ejecutar el cambio de nombre 

EXEC sp_rename 'dbo.Ordenes.CompraOnline', 'BanderaCompraOnline', 'COLUMN'; -- Ahora si ejecuto el cambio del nombre

-- 6. Crear la tabla "Prueba" con una sola columna e insertar 5 registros aleatorios
CREATE TABLE dbo.Prueba (ID INT IDENTITY(1,1) PRIMARY KEY, Valor NVARCHAR(50));

INSERT INTO dbo.Prueba (Valor)
VALUES ('Reg. 0011'), ('Reg. 0201'), ('Reg. 4021'), ('Reg. 0785'), ('Reg. 0945');

--7. TRUNCATE y  DROP TABLE en la tabla Prueba
TRUNCATE TABLE dbo.Prueba;

DROP TABLE dbo.Prueba;

--8. DELETE para eliminar registros en Estatus de la Orden que sea �Cancelada�, dentro de la tabla  �Ordenes� 
DELETE FROM dbo.Ordenes
WHERE EstatusOrden = 'Cancelada';