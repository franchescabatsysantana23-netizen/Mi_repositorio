create table sqlserverya.libros(
   codigo serial,
   titulo varchar(40),
   autor varchar(20) default 'Desconocido', 
   editorial varchar(20),
   precio decimal(6,2),
   cantidad smallint default 0,
   primary key(codigo)
)

 insert into sqlserverya.libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
 insert into sqlserverya.libros (titulo,autor,editorial,precio,cantidad)
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into sqlserverya.libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

/*
3- Muestre todos los campos de los libros y un campo extra, con el encabezado "monto_total" en la 
que calcule el monto total en dinero de cada libro (precio por cantidad)
*/

  select 
      codigo,
      titulo,autor,editorial,
	  precio,cantidad,
	  precio*cantidad  monto_total
	  from sqlserverya.libros

/*
4- Muestre el título, autor y precio de todos los libros de editorial "Emece" y
agregue dos columnas extra en las cuales muestre el descuento de cada libro, 
con el encabezado "descuento" y el precio 
con un 10% de descuento con el encabezado "precio_final".
*/


select 
  *,
  (precio*0.10) as descuento,
   precio-(precio*0.10) as precio_final from (
select
   titulo, autor, precio
   from
       sqlserverya.libros
   where 
       editorial='Emece'
) t

/*
5- Muestre una columna con el título y el autor concatenados con el encabezado "título_y_autor"
*/	 

select 
    titulo ||' '||autor titulo_y_autor
	from 
	   sqlserverya.libros;

	  
	  