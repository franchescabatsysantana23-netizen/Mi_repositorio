/*
Sintaxis general:

 create sequence NOMBRESECUENCIA
  start with VALORENTERO
  increment by VALORENTERO
  maxvalue VALORENTERO
  minvalue VALORENTERO
  cycle;
  
"start with" indica el valor desde el cual comenzará 
la generación de números secuenciales. Si no se especifica, se inicia con el valor que indique "minvalue".

La cláusula "increment by" especifica el incremento, es decir, la diferencia entre los números de la secuencia;
debe ser un valor numérico entero positivo o negativo diferente de 0. por defecto es 1;

"maxvalue" define el valor máximo para la secuencia. Si se omite, por defecto es 9223372036854775807.
 "minvalue" establece el valor mínimo de la secuencia. Si se omite será -9223372036854775808.

  - La cláusula "cycle" indica que, cuando la secuencia llegue a máximo valor (valor de "maxvalue") se reinicie, 
  comenzando con el mínimo valor ("minvalue") nuevamente, es decir, la secuencia vuelve a utilizar los números. 
  Si se omite, por defecto la secuencia se crea "nocycle", lo que produce un error si supera el máximo valor.

   drop sequence NOMBRESECUENCIA;
Si la secuencia depende de otro objeto (en este caso una tabla) no se procede al borrado), debemos primero borrar la tabla y luego la secuencia, o utilizar (borra los objetos asociados a la secuencia):

 drop sequence NOMBRESECUENCIA cascade;

modificacion de la secuencia 

alter sequence NOMBRESECUENCIA
  start with VALORENTERO
  increment by VALORENTERO
  maxvalue VALORENTERO
  minvalue VALORENTERO
  cycle;
 
*/



/*
Primer problema:
Una empresa registra los datos de sus empleados en una tabla llamada "empleados".
1 - Cree la secuencia "sec_legajoempleados" estableciendo el valor mínimo (1), máximo (999), 
valor inicial (100), valor de incremento (2) y no circular.*/

   create sequence sec_legajoempleados
   start with 100
   increment by 2
   maxvalue 999
   minvalue 1
   no cycle


---2- Cree la tabla;

drop table if exists postgresssqlya.empleados;

 create table postgresssqlya.empleados(
  legajo bigint default nextval('sec_legajoempleados'),
  documento char(8) not null,
  nombre varchar(30) not null,
  primary key(legajo)
 );

--3 - Ingrese algunos registros:
 insert into postgresssqlya.empleados(documento,nombre)
  values ('22333444','Ana Acosta');
 insert into postgresssqlya.empleados(documento,nombre)
  values ('23444555','Betina Bustamante');
 insert into postgresssqlya.empleados(documento,nombre)
  values ('24555666','Carlos Caseros');
 insert into postgresssqlya.empleados(documento,nombre)
  values ('25666777','Diana Dominguez');
 insert into postgresssqlya.empleados(documento,nombre)
  values ('26777888','Estela Esper');

--4 - Recupere los registros de la tabla empleados.
    select * from postgresssqlya.empleados;

--5 - Efectue un select de la secuencia.
select * from sec_legajoempleados;

--6 - Elimine la secuencia y la tabla asociada a dicha secuencia.
       drop table postgresssqlya.empleados;
       drop sequence sec_legajoempleados; 



--1 crear una secuencia sec_codigoaulainscriptos(valor inicial 1, incremento 1, valor maximo 2 y 
--debe ser circular)
create sequence sec_codigoaulainscriptos 
start with 1 
increment by 1
maxvalue 2
minvalue 1
cycle


--2 - Crear la tabla inscriptos:
drop table if exists postgresssqlya.inscriptos cascade;

 create table postgresssqlya.inscriptos(
  documento char(8) not null,
  nombre varchar(30) not null,
  codigocurso int default nextval('sec_codigoaulainscriptos'),
  primary key(documento)
 );

--3 - Insertar algunos registros:
insert into postgresssqlya.inscriptos(documento,nombre) values ('20000000','Rodriguez Pablo');
insert into postgresssqlya.inscriptos(documento,nombre) values ('30000000','Mercado Ana');
insert into postgresssqlya.inscriptos(documento,nombre) values ('40000000','Morello Luis');
insert into postgresssqlya.inscriptos(documento,nombre) values ('50000000','Prado Juan');
insert into postgresssqlya.inscriptos(documento,nombre) values ('60000000','Solis Maria');


--4 - Imprimir todos los alumnos del curso 1.
select * from postgresssqlya.inscriptos
where codigocurso=1

--5 - Imprimir todos los alumnos del curso 2
	   select * from postgresssqlya.inscriptos
where codigocurso=2
