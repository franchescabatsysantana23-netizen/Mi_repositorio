/*Primer problema:
Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada 
"inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual se inscribe 
y la cantidad de cuotas pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla 
denominada "socios" en la que guarda los datos personales de cada socio.
1- Cree las tablas:*/

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

--3- Se necesita un listado de todos los socios que incluya nombre y domicilio, la cantidad de 
--deportes a los cuales se ha inscripto, empleando subconsulta.4 registros.

select
      s.nombre, s.domicilio,
	  (select count(deporte) from inscriptos ins
	    where ins.numerosocio =s.numero) as cantidad
from socios as s

--4- Se necesita el nombre de todos los socios, el total de cuotas que debe pagar (10 por cada 
--deporte) y el total de cuotas pagas, empleando subconsulta.4 registros.
    select * from socios;
	select * from inscriptos;


     select s.nombre, 
	    (select sum(ins.cuotas) from inscriptos ins 
		  where ins.numerosocio=s.numero) total_cuotas
	 from socios s;

--5- Obtenga la misma salida anterior empleando join.

       select s.nombre, sum(ins.cuotas) total_cuotas from socios s
	   join inscriptos ins
	   on s.numero=ins.numerosocio
	   group by s.nombre
	   order by total_cuotas



