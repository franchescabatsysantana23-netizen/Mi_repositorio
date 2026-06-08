/*Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla 
"provincias" donde registra los nombres de las provincias.
1- Cree las tablas:*/
drop table if exists clientes; 
drop table if exists provincias;

 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );

--2- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
  values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Garcia Luis','Sucre 475','Santa Rosa',5);

--3- Muestre todos los datos de los clientes, incluido el nombre de la provincia
      select cl.codigo,cl.nombre, cl.domicilio,cl.ciudad, p.nombre
	      from clientes cl left join provincias p
		  on cl.codigoprovincia=p.codigo 

--4- Realice la misma consulta anterior pero alterando el orden de las tablas
        select cl.codigo,cl.nombre, cl.domicilio,cl.ciudad, p.nombre
	      from provincias p left join clientes cl
		  on p.codigo=cl.codigoprovincia 

--5- Muestre solamente los clientes de las provincias que existen en "provincias" (5 registros)
   select cl.codigo,cl.nombre, cl.domicilio,cl.ciudad, p.nombre
	      from clientes cl inner join provincias p
		  on cl.codigoprovincia=p.codigo 

     select cl.codigo,cl.nombre, cl.domicilio,cl.ciudad, p.nombre
	      from clientes cl left join provincias p
		  on cl.codigoprovincia=p.codigo 
		  where p.codigo is not null

--6- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" 
--ordenados por nombre del cliente (2 registros)

       select cl.codigo,cl.nombre, cl.domicilio,cl.ciudad,p.codigo, p.nombre
	      from clientes cl left join provincias p
		  on cl.codigoprovincia=p.codigo 
		  where p.codigo is null
		  order by cl.nombre

--7- Obtenga todos los datos de los clientes de "Cordoba" (3 registros)
    select cl.codigo,cl.nombre, cl.domicilio,cl.ciudad, p.nombre
	      from clientes cl left join provincias p
		  on cl.codigoprovincia=p.codigo 
		  where p.nombre='Cordoba'