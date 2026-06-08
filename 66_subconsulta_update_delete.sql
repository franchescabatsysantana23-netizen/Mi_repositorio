--66 subconsulta update delete
/*
Primer problema:
Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada 
"inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual se inscribe 
y si la matricula está o no paga, y una tabla denominada "socios" en la que guarda los datos 
personales de cada socio.

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
  matricula char(1),-- 'n' o 's'
  primary key(numerosocio,deporte)
 );

--2- Ingrese algunos registros:
 insert into socios(documento,nombre,domicilio) values('23333333','Alberto Paredes','Colon 111');
 insert into socios(documento,nombre,domicilio) values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios(documento,nombre,domicilio) values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios(documento,nombre,domicilio) values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis','s');
 insert into inscriptos values(1,'basquet','s');
 insert into inscriptos values(1,'natacion','s');
 insert into inscriptos values(2,'tenis','s');
 insert into inscriptos values(2,'natacion','s');
 insert into inscriptos values(2,'basquet','n');
 insert into inscriptos values(2,'futbol','n');
 insert into inscriptos values(3,'tenis','s');
 insert into inscriptos values(3,'basquet','s');
 insert into inscriptos values(3,'natacion','n');
 insert into inscriptos values(4,'basquet','n');

--3- Actualizamos la cuota ('s') de todas las inscripciones de un socio determinado (por documento) empleando subconsulta.
       update inscriptos 
	   set matricula='s'
	   where numerosocio=
	      ( select numero from socios
		           where documento='25555555')

--4- Elimine todas las inscripciones de los socios que deben alguna matrícula.5 registros eliminados.

       
      delete from inscriptos
	  where numerosocio in ( select numero from socios 
	      inner join inscriptos 
		  on numero = numerosocio 
		  where matricula='n')


		  select * from socios 
	      inner join inscriptos 
		  on numero = numerosocio 