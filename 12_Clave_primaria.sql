drop table if exists libros; 

create table libros(
   codigo int not null, 
   titulo varchar(40) not null,
   autor varchar(20),
   editorial varchar(15),
   primary key(codigo)
)
--Ingrese los siguientes registros: 

 insert into libros (codigo,titulo,autor,editorial)
  values (1,'El aleph','Borges','Emece');
 insert into libros (codigo,titulo,autor,editorial)
  values (2,'Martin Fierro','Jose Hernandez','Planeta');
 insert into libros (codigo,titulo,autor,editorial)
  values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

--3- Ingrese un registro con código repetido (aparece un mensaje de error)
 insert into libros (codigo,titulo,autor,editorial)
  values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

 --4- Intente ingresar el valor "null" en el campo "codigo"
 
  insert into libros (codigo,titulo,autor,editorial)
  values (null,'Aprenda PHP','Mario Molina','Nuevo Siglo');

  --5- Intente actualizar el código del libro "Martin Fierro" a "1" (mensaje de error)
  
update libros 
set codigo=1
where codigo=2

Create table alumnos(
   legajo varchar(4) not null,
   documento varchar(8),
   nombre varchar(30),
   domicilio varchar(30),
   primary key(documento)
)
select table_name, column_name, udt_name,
character_maximum_length, is_nullable
from information_schema.columns
where table_name='alumnos'

 insert into alumnos (legajo,documento,nombre,domicilio)
  values('A233','22345345','Perez Mariana','Colon 234');
 insert into alumnos (legajo,documento,nombre,domicilio)
  values('A567','23545345','Morales Marcos','Avellaneda 348');

 ---5- Intente ingresar un alumno con número de documento existente (no lo permite)
 
  insert into alumnos (legajo,documento,nombre,domicilio)
  values('A568','23545345','Reyes Marcos','Avellaneda 345');

  ---6- Intente ingresar un alumno con documento nulo (no lo permite)
  
    insert into alumnos (legajo,documento,nombre,domicilio)
  values('A569',null,'Reyes Marcos','Avellaneda 345');
  