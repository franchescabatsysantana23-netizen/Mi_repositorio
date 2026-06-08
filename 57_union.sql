/*Primer problema:
Un supermercado almacena en una tabla denominada "proveedores" los datos de las compañías que le 
proveen de mercaderías; en una tabla llamada "clientes", los datos de los comercios que le compran y 
en otra tabla "empleados" los datos de los empleados.
1- Cree las tablas:*/
drop table if exists postgresssqlya.proveedores;
drop table if exists postgresssqlya.clientes;
drop table if exists postgresssqlya.empleados;

 create table postgresssqlya.proveedores(
  codigo serial,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
 );
 
 create table postgresssqlya.clientes(
  codigo serial,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
 );
 create table postgresssqlya.empleados(
  documento char(8) not null,
  nombre varchar(20),
  apellido varchar(20),
  domicilio varchar(30),
  primary key(documento)
 );

--2- Ingrese algunos registros:
 insert into postgresssqlya.proveedores(nombre,domicilio) values('Bebida cola','Colon 123');
 insert into postgresssqlya.proveedores(nombre,domicilio) values('Carnes Unica','Caseros 222');
 insert into postgresssqlya.proveedores(nombre,domicilio) values('Lacteos Blanca','San Martin 987');
 insert into postgresssqlya.clientes(nombre,domicilio) values('Supermercado Lopez','Avellaneda 34');
 insert into postgresssqlya.clientes(nombre,domicilio) values('Almacen Anita','Colon 987');
 insert into postgresssqlya.clientes(nombre,domicilio) values('Garcia Juan','Sucre 345');
 insert into postgresssqlya.empleados values('23333333','Federico','Lopez','Colon 987');
 insert into postgresssqlya.empleados values('28888888','Ana','Marquez','Sucre 333');
 insert into postgresssqlya.empleados values('30111111','Luis','Perez','Caseros 956');
/*
3- El supermercado quiere enviar una tarjeta de salutación a todos los proveedores, clientes y 
empleados y necesita el nombre y domicilio de todos ellos. Emplee el operador "union" para obtener 
dicha información de las tres tablas.*/
select nombre, domicilio from postgresssqlya.proveedores
union 
select nombre,domicilio from postgresssqlya.clientes
union 
select nombre ||' '||apellido,domicilio from postgresssqlya.empleados

--4- Agregue una columna con un literal para indicar si es un proveedor, un cliente o un empleado y ordene por dicha columna.

select nombre,domicilio, 'proveedor' as categoria from postgresssqlya.proveedores
union 
select nombre,domicilio,'cliente' from postgresssqlya.clientes
union 
select nombre ||' '||apellido,domicilio,'empleado' from postgresssqlya.empleados
order by categoria