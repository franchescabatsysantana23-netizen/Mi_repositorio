--Trabaje con la tabla "agenda" que almacena información de sus amigos.
create table agenda(
 apellido varchar(30),
 nombre varchar(20),
 domicilio varchar(30),
 telefono varchar(11))

--2 - Visualice la estructura de la tabla "agenda".

select table_name,column_name, udt_name,character_maximum_length
from information_schema.columns
where table_name='agenda'
--3- Ingrese los siguientes registros 
insert into agenda(apellido, nombre, domicilio, telefono)
values('Moreno','Alberto','Colon123','4234567');
insert into agenda
values('Torres','Juan','Avellaneda 135','4458787')

-- 4- Seleccione todos los registros de la tabla:
select * from agenda; 
--5- Elimine la tabla "agenda":
drop table agenda; 

--6- Intente eliminar la tabla nuevamente (aparece un mensaje de error)
drop table agenda; 

------------------Segundo Problema
/*
Trabaje con la tabla "libros" que almacena los datos de los libros de su propia biblioteca.
1- Cree una tabla llamada "libros". Debe definirse con los siguientes campos: 
titulo (cadena de 20), autor (cadena de 30) y editorial (cadena de 15).

*/

create table libros (
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15)
)
--2- Visualice la estructura de la tabla "libros".
select table_name, column_name,udt_name, character_maximum_length
from information_schema.columns
where table_name='libros'

--3- Ingrese los siguientes registros:

insert into libros (titulo,autor,editorial)
  values ('El aleph','Borges','Planeta');
 insert into libros (titulo,autor,editorial) 
  values ('Martin Fierro','Jose Hernandez','Emece');
 insert into libros (titulo,autor,editorial)
  values ('Aprenda PHP','Mario Molina','Emece');

--4- Muestre todos los registros (select).
select *  from libros;
 
