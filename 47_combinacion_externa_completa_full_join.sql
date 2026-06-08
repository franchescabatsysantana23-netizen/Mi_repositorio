/*Primer problema:
Un club dicta clases de distintos deportes. Almacena la información en una tabla llamada "deportes" 
en la cual incluye el nombre del deporte y el nombre del profesor y en otra tabla llamada 
"inscriptos" que incluye el documento del socio que se inscribe, el deporte y si la matricula está 
paga o no.
1- Cree las tablas:*/

drop table if exists deportes;
drop table if exists inscriptos;

 create table deportes(
  codigo serial,
  nombre varchar(30),
  profesor varchar(30),
  primary key (codigo)
 );
 create table inscriptos(
  documento char(8),
  codigodeporte smallint not null,
  matricula char(1) --'s'=paga 'n'=impaga
 );

--2- Ingrese algunos registros para ambas tablas:
 insert into deportes(nombre,profesor) values('tenis','Marcelo Roca');
 insert into deportes(nombre,profesor) values('natacion','Marta Torres');
 insert into deportes(nombre,profesor) values('basquet','Luis Garcia');
 insert into deportes(nombre,profesor) values('futbol','Marcelo Roca');
 
 insert into inscriptos values('22222222',3,'s');
 insert into inscriptos values('23333333',3,'s');
 insert into inscriptos values('24444444',3,'n');
 insert into inscriptos values('22222222',2,'s');
 insert into inscriptos values('23333333',2,'s');
 insert into inscriptos values('22222222',4,'n'); 
 insert into inscriptos values('22222222',5,'n'); 

--3- Muestre todos la información de la tabla "inscriptos", y consulte la tabla "deportes" para 
--obtener el nombre de cada deporte (6 registros)
   select documento,codigodeporte,matricula ,d.nombre nombre_deporte
     from inscriptos  join deportes d
	 on codigodeporte =codigo

--4- Empleando un "left join" con "deportes" obtenga todos los datos de los inscriptos (7 registros)
    select documento,codigodeporte,matricula ,d.nombre nombre_deporte
     from inscriptos left join deportes d
	 on codigodeporte =codigo

--5- Obtenga la misma salida anterior empleando un "rigth join".
       select 
	         i.documento,i.codigodeporte,i.matricula,d.nombre nombre_deporte 
		     from deportes d right join inscriptos i 
			 on d.codigo=i.codigodeporte
         
--6- Muestre los deportes para los cuales no hay inscriptos, empleando un "left join" (1 registro)
    select documento,codigodeporte,matricula ,d.codigo,d.nombre nombre_deporte
     from deportes d left join inscriptos i
	 on d.codigo=codigodeporte
      where documento is null

--7- Muestre los documentos de los inscriptos a deportes que no existen en la tabla "deportes" (1 registro)
    select documento,codigodeporte,matricula ,d.codigo,d.nombre nombre_deporte
     from inscriptos left join deportes d
	 on codigodeporte =codigo
      where d.codigo is null 

--8- Emplee un "full join" para obtener todos los datos de ambas tablas, incluyendo las inscripciones 
--a deportes inexistentes en "deportes" y los deportes que no tienen inscriptos (8 registros)

 select documento,codigodeporte,matricula ,d.nombre nombre_deporte
     from inscriptos full join deportes d
	 on codigodeporte =codigo