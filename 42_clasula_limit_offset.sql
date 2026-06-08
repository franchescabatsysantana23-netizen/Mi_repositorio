--Primer problema:
--Trabaje con la tabla "agenda" que registra la información referente a sus amigos.

--1- Cree la tabla con la siguiente estructura:
drop table if exists postgresssqlya.agenda;
 create table postgresssqlya.agenda(
  apellido varchar(30),
  nombre varchar(20) not null,
  domicilio varchar(30),
  telefono varchar(11),
  mail varchar(30)
 );

--2- Ingrese 5 registros.
insert into postgresssqlya.agenda values
('polanco','sofia','calle 123','8099781156','prueba@prueba.com'),
('perez','carlos','calle 1234','8099781157','prueb@prueba.com'),
('rodriguez','jesus','calle 1234','8099791157','prueb@prueba.com'),
('Liriano','maria','calle este','8099791158','prueb@prueba.com'),
('Liriano','sofia','calle este','8099791158','prueb@prueba.com')

--3- Realice una consulta limitando la salida a sólo 3 registros.

   select * from postgresssqlya.agenda limit 3 offset 0  --offset indica a partir de que registros retornara la consulta
   
--4- Muestre los registros desde el 2 al 4.
select * from postgresssqlya.agenda limit 2 offset 2

--5- Muestre 4 registros a partir del 2 ordenado por apellido.

select * from postgresssqlya.agenda order by apellido limit 4 offset 2 