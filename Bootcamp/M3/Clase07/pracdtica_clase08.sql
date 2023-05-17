use henry;

CREATE TABLE IF NOT EXISTS auditoria_alumno (
	id_auditoria INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    fecha_y_hora DATETIME NOT NULL,
    usuario VARCHAR(50)NOT NULL,
    PRIMARY KEY (id_auditoria)
    );

DROP TRIGGER audit_alumno;
CREATE TRIGGER audit_alumno AFTER INSERT ON alumno
FOR EACH ROW
INSERT INTO auditoria_alumno (descripcion, fecha_y_hora, usuario)
VALUES (concat('Nueva insersión: ', NEW.idAlumno, NEW.nombre, NEW.apellido), NOW(), current_user());

