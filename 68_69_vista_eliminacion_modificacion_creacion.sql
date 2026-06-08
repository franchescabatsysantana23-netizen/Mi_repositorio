/*Primer problema:
Un club dicta cursos de distintos deportes. Almacena la información en varias tablas.
El director no quiere que los empleados de administración conozcan la estructura de las tablas ni 
algunos datos de los profesores y socios, por ello se crean vistas a las cuales tendrán acceso.
1- Crear las tablas:*/

 create table postgresssqlya.socios(
  documento char(8) not null,
  nombre varchar(40),
  domicilio varchar(30),
   primary key (documento)
 );

 create table postgresssqlya.profesores(
  documento char(8) not null,
  nombre varchar(40),
  domicilio varchar(30),
   primary key (documento)
 );

 create table postgresssqlya.cursos(
  numero serial,
  deporte varchar(20),
  dia varchar(15),
  documentoprofesor char(8),
   primary key (numero)
 );

 create table postgresssqlya.inscriptos(
  documentosocio char(8) not null,
  numero smallint not null,
  matricula char(1),
   primary key (documentosocio,numero)
 );

--2- Ingrese algunos registros para todas las tablas:

 insert into postgresssqlya.socios values('30000000','Fabian Fuentes','Caseros 987');
 insert into postgresssqlya.socios values('31111111','Gaston Garcia','Guemes 65');
 insert into postgresssqlya.socios values('32222222','Hector Huerta','Sucre 534');
 insert into postgresssqlya.socios values('33333333','Ines Irala','Bulnes 345');

 insert into postgresssqlya.profesores values('22222222','Ana Acosta','Avellaneda 231');
 insert into postgresssqlya.profesores values('23333333','Carlos Caseres','Colon 245');
 insert into postgresssqlya.profesores values('24444444','Daniel Duarte','Sarmiento 987');
 insert into postgresssqlya.profesores values('25555555','Esteban Lopez','Sucre 1204');

 insert into postgresssqlya.cursos(deporte,dia,documentoprofesor) values('tenis','lunes','22222222');
 insert into postgresssqlya.cursos(deporte,dia,documentoprofesor) values('tenis','martes','22222222');
 insert into postgresssqlya.cursos(deporte,dia,documentoprofesor) values('natacion','miercoles','22222222');
 insert into postgresssqlya.cursos(deporte,dia,documentoprofesor) values('natacion','jueves','23333333');
 insert into postgresssqlya.cursos(deporte,dia,documentoprofesor) values('natacion','viernes','23333333');
 insert into postgresssqlya.cursos(deporte,dia,documentoprofesor) values('futbol','sabado','24444444');
 insert into postgresssqlya.cursos(deporte,dia,documentoprofesor) values('futbol','lunes','24444444');
 insert into postgresssqlya.cursos(deporte,dia,documentoprofesor) values('basquet','martes','24444444');

 insert into postgresssqlya.inscriptos values('30000000',1,'s');
 insert into postgresssqlya.inscriptos values('30000000',3,'n');
 insert into postgresssqlya.inscriptos values('30000000',6,null);
 insert into postgresssqlya.inscriptos values('31111111',1,'s');
 insert into postgresssqlya.inscriptos values('31111111',4,'s');
 insert into postgresssqlya.inscriptos values('32222222',8,'s');

--3- Cree una vista en la que aparezca el nombre y documento del socio, el deporte, el día y el nombre del profesor.
     
	 create view informacion_socios as 
	    select s.nombre nombre_socio, 
		    s.documento documento_socio,
			c.deporte,c.dia, p.documento documento_profesor, 
			p.nombre nombre_profesor
			from postgresssqlya.socios s full join postgresssqlya.inscriptos i
			on s.documento=i.documentosocio full join postgresssqlya.cursos c
			on i.numero =c.numero  full join postgresssqlya.profesores p 
			on c.documentoprofesor=p.documento


			create or replace view informacion_socios as  
	    select s.nombre nombre_socio, 
		    s.documento documento_socio,
			c.deporte,c.dia, p.documento documento_profesor, 
			p.nombre nombre_profesor, i.matricula matricula_inscriptos
			from postgresssqlya.socios s full join postgresssqlya.inscriptos i
			on s.documento=i.documentosocio full join postgresssqlya.cursos c
			on i.numero =c.numero  full join postgresssqlya.profesores p 
			on c.documentoprofesor=p.documento



       select * from informacion_socios
	   where nombre_socio like 'Fabi__%'

       drop view informacion_socios; --Eliminar la vista. 
	
--4- Muestre la información contenida en la vista.

       select * from informacion_socios

--5- Realice una consulta a la vista donde muestre la cantidad de socios inscriptos en cada deporte 
--ordenados por cantidad.
       select deporte, count(nombre_socio) cantidad_socios 
	   from informacion_socios 
	   group by deporte
	   order by cantidad_socios

--6- Muestre (consultando la vista) los cursos (deporte y día) para los cuales no hay inscriptos.
              select deporte, dia from informacion_socios 
			  where  documento_socio is null

--7- Muestre los nombres de los socios que no se han inscripto en ningún curso (consultando la vista)
              select nombre_socio, deporte, dia 
			  from informacion_socios 
			  where deporte is null and nombre_socio is not null
			  

--8- Muestre (consultando la vista) los profesores que no tienen asignado ningún deporte aún.
      select * from informacion_socios 
	  where documento_profesor is not null 
	     and deporte is null

--9- Muestre (consultando la vista) el nombre y documento de los socios que deben matrículas.
         select nombre_socio, documento_socio 
		     from informacion_socios 
			 where matricula_inscriptos ='s'

--10- Consulte la vista y muestre los nombres de los profesores y los días en que asisten al club para dictar sus clases.
                   select documento_profesor,nombre_profesor, dia
				   from informacion_socios
				   where documento_profesor is not null

--11- Muestre la misma información anterior pero ordenada por día.
      select documento_profesor,nombre_profesor, dia
				   from informacion_socios
				    where documento_profesor is not null
				   order by dia

--12- Muestre todos los socios que son compañeros en tenis los lunes.
    select documento_socio,nombre_socio,dia 
	from informacion_socios 
	where dia  like '_unes%'
     and documento_socio is not null

