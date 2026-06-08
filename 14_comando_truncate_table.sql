--Cree la tabla con la siguiente estructura,
DROP TABLE IF EXISTS MEDICAMENTOS;

CREATE TABLE MEDICAMENTOS (
	CODIGO SERIAL,
	NOMBRE VARCHAR(20),
	LABORATORIO VARCHAR(20),
	PRECIO FLOAT,
	CANTIDAD INTEGER,
	PRIMARY KEY (CODIGO)
)
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

---3- Elimine todos los registros con "delete"
DELETE FROM MEDICAMENTOS;

-- ingrese 2 registros
INSERT INTO
	MEDICAMENTOS (NOMBRE, LABORATORIO, PRECIO, CANTIDAD)
VALUES
	('Sertal', 'Roche', 5.2, 100);

INSERT INTO
	MEDICAMENTOS (NOMBRE, LABORATORIO, PRECIO, CANTIDAD)
VALUES
	('Amoxidal 500', 'Bayer', 15.60, 100);

--5- Vea los registros para verificar que continuó la secuencia al generar el valor para "codigo"
SELECT
	*
FROM
	MEDICAMENTOS;

--6- Vacíe la tabla con truncate table
TRUNCATE TABLE MEDICAMENTOS;

INSERT INTO
	MEDICAMENTOS (NOMBRE, LABORATORIO, PRECIO, CANTIDAD)
VALUES
	('Buscapina', 'Roche', 4.10, 200);

  --8- Vea los registros para verificar que al cargar el código reinició la secuencia en 1.
SELECT
	*
FROM
	MEDICAMENTOS;
  
