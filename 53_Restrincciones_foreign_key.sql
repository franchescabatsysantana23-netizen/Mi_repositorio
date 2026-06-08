
/*Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla 
"provincias" donde registra los nombres de las provincias.
1- Cree las tablas "clientes" y "provincias":*/

drop table if exists postgresssqlya.clientes;
drop table if exists postgresssqlya.provincias; 

 create table postgresssqlya.clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint,
  primary key(codigo)
 );

 create table postgresssqlya.provincias(
  codigo serial,
  nombre varchar(20)
 );
/*
En este ejemplo, el campo "codigoprovincia" de "clientes" es una clave foránea, se emplea para 
enlazar la tabla "clientes" con "provincias".
--2- Intente agregar una restricción "foreign key" a la tabla "clientes" que haga referencia al campo 
--"codigo" de "provincias" (No se puede porque "provincias" no tiene restricción "primary key" "unique")*/

alter table postgresssqlya.clientes 
add constraint FK_provincias 
foreign key(codigoprovincia)
references postgresssqlya.provincias (codigo)


--3- Establezca una restricción "primary key" al campo "codigo" de "provincias"
     alter table postgresssqlya.provincias
	 add constraint PK_codigo_provincia
	 primary key (codigo)


--4- Ingrese algunos registros para ambas tablas:
 insert into postgresssqlya.provincias values(1,'Cordoba');
 insert into postgresssqlya.provincias values(2,'Santa Fe');
 insert into postgresssqlya.provincias values(3,'Misiones');
 insert into postgresssqlya.provincias values(4,'Rio Negro');

 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,codigoprovincia) 
  values('Perez Juan','San Martin 123','Carlos Paz',1);
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,codigoprovincia)
  values('Moreno Marcos','Colon 234','Rosario',2);
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,codigoprovincia)
  values('Acosta Ana','Avellaneda 333','Posadas',3);
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,codigoprovincia)
  values('Luisa Lopez','Juarez 555','La Plata',6);
/*
5- Intente agregar la restricción "foreign key" del punto 2 a la tabla "clientes"
No se puede porque hay un registro en "clientes" cuyo valor de "codigoprovincia" no existe en 
"provincias".
*/

alter table postgresssqlya.clientes
add constraint FK_codigo_provincia 
foreign key(codigoprovincia)
references postgresssqlya.provincias (codigo)

select * from postgresssqlya.provincias;
select * from postgresssqlya.clientes;


--6- Elimine el registro de "clientes" que no cumple con la restricción y establezca la restricción nuevamente.

delete from postgresssqlya.clientes 
where codigoprovincia =6

alter table postgresssqlya.clientes
add constraint FK_codigo_provincia 
foreign key(codigoprovincia)
references postgresssqlya.provincias (codigo)


--7- Intente agregar un cliente con un código de provincia inexistente en "provincias".No se puede.

 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,codigoprovincia)
  values('Maria Luciano','Maria Montez 555','La Plata',8);

--8- Intente eliminar el registro con código 3, de "provincias".No se puede porque hay registros
--en "clientes" al cual hace referencia.
delete from postgresssqlya.provincias
where codigo=3


--9- Elimine el registro con código "4" de "provincias".Se permite porque en "clientes" ningún registro hace referencia a él.
delete from postgresssqlya.provincias 
where codigo=4
select * from postgresssqlya.provincias;

--10- Intente modificar el registro con código 1, de "provincias".No se puede porque hay registros en 
--"clientes" al cual hace referencia.
update postgresssqlya.provincias 
set codigo=5
where codigo=1