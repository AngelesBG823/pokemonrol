\c angelesbg823
DROP DATABASE pokerols;
CREATE DATABASE pokerols;
\c pokerols

CREATE TABLE rol(
    id SERIAL, 
    nombre VARCHAR(50),
    descripcion VARCHAR,
    PRIMARY KEY (id)
);
SELECT * FROM rol;

CREATE TABLE usuario(
    rut VARCHAR(12),
    nombre VARCHAR(15),
    telefono INT,
    mail VARCHAR(40),
    genero VARCHAR(15),
    fecha_nacimiento DATE,
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES rol(id)
);
SELECT * FROM usuario;

INSERT INTO rol (nombre, descripcion)
VALUES ('administrador', 'control total');
INSERT INTO rol (nombre, descripcion)
VALUES ('marketing', 'editar y crear anuncios');
INSERT INTO rol (nombre, descripcion)
VALUES ('editor', 'editar y crear artículos');
INSERT INTO rol (nombre, descripcion)
VALUES ('suscriptor', 'leer artículos');
SELECT * FROM rol;

INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES('1-9', 'Juan Soto', 9999999, 'juan.soto@gmail.com', 'M', '2000-06-24', 1);
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES('2-7', 'Jorge Pérez', 8888888, 'jorge.perez@hotmail.com', 'M', '1998-03-12', 4);
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES('3-5', 'Sara Morales', 7777777, 'sara.morales@gmail.com', 'F', '1990-02-11');
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES('4-6', 'Rocío Verdugo', 5656665, 'larociov@gmail.com', 'F', '1989-07-18', 3);
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES('1-8', 'Tomás Valencia', 5555555, 'tontomas@gmail.com', 'M', '1985-03-10', 2);
SELECT * FROM usuario;

SELECT * FROM rol INNER JOIN usuario ON rol_id = usuario.rol_id;
SELECT * FROM rol JOIN usuario ON rol_id = usuario.rol_ID;

--qué roles tiene los de genero m
-- selecciona el nombre de la tabla rol donde el usuario tenga genero M
-- nombre está en la tabla rol
-- genero está en la tabla rol
SELECT rol.nombre FROM rol JOIN usuario ON rol.id = usuario.rol_id WHERE usuario.genero = 'M';

-- Otra forma de hacerlo en más de una línea:
-- SELECT rol.nombre
-- FROM rol JOIN usuario.rol_id
-- ON rol.id = usuario.rol_id
-- WHERE usuario.genero = 'M';

-- SELECT A.nombre AS rol_ejemplo2
-- FROM rol JOIN usuario
-- ON rol.id = 