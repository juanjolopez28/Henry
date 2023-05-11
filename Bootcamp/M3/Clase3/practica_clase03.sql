use henry;
-- Alumno/s que ingresó/aron primero
-- No me sirve
SELECT nombre, apellido, fechaIngreso, count(*) AS cantidad
FROM alumno
GROUP BY fechaIngreso
ORDER BY fechaIngreso;

SELECT nombre, apellido, fechaIngreso
FROM alumno
WHERE fechaIngreso =
	(SELECT MIN(fechaIngreso)
    FROM alumno);
    
-- Cohortes sin alumnos registrados
SELECT *
FROM cohorte
WHERE idCohorte NOT IN
	(SELECT DISTINCT idCohorte FROM alumno);
    
-- Crear un vista
CREATE VIEW cohorte_sin_alumnos AS
SELECT *
FROM cohorte
WHERE idCohorte NOT IN
	(SELECT DISTINCT idCohorte FROM alumno);
    
-- Función de ventana
use checkpoint_m2;

-- Promedio de ventas por Fecha:
SELECT 	Fecha, 
		AVG(Precio * Cantidad) AS Promedio_Ventas
FROM venta
GROUP BY Fecha;

-- Unimos el promedio de ventas por fecha con las ventas por fecha:
SELECT 	v.Fecha,
		v.Precio * v.Cantidad AS Venta,
        v2.Promedio_Ventas
FROM venta v JOIN (	SELECT 	Fecha, 
						AVG(Precio * Cantidad) AS Promedio_Ventas
						FROM venta 
                        GROUP BY Fecha) v2
ON (v.Fecha = v2.Fecha);

SELECT v.Fecha,
		v.Precio * v.Cantidad AS venta,
        avg(v.Precio * v.Cantidad) OVER (PARTITION BY v.Fecha) AS promedio_ventas
FROM venta v
WHERE v.Fecha = '2015-01-01';
        
SELECT RANK() OVER (PARTITION BY v.Fecha ORDER BY v.Precio * v.Cantidad DESC) AS ranking_venta,
		v.Fecha,
        v.IdCliente,
        v.Precio,
        v.Cantidad,
        (v.Precio * v.Cantidad) as venta
FROM venta v;
-- WHERE v.Fecha = '2015-01-01';    
        
        
        
        
        
        
        

							