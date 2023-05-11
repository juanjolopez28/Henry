-- 1. Obtener un listado contactos que hayan ordenado productos de la subcategoría "Mountain Bikes",
-- entre los años 2000 y 2003, cuyo método de envío sea "CARGO TRANSPORT 5".
use adventureworks;

SELECT DISTINCT c.FirstName, c.LastName
FROM salesorderheader h
	JOIN contact c USING(ContactID)
	JOIN salesorderdetail d USING(SalesOrderID)
	JOIN product p using(ProductID)
	JOIN productsubcategory s using(ProductSubcategoryID)
	JOIN shipmethod e using(ShipMethodID)
WHERE year(h.OrderDate) BETWEEN 2000 AND 2003
AND s.Name = 'Mountain Bikes'
AND e.Name = 'CARGO TRANSPORT 5';

-- 2. Obtener un listado contactos que hayan ordenado productos de la subcategoría "Mountain Bikes",
-- entre los años 2000 y 2003 con la cantidad de productos adquiridos y ordenado por este valor,
-- de forma descendente

SELECT concat(c.FirstName, ' ', c.LastName) AS nombre_apellido, SUM(d.OrderQty) as Cantidad
FROM salesorderheader h
	JOIN contact c ON (h.ContactID = c.ContactID) -- Manera clásica
	JOIN salesorderdetail d USING(SalesOrderID) -- Usando la función USING()
	JOIN product p using(ProductID)
	JOIN productsubcategory s using(ProductSubcategoryID)
WHERE year(h.OrderDate) BETWEEN 2000 AND 2003
AND s.Name = 'Mountain Bikes'
GROUP BY c.FirstName, c.LastName
ORDER BY Cantidad DESC;

-- 3. Obtener un listado de cual fue el volumen de compra (cantidad) por año y método de envío.

SELECT year(h.OrderDate) AS Anio, e.Name AS MetodoEnvio, SUM(d.OrderQty) AS Cantidad 
FROM salesorderheader h
	JOIN salesorderdetail d ON (h.SalesOrderID = d.SalesOrderID)
	JOIN shipmethod e ON (e.ShipMethodID = h.ShipMethodID)
GROUP BY Anio, MetodoEnvio
ORDER BY Anio, MetodoEnvio;

-- 4. Obtener un listado por categoría de productos, con el valor total de ventas y productos vendidos.

SELECT c.Name AS Categoria, SUM(d.OrderQty) AS Cantidad , SUM(d.LineTotal) AS Total
FROM salesorderdetail d
	JOIN product p using(ProductID)
	JOIN productsubcategory s using(ProductSubcategoryID)
    JOIN productcategory c ON (c.ProductCategoryID = s.ProductCategoryID)
GROUP BY Categoria
ORDER BY Categoria;

-- 5. Obtener un listado por país (según la dirección de envío),
-- con el valor total de ventas y productos vendidos,
-- sólo para aquellos países donde se enviaron más de 15 mil productos.

SELECT cr.Name AS Pais, SUM(d.OrderQty) AS Cantidad , SUM(d.LineTotal) AS Total
FROM salesorderheader h
	JOIN salesorderdetail d ON (h.SalesOrderID = d.SalesOrderID)
	JOIN address a ON (h.ShipToAddressID = a.AddressID)
    JOIN stateprovince sp ON (a.StateProvinceID = sp.StateProvinceID)
    JOIN countryregion cr ON (sp.CountryRegionCode = cr.CountryRegionCode)
GROUP BY Pais
HAVING Cantidad > 15000
ORDER BY Pais;

-- Bonus track
# Cohortes que no tienen alumnos asignados
USE henry;
SELECT *
FROM cohorte as c
LEFT JOIN alumno as a ON (c.idCohorte=a.IdCohorte)
WHERE a.IdCohorte is null;




