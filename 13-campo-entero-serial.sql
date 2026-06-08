DROP TABLE IF EXISTS MEDICAMENTOS;

CREATE TABLE MEDICAMENTOS (
	CODIGO SERIAL,
	NOMBRE VARCHAR(20),
	LABORATORIO VARCHAR(20),
	PRECIO FLOAT,
	CANTIDAD INTEGER,
	PRIMARY KEY (CODIGO)
)
-- 2- Visualice la estructura de la tabla medicamentos. 
SELECT
	TABLE_NAME,
	COLUMN_NAME,
	UDT_NAME,
	CHARACTER_MAXIMUM_LENGTH,
	IS_NULLABLE
FROM
	INFORMATION_SCHEMA.COLUMNS
WHERE
	TABLE_NAME = 'medicamentos'
INSERT INTO
	MEDICAMENTOS (NOMBRE, LABORATORIO, PRECIO, CANTIDAD)
VALUES
	('Sertal', 'Roche', 5.2, 100);

INSERT INTO
	MEDICAMENTOS (NOMBRE, LABORATORIO, PRECIO, CANTIDAD)
VALUES
	('Buscapina', 'Roche', 4.10, 200);

INSERT INTO
	MEDICAMENTOS (NOMBRE, LABORATORIO, PRECIO, CANTIDAD)
VALUES
	('Amoxidal 500', 'Bayer', 15.60, 100);

--4- Verifique que el campo "código" generó los valores de modo automático.
SELECT
	*
FROM
	MEDICAMENTOS;

--segundo problema 
DROP TABLE IF EXISTS PELICULAS;

CREATE TABLE PELICULAS (
	CODIGO SERIAL,
	TITULO VARCHAR(40),
	ACTOR VARCHAR(20),
	DURACION INT,
	PRIMARY KEY (CODIGO)
)
--2- Visualice la estructura de la tabla "peliculas".
SELECT
	TABLE_NAME,
	COLUMN_NAME,
	UDT_NAME,
	CHARACTER_MAXIMUM_LENGTH,
	IS_NULLABLE
FROM
	INFORMATION_SCHEMA.COLUMNS
WHERE
	TABLE_NAME = 'peliculas'
INSERT INTO
	PELICULAS (TITULO, ACTOR, DURACION)
VALUES
	('Mision imposible', 'Tom Cruise', 120);

INSERT INTO
	PELICULAS (TITULO, ACTOR, DURACION)
VALUES
	('Harry Potter y la piedra filosofal', 'xxx', 180);

INSERT INTO
	PELICULAS (TITULO, ACTOR, DURACION)
VALUES
	('Harry Potter y la camara secreta', 'xxx', 190);

INSERT INTO
	PELICULAS (TITULO, ACTOR, DURACION)
VALUES
	('Mision imposible 2', 'Tom Cruise', 120);

INSERT INTO
	PELICULAS (TITULO, ACTOR, DURACION)
VALUES
	('La vida es bella', 'zzz', 220);

--4- Seleccione todos los registros y verifique la carga automática de los códigos.
SELECT
	*
FROM
	PELICULAS;

--5- Actualice las películas cuyo código es 3 colocando en "actor" 'Daniel R.'
UPDATE PELICULAS
SET
	ACTOR = 'Daniel R.'
WHERE
	CODIGO = 3
	---6- Elimine la película 'La vida es bella'.
DELETE FROM PELICULAS
WHERE
	TITULO = 'La vida es bella'
	--7- Elimine todas las películas cuya duración sea igual a 120 minutos.
DELETE FROM PELICULAS
WHERE
	DURACION = 120
	--8- Visualice los registros.
SELECT
	*
FROM
	PELICULAS;

--9- Ingrese el siguiente registro, sin valor para la clave primaria:
INSERT INTO
	PELICULAS (TITULO, ACTOR, DURACION)
VALUES
	('Mujer bonita', 'Richard Gere', 120);