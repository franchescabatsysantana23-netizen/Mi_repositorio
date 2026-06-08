--Primer Problema
--1- Créela con la siguiente estructura:
DROP TABLE IF EXISTS POSTGRESSSQLYA.CLIENTES;

CREATE TABLE POSTGRESSSQLYA.CLIENTES (
	CODIGO SERIAL,
	NOMBRE VARCHAR(30) NOT NULL,
	DOMICILIO VARCHAR(30),
	CIUDAD VARCHAR(20),
	PROVINCIA VARCHAR(20),
	TELEFONO VARCHAR(11),
	PRIMARY KEY (CODIGO)
);

--3- Ingrese algunos registros:
INSERT INTO
	POSTGRESSSQLYA.CLIENTES (NOMBRE, DOMICILIO, CIUDAD, PROVINCIA, TELEFONO)
VALUES
	(
		'Lopez Marcos',
		'Colon 111',
		'Cordoba',
		'Cordoba',
		'null'
	);

INSERT INTO
	POSTGRESSSQLYA.CLIENTES (NOMBRE, DOMICILIO, CIUDAD, PROVINCIA, TELEFONO)
VALUES
	(
		'Perez Ana',
		'San Martin 222',
		'Cruz del Eje',
		'Cordoba',
		'4578585'
	);

INSERT INTO
	POSTGRESSSQLYA.CLIENTES (NOMBRE, DOMICILIO, CIUDAD, PROVINCIA, TELEFONO)
VALUES
	(
		'Garcia Juan',
		'Rivadavia 333',
		'Villa del Rosario',
		'Cordoba',
		'4578445'
	);

INSERT INTO
	POSTGRESSSQLYA.CLIENTES (NOMBRE, DOMICILIO, CIUDAD, PROVINCIA, TELEFONO)
VALUES
	(
		'Perez Luis',
		'Sarmiento 444',
		'Rosario',
		'Santa Fe',
		NULL
	);

INSERT INTO
	POSTGRESSSQLYA.CLIENTES (NOMBRE, DOMICILIO, CIUDAD, PROVINCIA, TELEFONO)
VALUES
	(
		'Pereyra Lucas',
		'San Martin 555',
		'Cruz del Eje',
		'Cordoba',
		'4253685'
	);

INSERT INTO
	POSTGRESSSQLYA.CLIENTES (NOMBRE, DOMICILIO, CIUDAD, PROVINCIA, TELEFONO)
VALUES
	(
		'Gomez Ines',
		'San Martin 666',
		'Santa Fe',
		'Santa Fe',
		'0345252525'
	);

INSERT INTO
	POSTGRESSSQLYA.CLIENTES (NOMBRE, DOMICILIO, CIUDAD, PROVINCIA, TELEFONO)
VALUES
	(
		'Torres Fabiola',
		'Alem 777',
		'Villa del Rosario',
		'Cordoba',
		'4554455'
	);

INSERT INTO
	POSTGRESSSQLYA.CLIENTES (NOMBRE, DOMICILIO, CIUDAD, PROVINCIA, TELEFONO)
VALUES
	(
		'Lopez Carlos',
		NULL,
		'Cruz del Eje',
		'Cordoba',
		NULL
	);

INSERT INTO
	POSTGRESSSQLYA.CLIENTES (NOMBRE, DOMICILIO, CIUDAD, PROVINCIA, TELEFONO)
VALUES
	(
		'Ramos Betina',
		'San Martin 999',
		'Cordoba',
		'Cordoba',
		'4223366'
	);

INSERT INTO
	POSTGRESSSQLYA.CLIENTES (NOMBRE, DOMICILIO, CIUDAD, PROVINCIA, TELEFONO)
VALUES
	(
		'Lopez Lucas',
		'San Martin 1010',
		'Posadas',
		'Misiones',
		'0457858745'
	);

--3- Obtenga el total de los registros agrupados por ciudad y provincia (6 filas)
SELECT
	PROVINCIA,
	CIUDAD,
	COUNT(*) TOTAL
FROM
	POSTGRESSSQLYA.CLIENTES
GROUP BY
	1,
	2
SELECT
	PROVINCIA,
	CIUDAD,
	COUNT(*) TOTAL
FROM
	POSTGRESSSQLYA.CLIENTES
GROUP BY
	PROVINCIA,
	CIUDAD
	--4- Obtenga el total de los registros agrupados por ciudad y provincia sin considerar los que tienen menos de 2 clientes (3 filas)
SELECT
	PROVINCIA,
	CIUDAD,
	COUNT(*) TOTAL
FROM
	POSTGRESSSQLYA.CLIENTES
GROUP BY
	PROVINCIA,
	CIUDAD
HAVING
	COUNT(*) >= 2
	--Segundo Problema
	--1- Créela con la siguiente estructura:
DROP TABLE IF EXISTS POSTGRESSSQLYA.VISITANTES;

CREATE TABLE POSTGRESSSQLYA.VISITANTES (
	NOMBRE VARCHAR(30),
	EDAD SMALLINT,
	SEXO CHAR(1),
	DOMICILIO VARCHAR(30),
	CIUDAD VARCHAR(20),
	TELEFONO VARCHAR(11),
	MONTOCOMPRA DECIMAL(6, 2) NOT NULL
);

--2- Ingrese algunos registros:
INSERT INTO
	POSTGRESSSQLYA.VISITANTES
VALUES
	(
		'Susana Molina',
		28,
		'f',
		NULL,
		'Cordoba',
		NULL,
		45.50
	);

INSERT INTO
	POSTGRESSSQLYA.VISITANTES
VALUES
	(
		'Marcela Mercado',
		36,
		'f',
		'Avellaneda 345',
		'Cordoba',
		'4545454',
		22.40
	);

INSERT INTO
	POSTGRESSSQLYA.VISITANTES
VALUES
	(
		'Alberto Garcia',
		35,
		'm',
		'Gral. Paz 123',
		'Alta Gracia',
		'03547123456',
		25
	);

INSERT INTO
	POSTGRESSSQLYA.VISITANTES
VALUES
	(
		'Teresa Garcia',
		33,
		'f',
		DEFAULT,
		'Alta Gracia',
		'03547123456',
		120
	);

INSERT INTO
	POSTGRESSSQLYA.VISITANTES
VALUES
	(
		'Roberto Perez',
		45,
		'm',
		'Urquiza 335',
		'Cordoba',
		'4123456',
		33.20
	);

INSERT INTO
	POSTGRESSSQLYA.VISITANTES
VALUES
	(
		'Marina Torres',
		22,
		'f',
		'Colon 222',
		'Villa Dolores',
		'03544112233',
		95
	);

INSERT INTO
	POSTGRESSSQLYA.VISITANTES
VALUES
	(
		'Julieta Gomez',
		24,
		'f',
		'San Martin 333',
		'Alta Gracia',
		NULL,
		53.50
	);

INSERT INTO
	POSTGRESSSQLYA.VISITANTES
VALUES
	(
		'Roxana Lopez',
		20,
		'f',
		'null',
		'Alta Gracia',
		NULL,
		240
	);

INSERT INTO
	POSTGRESSSQLYA.VISITANTES
VALUES
	(
		'Liliana Garcia',
		50,
		'f',
		'Paso 999',
		'Cordoba',
		'4588778',
		48
	);

INSERT INTO
	POSTGRESSSQLYA.VISITANTES
VALUES
	(
		'Juan Torres',
		43,
		'm',
		'Sarmiento 876',
		'Cordoba',
		NULL,
		15.30
	);

--3- Obtenga el total de las compras agrupados por ciudad y sexo de aquellas filas que devuelvan un 
--valor superior a 50 (3 filas)
SELECT
	CIUDAD,
	SEXO,
	SUM(MONTOCOMPRA) TOTAL
FROM
	POSTGRESSSQLYA.VISITANTES
GROUP BY
	CIUDAD,
	SEXO
HAVING
	SUM(MONTOCOMPRA) > 50
	--4- Agrupe por ciudad y sexo, muestre para cada grupo el total de visitantes, la suma de sus compras 
	--y el promedio de compras, ordenado por la suma total y considerando las filas con promedio superior a 30 (3 filas)
SELECT
	CIUDAD,
	SEXO,
	COUNT(*) TOTAL_VISITANTES,
	SUM(MONTOCOMPRA) TOTAL_COMPRAS,
	AVG(MONTOCOMPRA) PROMEDIO_COMPRAS
FROM
	POSTGRESSSQLYA.VISITANTES
GROUP BY
	CIUDAD,
	SEXO
HAVING
	AVG(MONTOCOMPRA) > 30
ORDER BY
	SUM(MONTOCOMPRA)