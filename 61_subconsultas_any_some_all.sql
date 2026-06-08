/*Primer problema:
Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada 
"inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual se inscribe 
y la cantidad de cuotas pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla 
denominada "socios" en la que guarda los datos personales de cada socio.
1- Cree las tablas:
*/
drop table if exists socios;
drop table if exists inscriptos;

 create table socios(
  numero serial,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas smallint,
  primary key(numerosocio,deporte)
 );

--2- Ingrese algunos registros:
 insert into socios(documento,nombre,domicilio) values('23333333','Alberto Paredes','Colon 111');
 insert into socios(documento,nombre,domicilio) values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios(documento,nombre,domicilio) values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios(documento,nombre,domicilio) values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

--3- Muestre el número de socio, el nombre del socio y el deporte en que está inscripto con un join de ambas tablas.
       select numero, nombre, deporte
	         from socios join inscriptos
			 on numero =numerosocio
      
--4- Muestre los socios que serán compañeros en tenis y también en natación (empleando 
--subconsulta).3 filas devueltas.
 select nombre from socios s
   where numero = any (
         select numerosocio from inscriptos i 
		 where (s.numero= i.numerosocio)
		 and deporte in('tenis','natacion')	 
   ) 

--5- Vea si el socio 1 se ha inscripto en algún deporte en el cual se haya inscripto el socio 2.3 filas.

        select deporte from inscriptos 
		where numerosocio=1 
		and deporte =any(select deporte from inscriptos 
		where numerosocio=2)


--6- Obtenga el mismo resultado anterior pero empleando join.
     
	     select i.deporte from inscriptos i 
		       join inscriptos ii
			   on i.deporte=ii.deporte
			   and i.numerosocio=ii.numerosocio
			   where i.numerosocio =1
	  
	   
	   


--7- Muestre los deportes en los cuales el socio 2 pagó más cuotas que ALGUN deporte en los que se 
--inscribió el socio 1.2 registros.
       select deporte, cuotas from inscriptos 
	   where numerosocio=2 and cuotas > any
	   (select cuotas from inscriptos where numerosocio=1)

	
--8- Muestre los deportes en los cuales el socio 2 pagó más cuotas que TODOS los deportes en que se 
--inscribió el socio 1.1 registro.

    select deporte, cuotas from inscriptos 
	where numerosocio=2 
	and cuotas>all(select cuotas from inscriptos
	where numerosocio=1)
	

--9- Cuando un socio no ha pagado la matrícula de alguno de los deportes en que se ha inscripto, se 
--lo borra de la inscripción de todos los deportes. Elimine todos los socios que no pagaron ninguna 
--cuota en algún deporte.7 registros.


select * from socios 
where numero = any(select numerosocio from inscriptos 
          where cuotas is null or cuotas =0)
