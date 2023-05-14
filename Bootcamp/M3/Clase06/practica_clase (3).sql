use henry;

SELECT a.nombre, a.apellido, a.fechaNacimiento, a.fechaIngreso, ca.nombre AS nombre_carrera
FROM alumno a
INNER JOIN cohorte c ON(c.idCohorte = a.idCohorte)
INNER JOIN carrera ca ON(c.idCarrera = ca.idCarrera)
WHERE ca.nombre LIKE '%full stack%'
-- ORDER BY a.nombre;
-- ORDER BY fechaIngreso DESC, a.apellido;
ORDER BY 1, 2
-- LIMIT 2, 10;
LIMIT 5 OFFSET 2;

SELECT count(*) AS cantidad_alumnos
FROM alumno
WHERE idCohorte = 1235;

SELECT sum(idInstructor) AS suma_ids
FROM instructor;

-- SELECT avg(year(curdate()) - year(fechaNacimiento)) as edad_promedio
SELECT round(avg(datediff(curdate(), fechaNacimiento) / 365.25), 2) as edad_promedio
FROM alumno;

SELECT idCarrera, fechaInicio, count(*) as cantidad_cohortes
FROM cohorte
GROUP BY idCarrera, fechaInicio;

SELECT idCarrera, count(*) as cantidad_cohortes
FROM cohorte
GROUP BY idCarrera
HAVING cantidad_cohortes > 1
ORDER BY 2 DESC;
