/*Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla 
"ciudades" donde registra los nombres de las ciudades.
*/
/*1- Cree la tabla "clientes" (codigo, nombre, domicilio, ciudad, codigociudad) y "ciudades" (codigo, 
nombre). Agregue una restricción "primary key" para el campo "codigo" de ambas tablas):*/

drop table if exists ciudades;
drop table if exists clientes;


 create table ciudades(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );

 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  codigociudad smallint not null,
  primary key(codigo)
 );

--2- Ingrese algunos registros para ambas tablas:
 insert into ciudades (nombre) values('Cordoba');
 insert into ciudades (nombre) values('Cruz del Eje');
 insert into ciudades (nombre) values('Carlos Paz');
 insert into ciudades (nombre) values('La Falda');
 insert into ciudades (nombre) values('Villa Maria');

 insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Marcos','Colon 111',1);
 insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Hector','San Martin 222',1);
 insert into clientes(nombre,domicilio,codigociudad) values ('Perez Ana','San Martin 333',2);
 insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Juan','Rivadavia 444',3);
 insert into clientes(nombre,domicilio,codigociudad) values ('Perez Luis','Sarmiento 555',3);
 insert into clientes(nombre,domicilio,codigociudad) values ('Gomez Ines','San Martin 666',4);
 insert into clientes(nombre,domicilio,codigociudad) values ('Torres Fabiola','Alem 777',5);
 insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Luis','Sucre 888',5);

--3- Necesitamos conocer los nombres de las ciudades de aquellos clientes cuyo domicilio es en calle 
--"San Martin", empleando subconsulta.3 registros.
      select nombre from ciudades 
	  where codigo in (select codigociudad from clientes where domicilio like '%San Martin%')

--4- Obtenga la misma salida anterior pero empleando join.
         select ci.nombre
			from clientes cl
			   inner join ciudades ci
			    on cl.codigociudad =ci.codigo
			where domicilio like '%San Martin%'
					

--5- Obtenga los nombre de las ciudades de los clientes cuyo apellido no comienza con una letra 
---específica, empleando subconsulta.2 registros.

        select nombre from ciudades 
		    where codigo not in
		    (select cl.codigociudad
				    from clientes cl inner join ciudades ci
							    on cl.codigociudad =ci.codigo
								where cl.nombre like 'G%' )

--6- Pruebe la subconsulta del punto 5 separada de la consulta exterior para verificar que retorna una 
--lista de valores de un solo campo.
select cl.codigociudad
	   from clientes cl
	       inner join ciudades ci
		  on cl.codigociudad =ci.codigo
								where cl.nombre like 'G%'
