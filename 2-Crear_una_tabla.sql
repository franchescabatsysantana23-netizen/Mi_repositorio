create table usuarios(
   nombre varchar(30),
   clave varchar(15)

)
select * from usuarios;

--1- Intente crear una tabla llamada "/agenda":
/*create table /agenda(
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(30),
  telefono varchar(11)
)*/
--aparece un mensaje de error porque usamos un caracter inválido ("/") para el nombre.
create table agenda(
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(30),
  telefono varchar(11)
)

--3- Intente crearla nuevamente. Aparece mensaje de error.
create table agenda(
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(30),
  telefono varchar(11)
)
-- 4- Visualice la estructura de la tabla "agenda".
select table_name,column_name,udt_name,character_maximum_length
       from information_schema.columns
	   where table_name='agenda';
--5- Elimine la tabla.
drop table agenda;
--6- Intente eliminar nuevamente la tabla. Debe aparecer un mensaje de error.
drop table agenda;
/*
Necesita almacenar información referente a los libros de su biblioteca personal. Los datos que 
guardará serán: título del libro, nombre del autor y nombre de la editorial.
*/
-- Cree una tabla llamada "libros". Debe definirse con los siguientes campos: titulo, varchar(20); 
-- autor, varchar(30) y editorial, varchar(15).
create table libros (
titulo varchar(20),
autor varchar(30),
editorial varchar(15))

-- 2- Intente crearla nuevamente. Aparece mensaje de error.
create table libros (
titulo varchar(20),
autor varchar(30),
editorial varchar(15))

--3- Visualice la estructura de la tabla "libros".
select table_name,column_name, udt_name,character_maximum_length
from information_schema.columns
where table_name ='libros'

--4- Elimine la tabla.
drop table libros; 

--5- Intente eliminar la tabla nuevamente.
drop table libros; 


