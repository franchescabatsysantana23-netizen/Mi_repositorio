--Una empresa de remises tiene registrada la información de sus vehículos en una tabla llamada "remis".

--1- Cree la tabla con la siguiente estructura:
drop table if exists postgresssqlya.remis; 

 create table postgresssqlya.remis(
  numero serial,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );
--2- Ingrese algunos registros, 2 de ellos con patente repetida y alguno con patente nula:
 insert into postgresssqlya.remis(patente,marca,modelo) values('ABC123','Renault clio','1990');
 insert into postgresssqlya.remis(patente,marca,modelo) values('DEF456','Peugeot 504','1995');
 insert into postgresssqlya.remis(patente,marca,modelo) values('DEF456','Fiat Duna','1998');
 insert into postgresssqlya.remis(patente,marca,modelo) values('GHI789','Fiat Duna','1995');
 insert into postgresssqlya.remis(patente,marca,modelo) values(null,'Fiat Duna','1995');

--3- Intente agregar una restricción "unique" para asegurarse que la patente del remis no tomará 
--valores repetidos.No se puede porque hay valores duplicados.
alter table postgresssqlya.remis
add constraint UQ_patente
unique(patente);


--4- Elimine el registro con patente duplicada y establezca la restricción.
--Note que hay 1 registro con valor nulo en "patente".

delete from postgresssqlya.remis
where patente='DEF456' and marca='Fiat Duna'

alter table postgresssqlya.remis
add constraint UQ_patente
unique(patente);


--5- Intente ingresar un registro con patente repetida (no lo permite)

 insert into postgresssqlya.remis(patente,marca,modelo) values('DEF456','Fiat Duna','1998');
 
--6- Ingresar un registro con valor nulo para el campo "patente".Lo permite.

 insert into postgresssqlya.remis(patente,marca,modelo) values(null,'Texaco','1995');
 
--7- Muestre la información de las restricciones

select * from information_schema.table_constraints
where table_name='remis'
