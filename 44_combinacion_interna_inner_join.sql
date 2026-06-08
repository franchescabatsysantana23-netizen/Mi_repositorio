/*Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla 
"provincias" donde registra los nombres de las provincias.*/

--1- Créelas con las siguientes estructuras:
drop table if exists clientes; 
drop table if exists provincias;

 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );

--2- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Torres Fabiola','Alem 777','Ibera',3);

--3- Obtenga los datos de ambas tablas, usando alias
     select 
	      c.codigo,c.nombre,c.domicilio,
		  c.ciudad,p.nombre
		  from clientes c inner join provincias p
		  on c.codigoprovincia=p.codigo

--4- Obtenga la misma información anterior pero ordenada por nombre de provincia.
           select 
	      c.codigo,c.nombre,c.domicilio,
		  c.ciudad,p.nombre
		  from clientes c inner join provincias p
		  on c.codigoprovincia=p.codigo
		  order by p.nombre
--5- Recupere los clientes de la provincia "Santa Fe" (2 registros devueltos)

       select 
	      c.codigo,c.nombre,c.domicilio,
		  c.ciudad,p.nombre
		  from clientes c inner join provincias p
		  on c.codigoprovincia=p.codigo
		  where p.nombre='Santa Fe'


/*
Segundo problema:
Un club dicta clases de distintos deportes. Almacena la información en una tabla llamada 
"inscriptos" que incluye el documento, el nombre, el deporte y si la matricula esta paga o no y una 
tabla llamada "inasistencias" que incluye el documento, el deporte y la fecha de la inasistencia.
1 - Cree las tablas:*/
drop table if exists inscriptos;
drop table if exists inasistencias;

 create table inscriptos(
  nombre varchar(30),
  documento char(8),
  deporte varchar(15),
  matricula char(1), --'s'=paga 'n'=impaga
  primary key(documento,deporte)
 );

 create table inasistencias(
  documento char(8),
  deporte varchar(15),
  fecha date
 );

--2- Ingrese algunos registros para ambas tablas:
 insert into inscriptos values('Juan Perez','22222222','tenis','s');
 insert into inscriptos values('Maria Lopez','23333333','tenis','s');
 insert into inscriptos values('Agustin Juarez','24444444','tenis','n');
 insert into inscriptos values('Marta Garcia','25555555','natacion','s');
 insert into inscriptos values('Juan Perez','22222222','natacion','s');
 insert into inscriptos values('Maria Lopez','23333333','natacion','n');

 insert into inasistencias values('22222222','tenis','2006-12-01');
 insert into inasistencias values('22222222','tenis','2006-12-08');
 insert into inasistencias values('23333333','tenis','2006-12-01');
 insert into inasistencias values('24444444','tenis','2006-12-08');
 insert into inasistencias values('22222222','natacion','2006-12-02');
 insert into inasistencias values('23333333','natacion','2006-12-02');

--3- Muestre el nombre, el deporte y las fechas de inasistencias, ordenado por nombre y deporte.
--Note que la condición es compuesta porque para identificar los registros de la tabla "inasistencias" necesitamos ambos campos.

select ins.nombre,ins.deporte, fecha
        from inscriptos ins  inner join inasistencias  ina
		on ins.documento =ina.documento  and ins.deporte=ina.deporte
		order by ins.nombre,ins.deporte


--4- Obtenga el nombre, deporte y las fechas de inasistencias de un determinado
--inscripto en un determinado deporte (3 registros)

select ins.nombre,ins.deporte, fecha
        from inscriptos ins  inner join inasistencias  ina
		on ins.documento =ina.documento  and ins.deporte=ina.deporte
		where ins.nombre='Juan Perez'
		
--5- Obtenga el nombre, deporte y las fechas de inasistencias de todos los
--inscriptos que pagaron la matrícula(4 registros)

select ins.nombre,ins.deporte, fecha
        from inscriptos ins  inner join inasistencias  ina
		on ins.documento =ina.documento  and ins.deporte=ina.deporte
		where ins.matricula='s'

