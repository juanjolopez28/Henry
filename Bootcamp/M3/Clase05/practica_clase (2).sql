USE henry;
INSERT INTO carrera (nombre)
VALUES ('Data Science');

INSERT INTO instructor
VALUES(NULL, 'A3256', 'Ivan', 'Drago', '1960-05-12', '2023-01-01'),
		(NULL, 'B8545', 'Ana', 'Brizuela', '1999-03-15', '2023-02-01');
        
INSERT INTO cohorte
VALUES(NULL, 'DSFT01', 1, 1, '2023-05-05', '2023-10-05'),
		(NULL, 'DSFT02', 1, 2, '2023-06-05', '2023-11-05');
        
INSERT INTO alumno
VALUES (NULL, 'C2547', 'Juan', 'Carabeta', '1998-04-28', curdate(), 1),
		(NULL, 'C5874', 'Juana', 'Silvestre', '1995-06-28', curdate(), 1),
        (NULL, 'C9845', 'Rodrigo', 'Smith', '2005-08-28', curdate(), 2);

-- Actulizar datos
UPDATE alumno
SET nombre = 'Juan Carlos'
WHERE idAlumno = 1;

-- Borrar datos
DELETE FROM alumno
WHERE idAlumno = 3;

-- Traer datos
SELECT *
FROM alumno;

SELECT idAlumno, idAlumno * 1.21 AS alumnoConIva, apellido, cedulaIdentidad, fechaIngreso
FROM alumno;

SELECT *
FROM alumno
-- WHERE idAlumno = 2;
-- WHERE idAlumno >= 2;
-- WHERE idAlumno != 2;
-- WHERE fechaNacimiento >= '1996-01-01';
-- WHERE fechaNacimiento >= '1996-01-01' AND nombre = 'Rodrigo';
-- WHERE fechaNacimiento >= '1996-01-01' OR nombre = 'Rodrigo';
-- WHERE nombre LIKE '%ar%';
-- WHERE fechaNacimiento BETWEEN '1998-01-01' AND '1998-12-31';
-- WHERE nombre IN('Juana', 'Rodrigo');
WHERE nombre NOT IN('Juana', 'Rodrigo');

-- INNER JOIN
SELECT a.nombre, a.apellido, a.cedulaIdentidad, c.fechaInicio, c.fechaFinalizacion
FROM alumno a
INNER JOIN cohorte c ON (a.idCohorte = c.idCohorte);

UPDATE alumno
SET cedulaIdentidad = 'X2547'
WHERE cedulaIdentidad = 'C2547';
