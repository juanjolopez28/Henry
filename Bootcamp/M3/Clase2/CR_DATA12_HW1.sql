-- HOMEWORK 1 M3
USE adventureworks;

DROP PROCEDURE totalOrdenes;
DROP PROCEDURE IF EXISTS totalOrdenes;

SELECT * FROM salesorderheader;
SELECT * FROM salesorderdetail;
-- DROP TABLE IF EXISTS nombre_tabla;
-- 1)
DELIMITER $$ 

CREATE PROCEDURE totalOrdenes(IN fechaOrden DATE)
BEGIN 
	SELECT COUNT(*)
    FROM salesorderheader
    WHERE DATE(OrderDate) = fechaOrden;
END $$

DELIMITER ;

CALL totalOrdenes('2002-01-01');
CALL totalOrdenes('2001-07-01');

SELECT COUNT(*)    
FROM salesorderheader
WHERE OrderDate = '2001-07-01';

-- 2)
-- creat tablea sada
-- NOMBRE VARCHAR(50)
SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS margenBruto;

DELIMITER $$

CREATE FUNCTION margenBruto(precio DECIMAL(15,3), margen DECIMAL(9,2)) RETURNS DECIMAL (15,3)
BEGIN
	DECLARE margenBruto DECIMAL(15,3);
    
    SET margenBruto = precio * margen;
    
    RETURN margenBruto;
END $$

DELIMITER ;

SELECT margenBruto(100.50, 1.2);

SELECT margenBruto(ListPrice, 1.2) -- 120%
FROM product
WHERE ListPrice != 0; -- <> / > 

SELECT margenBruto(UnitPrice, 1.5) -- 150%
FROM salesorderdetail
WHERE UnitPrice <> 0;

-- 3) 20% == 100% + 20% = 120% == 1.2

SELECT * FROM product;
SET @margen = 1.2;

SELECT ProductID, Name, ProductNumber, ListPrice,
		margenBruto(StandardCost, 1.2) as MargenPropuesto,
        ListPrice - margenBruto(StandardCost, 1.2) as Diferencia
FROM product
WHERE ListPrice <> 0 AND StandardCost != 0
ORDER BY Name ASC;

-- 100 -> 120 -> 100% + 20% -> 1.2

SELECT ProductID, Name, ProductNumber, ListPrice,
		margenBruto(StandardCost, @margen) as MargenPropuesto,
        ListPrice - margenBruto(StandardCost, @margen) as Diferencia
FROM product
WHERE ListPrice <> 0 AND StandardCost != 0
ORDER BY Name ASC;

SELECT @margen;
SELECT margenBruto(100.50, @margen);

-- 4) 

SELECT * FROM salesorderheader;

DROP PROCEDURE IF EXISTS gastoTransporte;

DELIMITER $$

CREATE PROCEDURE gastoTransporte(IN fechaDesde DATE, IN fechaHasta DATE)
BEGIN
	SELECT CustomerID, SUM(Freight) AS Total_Transporte
    FROM salesorderheader
    WHERE OrderDate BETWEEN fechaDesde AND fechaHasta
    GROUP BY CustomerID
    ORDER BY Total_Transporte DESC
    LIMIT 10;
END $$

DELIMITER ; 

CALL gastoTransporte('2002-01-01','2002-01-31'); -- Mes de enero 2002
CALL gastoTransporte('2002-01-01','2002-12-31'); -- Año entero de 2002

-- 5)
SHOW COLUMNS FROM shipmethod;
SELECT * FROM shipmethod;
SELECT NOW(), CURRENT_USER();

DROP PROCEDURE IF EXISTS cargarShipmethod;

DELIMITER //

CREATE PROCEDURE cargarShipmethod(IN nombre VARCHAR(50), IN base DOUBLE, IN rate DOUBLE)
BEGIN
	INSERT INTO shipmethod(Name, ShipBase, ShipRate, ModifiedDate)
    VALUES (nombre, base, rate, NOW());
END //

DELIMITER ; 

CALL cargarShipmethod('Prueba', 1.5, 3.5);

SELECT rowguid FROM shipmethod;

SELECT * FROM customer;
SELECT * FROM salesorderheader;

SELECT  s.TotalDue, c.AccountNumber
FROM salesorderheader s
INNER JOIN customer c 
	ON (s.CustomerID = c.CustomerID);

SELECT * FROM contact;

SELECT s.PurchaseOrderNumber, CONCAT(c.FirstName,'_',c.LastName) as Nombre_Apellido
FROM salesorderheader s
LEFT JOIN contact c
ON (s.ContactID = c.ContactID);

SELECT s.PurchaseOrderNumber, CONCAT(c.FirstName,'_',c.LastName) as Nombre_Apellido
FROM salesorderheader s -- TABLA  A
LEFT JOIN contact c -- TABLA B
ON (s.ContactID = c.ContactID) -- A.Key = B.Key
UNION							-- FULL OUTER JOIN
SELECT s.PurchaseOrderNumber, CONCAT(c.FirstName,'_',c.LastName) as Nombre_Apellido
FROM salesorderheader s -- TABLA A
RIGHT JOIN contact c -- TABLA B
ON (s.ContactID = c.ContactID) -- A.Key = B.Key
WHERE s.ContactID IS NULL 
OR c.ContactID IS NULL;
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- CROSS JOIN
-- FULL JOIN = LEFT JOIN u RIGHT JOIN
SELECT s.PurchaseOrderNumber, CONCAT(c.FirstName,'_',c.LastName) as Nombre_Apellido
FROM contact c -- TABLA B
LEFT JOIN salesorderheader s -- TABLA A
ON (s.ContactID = c.ContactID); -- A.Key = B.Key
;

