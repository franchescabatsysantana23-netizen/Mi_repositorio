/*Primer problema:
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos 
datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus 
productos y en otra tabla llamada "ciudades" los nombres de las ciudades.
1- Cree las tablas:*/

drop table if exists visitantes; 
drop table if exists ciudades; 

 create table visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  codigociudad smallint not null,
  mail varchar(30),
  montocompra decimal (6,2)
 );

 create table ciudades(
  codigo serial,
  nombre varchar(20),
  primary key(codigo)
 );
 
--2- Ingrese algunos registros:
 insert into ciudades(nombre) values('Cordoba');
 insert into ciudades(nombre) values('Carlos Paz');
 insert into ciudades(nombre) values('La Falda');
 insert into ciudades(nombre) values('Cruz del Eje');

 insert into visitantes values 
   ('Susana Molina', 35,'f','Colon 123', 1, null,59.80);
 insert into visitantes values 
   ('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50);
 insert into visitantes values 
   ('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90);
 insert into visitantes values 
   ('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0);
 insert into visitantes values 
   ('Alejandra Garcia',28,'f',null,2,null,280.50);
 insert into visitantes values 
   ('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40);
 insert into visitantes values 
   ('Mariana Juarez',33,'f',null,2,null,90);

--3- Cuente la cantidad de visitas por ciudad mostrando el nombre de la ciudad (3 filas)
      select c.nombre, count(*) total_visitantes
	  from visitantes inner join ciudades c
	  on codigociudad=c.codigo 
	  group by c.nombre
                
--4- Muestre el promedio de gastos de las visitas agrupados por ciudad y sexo (4 filas)
      select c.nombre, sexo , avg(montocompra) promedio_gastos 
	  from visitantes inner join ciudades c
	  on codigociudad=c.codigo 
	  group by c.nombre,sexo

--5- Muestre la cantidad de visitantes con mail, agrupados por ciudad (3 filas)

      select c.nombre, count(mail) cantidad_visitantes_mail
	  from visitantes inner join ciudades c
	  on codigociudad=c.codigo 
	  group by c.nombre
--6- Obtenga el monto de compra más alto de cada ciudad (3 filas)
 select c.nombre, max(montocompra) monto_mas_alto
	  from visitantes inner join ciudades c
	  on codigociudad=c.codigo 
	  group by c.nombre