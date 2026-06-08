/*Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla 
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
  nombre varchar(20),
  primary key(codigo)
 );

--3- Ingrese algunos registros para ambas tablas:
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

--3- Establezca una restricción "foreign key" especificando la acción "en cascade" para 
--actualizaciones y "no_action" para eliminaciones.
alter table postgresssqlya.clientes 
add constraint FK_cliente_codigoprovincia
foreign key(codigoprovincia)
references postgresssqlya.provincias (codigo)
on update cascade
on delete no action;


/*4- Intente eliminar el registro con código 3, de "provincias".
No se puede porque hay registros en "clientes" al cual hace referencia y la opción para 
eliminaciones se estableció como "no action".*/

delete from postgresssqlya.provincias 
where codigo=3

select * from postgresssqlya.clientes
where codigoprovincia=3

--5- Modifique el registro con código 3, de "provincias".
update postgresssqlya.provincias
set codigo=9
where codigo=3


select * from postgresssqlya.provincias;
select * from postgresssqlya.clientes;

--6- Verifique que el cambio se realizó en cascada, es decir, que se modificó en la tabla "provincias" y en "clientes":
 select *from provincias;
 select *from clientes;

--7- Intente modificar la restricción "foreign key" para que permita eliminación en cascada.
--Mensaje de error, no se pueden modificar las restricciones.


--8- Intente eliminar la tabla "provincias".
--No se puede eliminar porque una restricción "foreign key" hace referencia a ella.
delete from postgresssqlya.provincias;