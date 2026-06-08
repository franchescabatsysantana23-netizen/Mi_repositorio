--74 - Función SQL que retorna un dato compuesto.

/*
 create or replace function retornarlibro(int) returns libros 
 as
 'select * from libros where codigo=$1 ;'
 language sql;

*/
/*Primer problema:
Trabaje con la tabla llamada "medicamentos" de una farmacia.
1- Cree la tabla con la siguiente estructura:*/
   drop table if exists medicamentos;

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

--3- Implementar una función que retorne el registro completo del medicamento más caro. 
  create or replace function consultar_medicamentos_mas_caro() returns medicamentos
  as 
    $$
	   select * from medicamentos 
	   order by precio desc 
	   limit 1
	 $$
	language sql; 

--4- Proceder a llamar a la función.

   select * from consultar_medicamentos_mas_caro()
