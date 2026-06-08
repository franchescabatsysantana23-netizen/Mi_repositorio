/*


create or replace function cargarusuarios() returns void
as
$$
 insert into usuarios (nombre, clave) values ('Marcelo','Boca');
 insert into usuarios (nombre, clave) values ('JuanPerez','Juancito');
 insert into usuarios (nombre, clave) values ('Susana','River');
 insert into usuarios (nombre, clave) values ('Luis','River');
$$
 language sql;

 */



-- Primer problema:
--Trabaje con la tabla llamada "medicamentos" de una farmacia.

--1- Cree la tabla con la siguiente estructura:

drop table if exists medicamentos cascade;
 create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad smallint,
  primary key(codigo)
 );

--2- Ingrese algunos registros:
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

--3- Implementar una función que reciba el código de un medicamento y proceda a borrarlo. 
--La función no retorna dato.
create or replace function borrar_medicamentos(integer) returns void
  as 
    $$
   delete from medicamentos where codigo =$1
  $$
  language sql;

--4- Proceder a llamar a la función.

select borrar_medicamentos(1)

--5- Imprimir la tabla medicamentos.
 select * from medicamentos;


 create or replace function consultar_datos () returns medicamentos 
  as 
     $$
	 select * from medicamentos 
	 $$
	 language sql;

select * from consultar_datos();	 


