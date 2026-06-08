/*
create or replace function [nombre de la función]([parámetros]) returns [tipo de dato que retorna]
as
 [definición de la función]
language [lenguaje utilizado]

create or replace function [nombre de la función]([parámetros]) returns [tipo de dato que retorna]
as
 [definición de la función]
language [lenguaje utilizado]


 create or replace function retornarclave(varchar) returns varchar
 as
   'select clave from usuarios where nombre=$1;'
 language sql;

 create or replace function sumar(integer,integer) returns integer 
AS 
  'select $1+$2;'
language sql;

 select retornarclave('Susana');

*/

--cree la tabla con la siguiente estructura: 

create table medicamentos(
   codigo serial,
   nombre varchar(20),
   laboratorio varchar(20),
   precio decimal(5,2),
   cantidad smallint,
   primary key(codigo)
)
 insert into medicamentos (nombre,laboratorio,precio,cantidad)
  values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre,laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre,laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);
 insert into medicamentos (nombre,laboratorio,precio,cantidad)
  values('Paracetamol 500','Bago',1.90,200);
 insert into medicamentos (nombre,laboratorio,precio,cantidad)
  values('Bayaspirina','Bayer',2.10,150); 
 insert into medicamentos (nombre,laboratorio,precio,cantidad)
  values('Amoxidal jarabe','Bayer',5.10,250); 


--3- Implementar una función que retorne el precio promedio de la tabla medicamentos.

create or replace function mi_funcion() returns decimal(10,2) as $$
   select avg(precio) from medicamentos 
$$ language sql;   

--4- Imprimir el precio promedio de los medicamentos.
select * from mi_funcion()

--5- Imprimir los medicamentos que tienen un precio mayor al promedio.
      select * from medicamentos 
	  where precio >mi_funcion()


