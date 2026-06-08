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
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
 );

--2- Ingrese algunos registros en "socios":
 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');
 
--3- Ingrese algunos registros en "deportes":
 insert into deportes(nombre,profesor) values('basquet','Juan Juarez');
 insert into deportes(nombre,profesor) values('futbol','Pedro Perez');
 insert into deportes(nombre,profesor) values('natacion','Marina Morales');
 insert into deportes(nombre,profesor) values('tenis','Marina Morales');

--4- Inscriba a varios socios en el mismo deporte en el mismo año:
 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');

--5- Inscriba a un mismo socio en el mismo deporte en distintos años:
 insert into inscriptos values ('22222222',3,'2005','s');
 insert into inscriptos values ('22222222',3,'2007','n');

--6- Inscriba a un mismo socio en distintos deportes el mismo año:
 insert into inscriptos values ('24444444',1,'2006','s');
 insert into inscriptos values ('24444444',2,'2006','s');

--7- Ingrese una inscripción con un código de deporte inexistente y un documento de socio que no 
--exista en "socios":
-insert into inscriptos values ('26666666',0,'2006','s');

--8- Muestre el nombre del socio, el nombre del deporte en que se inscribió y el año empleando 
--diferentes tipos de join.

    select 
	   s.nombre,d.nombre,ins.anio
	from socios s left join inscriptos ins
	on s.documento =ins.documento  join deportes d
	on ins.codigodeporte=d.codigo


--9- Muestre todos los datos de las inscripciones (excepto los códigos) incluyendo aquellas 
--inscripciones cuyo código de deporte no existe en "deportes" y cuyo documento de socio no se 
--encuentra en "socios".

      select 
	  ins.documento, ins.codigodeporte,ins.anio, ins.matricula, 
	  s.nombre,s.domicilio,
	   ins.codigodeporte,ins.anio,ins.matricula,
	   d.nombre, d.profesor
	from socios s full join inscriptos ins
	on s.documento =ins.documento full join deportes d
	on ins.codigodeporte=d.codigo

   


--10- Muestre todas las inscripciones del socio con documento "22222222".
    select 
	   s.documento, s.nombre,s.domicilio,
	   ins.codigodeporte,ins.anio,ins.matricula,
	   d.nombre, d.profesor
	from socios s right join inscriptos ins
	on s.documento =ins.documento  join deportes d
	on ins.codigodeporte=d.codigo
	where s.documento='22222222'
