/*Primer problema:
Un club dicta clases de distintos deportes. En una tabla llamada "socios" guarda los datos de los 
socios, en una tabla llamada "deportes" la información referente a los diferentes deportes que se 
dictan y en una tabla denominada "inscriptos", las inscripciones de los socios a los distintos 
deportes.
Un socio puede inscribirse en varios deportes el mismo año. Un socio no puede inscribirse en el 
mismo deporte el mismo año. Distintos socios se inscriben en un mismo deporte en el mismo año.

1- Cree las tablas con las siguientes estructuras:*/

  drop table if exists socios;
  drop table if exists deportes;
  drop table if exists inscriptos;
  
 create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );
 create table deportes(
  codigo serial,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte smallint not null,
  año char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,año)
 );

--2- Ingrese algunos registros en las 3 tablas:
 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

 insert into deportes(nombre,profesor) values('basquet','Juan Juarez');
 insert into deportes(nombre,profesor) values('futbol','Pedro Perez');
 insert into deportes(nombre,profesor) values('natacion','Marina Morales');
 insert into deportes(nombre,profesor) values('tenis','Marina Morales');

 insert into inscriptos values ('22222222',3,'2016','s');
 insert into inscriptos values ('23333333',3,'2016','s');
 insert into inscriptos values ('24444444',3,'2016','n');
 insert into inscriptos values ('22222222',3,'2015','s');
 insert into inscriptos values ('22222222',3,'2017','n');
 insert into inscriptos values ('24444444',1,'2016','s');
 insert into inscriptos values ('24444444',2,'2016','s');

--3- Realice una consulta en la cual muestre todos los datos de las inscripciones, incluyendo el 
--nombre del deporte y del profesor.Esta consulta es un join.

    select 
	     i.documento, i.codigodeporte, 
	       i.año, i.matricula,
	       d.nombre, d.profesor
	 from inscriptos i left join  deportes d
	   on i.codigodeporte=d.codigo
	
--4- Utilice el resultado de la consulta anterior como una tabla derivada para emplear en lugar de una 
--tabla para realizar un "join" y recuperar el nombre del socio, el deporte en el cual está inscripto, 
--el año, el nombre del profesor y la matrícula.

         select s.nombre, td.nombre, td.año,
		       td.profesor,td.matricula  
			   from socios s 
			   join ( select d.codigo, d.nombre, d.profesor,
	                         i.documento,i.codigodeporte, 
			                 i.año, i.matricula
	                         from deportes d 
			                 right join inscriptos i 
			                 on d.codigo=i.codigodeporte) td
			   on s.documento=td.documento				 
 

		