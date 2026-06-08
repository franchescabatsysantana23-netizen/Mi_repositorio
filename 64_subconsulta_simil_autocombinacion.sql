/*Primer problema:
Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada "deportes" 
en la cual almacena el nombre del deporte, el nombre del profesor que lo dicta, el día de la semana 
que se dicta y el costo de la cuota mensual.
1- Cree la tabla:*/

  drop table if exists deportes;
  
 create table deportes(
  nombre varchar(15),
  profesor varchar(30),
  dia varchar(10),
  cuota decimal(5,2)
 );
 
--2- Ingrese algunos registros. Incluya profesores que dicten más de un curso:
 insert into deportes values('tenis','Ana Lopez','lunes',20);
 insert into deportes values('natacion','Ana Lopez','martes',15);
 insert into deportes values('futbol','Carlos Fuentes','miercoles',10);
 insert into deportes values('basquet','Gaston Garcia','jueves',15);
 insert into deportes values('padle','Juan Huerta','lunes',15);
 insert into deportes values('handball','Juan Huerta','martes',10);

--3- Muestre los nombres de los profesores que dictan más de un deporte empleando subconsulta.
       select d1.profesor, 
	   (select count(d2.profesor) from deportes d2 where d1.profesor=d2.profesor)
	   total
	   from deportes d1
	   group by d1.profesor
	   order by total desc
	   
	  

--4- Obtenga el mismo resultado empleando join.

      select d1.profesor, count(d1.nombre) total 
	    from deportes d1 join deportes d2 
		on d1.nombre=d2.nombre 
		group by d1.profesor 
		order by total desc

--5- Buscamos todos los deportes que se dictan el mismo día que un determinado deporte (natacion) empleando subconsulta.
         select d1.nombre,d1.dia from deportes d1
		 where d1.nombre in 
		     (select d2.nombre from deportes d2 
		       where d2.dia=d1.dia)
		order by d1.dia

--6- Obtenga la misma salida empleando "join".
         select d1.nombre, d1.dia from deportes d1
		  inner join deportes d2 
		  on d1.nombre =d2.nombre 
		  order by d1.dia

select nombre
  from deportes
  where nombre<>'natacion' and
  dia =
   (select dia
     from deportes
     where nombre='natacion');


select distinct d1.profesor
  from deportes as d1
  where d1.profesor in
  (select d2.profesor
    from deportes as d2 
    where d1.nombre <> d2.nombre);
		  

