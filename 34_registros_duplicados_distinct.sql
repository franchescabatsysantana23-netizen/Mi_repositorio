--Una empresa tiene registrados sus clientes en una tabla llamada "clientes.

--1- Créela con la siguiente estructura:

drop table if exists postgresssqlya.clientes;
 create table postgresssqlya.clientes (
  codigo serial,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  primary key(codigo)
);

--2- Ingrese algunos registros:
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia)
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia)
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia)
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia)
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia)
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia)
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia)
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia)
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia)
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia)
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

--3- Obtenga las provincias sin repetir (3 registros)
select distinct(provincia) from postgresssqlya.clientes;

--4- Cuente las distintas provincias.
 select count(distinct(provincia)) from postgresssqlya.clientes;

--5- Se necesitan los nombres de las ciudades sin repetir (6 registros)
select distinct(ciudad) from postgresssqlya.clientes;

--6- Obtenga la cantidad de ciudades distintas.
select count(distinct(ciudad)) from postgresssqlya.clientes;

--7- Combine con "where" para obtener las distintas ciudades de la provincia de Cordoba (3 registros)
select distinct(ciudad) from postgresssqlya.clientes
where provincia ='Cordoba'

--8- Contamos las distintas ciudades de cada provincia empleando "group by" (3 registros)
      select provincia,count(distinct(ciudad)) from postgresssqlya.clientes
	  group by provincia


--Segundo Problema 

--Segundo problema:
--La provincia almacena en una tabla llamada "inmuebles" los siguientes datos de los inmuebles y sus propietarios para cobrar impuestos.

--1- Créela con la siguiente estructura:
 create table postgresssqlya.inmuebles (
  documento varchar(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(20),
  barrio varchar(20),
  ciudad varchar(20),
  tipo char(1),--b=baldio, e: edificado
  superficie decimal (8,2)
 );

--3- Ingrese algunos registros:
 insert into postgresssqlya.inmuebles
  values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
 insert into postgresssqlya.inmuebles
  values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
 insert into postgresssqlya.inmuebles
  values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
 insert into postgresssqlya.inmuebles
  values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
 insert into postgresssqlya.inmuebles
  values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
 insert into postgresssqlya.inmuebles
  values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
 insert into postgresssqlya.inmuebles
  values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
 insert into postgresssqlya.inmuebles
  values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
 insert into postgresssqlya.inmuebles
  values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

--3- Muestre los distintos apellidos de los propietarios, sin repetir (3 registros)
  select distinct apellido from postgresssqlya.inmuebles;

--4- Muestre los distintos documentos de los propietarios, sin repetir (6 registros)
  select distinct documento from postgresssqlya.inmuebles;

--5- Cuente, sin repetir, la cantidad de propietarios de inmuebles de la ciudad de Cordoba (5)
          select count(distinct(documento)) from postgresssqlya.inmuebles
		  where ciudad='Cordoba';
		  
--6- Cuente la cantidad de inmuebles con domicilio en 'San Martin', sin repetir la ciudad (2)
       select count(distinct ciudad)from postgresssqlya.inmuebles
	     where domicilio like 'San Martin%'
		 

--7- Muestre los apellidos y nombres, sin repetir (5 registros)
--Note que hay 2 personas con igual nombre y apellido que aparece una sola vez.

     select distinct apellido, nombre from postgresssqlya.inmuebles
	 
--8- Muestre la cantidad de inmuebles que tiene cada propietario agrupando por documento, sin repetir barrio (6 registros)
     select documento, count(distinct(barrio)) from postgresssqlya.inmuebles
	    group by documento
