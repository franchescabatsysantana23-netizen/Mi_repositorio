create table medicamentos(
   codigo integer not null,
   nombre varchar(20) not null, 
   laboratorio varchar(20),
   precio float, 
   cantidad integer not null
)

--2- Visualice la estructura de la tabla "medicamentos" indicando si el campo admite valores null.
select * from information_schema.columns
where table_name='medicamentos'


select table_name,column_name, udt_name, character_maximum_length, is_nullable
from information_schema.columns
where table_name='medicamentos'

 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(1,'Sertal gotas',null,null,100); 
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(2,'Sertal compuesto',null,8.90,150);
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(3,'Buscapina','Roche',null,200);

  select * from medicamentos; 
  
  --5- Ingrese un registro con valor "0" para el precio y cadena vacía para el laboratorio.
  insert into medicamentos (codigo, nombre,laboratorio,precio, cantidad) values
  (4,'Forosemida','',0,5)
  select * from medicamentos; 

  --6- Ingrese un registro con valor "0" para el código y cantidad y cadena vacía para el nombre.
  
    insert into medicamentos (codigo, nombre,laboratorio,precio, cantidad) values
    (0,' ','',60,0)
       select * from medicamentos; 
	   
--8- Intente ingresar un registro con valor nulo para un campo que no lo admite 
--(aparece un mensaje de error):
    insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(null,'aceptaminofem','Roche',null,200);

  --9- Recupere los registros que contengan valor "null" en el campo "laboratorio", luego los que 
--tengan una cadena vacía en el mismo campo. Note que el resultado es diferente.
     select * from medicamentos 
	 where laboratorio is null
	 
	 select * from medicamentos
	 where laboratorio =''

--10- Recupere los registros que contengan valor "null" en el campo "precio", luego los que 
-- tengan el valor 0 en el mismo campo. Note que el resultado es distinto.
select * from medicamentos 
where precio is null

select * from medicamentos 
where precio=0

/*
11- Recupere los registros cuyo laboratorio no contenga una cadena vacía, luego los que sean 
distintos de "null".
Note que la salida de la primera sentencia no muestra los registros con cadenas vacías 
y tampoco los 
que tienen valor nulo; el resultado de la segunda sentencia muestra los registros 
con valor para el 
campo laboratorio (incluso cadena vacía).
*/
select * from medicamentos 
where laboratorio !=''

select * from medicamentos 
where not laboratorio is null

select * from medicamentos 
where  laboratorio is not null

/*
12- Recupere los registros cuyo precio sea distinto de 0, luego los que sean distintos de "null".
Note que la salida de la primera sentencia no muestra los registros con valor 0 y tampoco los que 
tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
campo precio (incluso el valor 0).
*/

select * from medicamentos 
where precio <>0

select * from medicamentos 
where precio is not null

--Segundo Problema

drop  table if exists peliculas; 

 create table peliculas(
  codigo int not null,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion int
 );

--2- Visualice la estructura de la tabla.
select 
     table_name, column_name, udt_name, character_maximum_length, 
	  is_nullable
	 from information_schema.columns
	 where table_name='peliculas'

--3- Ingrese los siguientes registros:
 insert into peliculas (codigo,titulo,actor,duracion)
  values(1,'Mision imposible','Tom Cruise',120);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(2,'Harry Potter y la piedra filosofal',null,180);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(3,'Harry Potter y la camara secreta','Daniel R.',null);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(0,'Mision imposible 2','',150);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(4,'','L. Di Caprio',220);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(5,'Mujer bonita','R. Gere-J. Roberts',0);

  select * from peliculas; 

/*
5- Intente ingresar un registro con valor nulo para campos 
que no lo admiten (aparece un mensaje de 
error)
*/
 insert into peliculas (codigo,titulo,actor,duracion)
  values(6,null,'R. Gere-J. Roberts',0);
  
 insert into peliculas (codigo,titulo,actor,duracion)
  values(null,'11 minutos','paulo cohelo',1);

 /*
 6- Muestre los registros con valor nulo en el campo "actor" y luego los que 
 guardan una cadena vacía 
(note que la salida es distinta) (1 registro)
 */ 
select * from peliculas 
where actor is null
select * from peliculas 
where actor =''

/*
7- Modifique los registros que tengan valor de duración desconocido (nulo) por "120" (1 registro 
actualizado)
*/


update peliculas 
set duracion =120
where duracion is null

select * from peliculas 

/*
8- Coloque 'Desconocido' en el campo "actor" en los registros que 
tengan una cadena vacía en dicho campo (1 registro afectado)
*/

update peliculas 
set actor = null
where actor=''

select * from peliculas 



/*
9- Muestre todos los registros. Note que el cambio anterior no afectó a los registros con valor 
nulo en el campo "actor".
*/
select * from peliculas 

/*
10- Elimine los registros cuyo título sea una cadena vacía (1 registro)
*/

delete from peliculas 
where titulo=''

	   
	

	

