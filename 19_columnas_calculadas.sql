
    create table postgresssqlya.articulos(
      codigo serial,
	  nombre varchar(20),
	  descripcion varchar(30),
	  precio decimal(10,2),
	  cantidad smallint default 0,
	  primary key(codigo)
	);
	
--2- Ingrese algunos registros:
 insert into postgresssqlya.articulos (nombre, descripcion, precio,cantidad)
  values ('impresora','Epson Stylus C45',400.80,20);
 insert into postgresssqlya.articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C85',500);
 insert into postgresssqlya.articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into postgresssqlya.articulos (nombre, descripcion, precio,cantidad)
  values ('teclado','ingles Biswal',100,50);

  select * from postgresssqlya.articulos;

--3- El comercio quiere aumentar los precios de todos sus artículos en un 15%. Actualice todos los 
-- precios empleando operadores aritméticos.
update postgresssqlya.articulos
set precio =precio+(precio*0.15)

--4- Vea el resultado
select * from postgresssqlya.articulos;

--5- Muestre todos los artículos, concatenando el nombre y la descripción de cada uno de ellos 
--separados por coma.
select 
    nombre ||' , '|| descripcion
from 
   postgresssqlya.articulos;

--6- Reste a la cantidad de todos los teclados, el valor 5, empleando el operador aritmético
--menos ("-")

       update postgresssqlya.articulos
	   set cantidad =cantidad-5
	   where nombre='teclado'

	   select 
	       * 
		  from 
		       postgresssqlya.articulos
			where 
			     nombre='teclado'
			