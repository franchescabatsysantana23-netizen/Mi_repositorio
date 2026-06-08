/*Primer problema:
Una empresa registra los datos de sus clientes en una tabla llamada "clientes". Dicha tabla contiene un campo 
que hace referencia al cliente que lo recomendó denominado "referenciadopor". Si un cliente 
no ha sido referenciado por ningún otro cliente, tal campo almacena "null".
1- Creemos la tabla:*/
drop table if exists postgresssqlya.clientes;

 create table postgresssqlya.clientes(
  codigo int,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  referenciadopor int,
  primary key(codigo)
 );

--2- Ingresamos algunos registros:
 insert into postgresssqlya.clientes values (50,'Juan Perez','Sucre 123','Cordoba',null);
 insert into postgresssqlya.clientes values(90,'Marta Juarez','Colon 345','Carlos Paz',null);
 insert into postgresssqlya.clientes values(110,'Fabian Torres','San Martin 987','Cordoba',50);
 insert into postgresssqlya.clientes values(125,'Susana Garcia','Colon 122','Carlos Paz',90);
 insert into postgresssqlya.clientes values(140,'Ana Herrero','Colon 890','Carlos Paz',9);

--3- Intente agregar una restricción "foreign key" para evitar que en el campo "referenciadopor" se 
--ingrese un valor de código de cliente que no exista.
--No se permite porque existe un registro que no cumple con la restricción que se intenta establecer.
alter table postgresssqlya.clientes 
add constraint FK_afiliados_referenciadospor
foreign key(referenciadopor)
references postgresssqlya.clientes(codigo)



--4- Cambie el valor inválido de "referenciadopor" del registro que viola la restricción por uno válido.
update postgresssqlya.clientes 
set referenciadopor=110
where referenciadopor=9


--5- Agregue la restricción "foreign key" que intentó agregar en el punto 3.
alter table postgresssqlya.clientes 
add constraint FK_afiliados_referenciadospor
foreign key(referenciadopor)
references postgresssqlya.clientes(codigo)


--6- Intente agregar un registro que infrinja la restricción.
--No lo permite.
 insert into postgresssqlya.clientes values(150,'Ana Rodriguez','Maria Montez 890','Carlos Paz',10);


--7- Intente modificar el código de un cliente que está referenciado en "referenciadopor".
--No se puede.

     update postgresssqlya.clientes 
	 set codigo=10
	 where codigo=50

--8- Intente eliminar un cliente que sea referenciado por otro en "referenciadopor".
--No se puede.
delete from postgresssqlya.clientes 
where codigo=50


--9- Cambie el valor de código de un cliente que no referenció a nadie.
select * from postgresssqlya.clientes; 

update postgresssqlya.clientes
set codigo =130
where codigo=125

--10- Elimine un cliente que no haya referenciado a otros.
delete from postgresssqlya.clientes 
where codigo=140

select * from postgresssqlya.clientes;
