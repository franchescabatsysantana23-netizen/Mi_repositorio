
create table peliculas(
    nombre varchar(20),
	actor varchar(20),
	duracion int, 
	cantidad_copias int
)
 alter table peliculas rename column cantidad_copias to cantidad
 
select table_name, column_name, udt_name,character_maximum_length
from information_schema.columns
where table_name='peliculas'

 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',128,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',130,2);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);
  
select * from peliculas; 

--Segundo problema 
/*
Una empresa almacena los datos de sus empleados en una tabla "empleados" que guarda los siguientes 
datos: nombre, documento, sexo, domicilio, sueldobasico.
*/

create table empleados (
 nombre varchar(30),
 documento varchar(20),
 sexo char(1),
 domicilio varchar(30),
 sueldobasico int
)
alter table empleados alter column sueldobasico type float

select table_name, column_name, udt_name, character_maximum_length
from information_schema.columns
where table_name='empleados'

insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Juan Perez','22333444','m','Sarmiento 123',500);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Ana Acosta','24555666','f','Colon 134',650);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',800);

  select * from empleados; 



  