DROP DATABASE henry; 
-- Creo la base de datos
/* Esto es un comentario
multilínea*/
CREATE DATABASE henry;
SHOW DATABASES;

USE henry;

-- Creo las tablas
CREATE TABLE carrera(
	idCarrera INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    PRIMARY KEY (idCarrera)
);

-- Estructura de la tabla
DESC carrera;

CREATE TABLE instructor(
	idInstructor INT NOT NULL AUTO_INCREMENT,
    cedulaIdentidad VARCHAR (25) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    fechaIncorporacion DATE,
    PRIMARY KEY (idInstructor)
);

CREATE TABLE cohorte(
	idCohorte INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(30) NOT NULL,
    idCarrera INT NOT NULL,
    idInstructor INT NOT NULL,
    fechaInicio DATE,
    fechaFinalizacion DATE,
    PRIMARY KEY (idCohorte),
    FOREIGN KEY (idCarrera) REFERENCES carrera(idCarrera),
    FOREIGN KEY (idInstructor) REFERENCES instructor(idInstructor)
);
DROP TABLE alumno;
CREATE TABLE alumno(
	idAlumno INT NOT NULL AUTO_INCREMENT,
    cedulaIdentidad VARCHAR (25) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    fechaIngreso DATE,
    idCohorte INT,
    PRIMARY KEY (idAlumno),
    FOREIGN KEY (idCohorte) REFERENCES cohorte(idCohorte)
);

-- Cambiar nombre
ALTER TABLE alumno RENAME COLUMN idAlumno TO id_alumno;
-- Cambiar todo
ALTER TABLE alumno CHANGE id_alumno idAlumno INT NOT NULL AUTO_INCREMENT;


    
