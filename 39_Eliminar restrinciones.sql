create schema sqlserverya;

create table sqlserverya.vehiculos(
 patente char(6) not null,
 tipo char(1),--'a'=auto,'m'=moto
 horallegada timestamp not null, 
 horasalida timestamp
)

--2- Agregue una restricción "primary key" que incluya los campos "patente" y "horallegada"
alter table sqlserverya.vehiculos add constraint FK_patentellegada primary key(patente,horallegada);

--3-- Ingrese un vehículo:
 insert into sqlserverya.vehiculos values('SDR456','a','2015/10/10 10:10',null);

 insert into sqlserverya.vehiculos values('SDR456','m','2015/10/10 10:10',null);

 insert into sqlserverya.vehiculos values('SDR456','a',null,null);

  insert into sqlserverya.vehiculos values('SDR456','m','2017/10/10 12:10',null);
 
  insert into sqlserverya.vehiculos values('SAR456','m','2017/10/10 12:10',null);

select 
    *
	from 
	   information_schema.table_constraints
	where 
	     table_name='vehiculos'

alter table sqlserverya.vehiculos drop constraint FK_patentellegada;

select 
    *
	from 
	   information_schema.table_constraints
	where 
	     table_name='vehiculos'		 
	


create schema test;

create table test.usuarios(
 id serial, 
 usuario_name varchar(30),
 clave varchar(15),
 primary key(id)
)

create table test.customer(
 id serial, 
 nombre varchar(30) default 'test',
 apellido varchar(35) default 'test',
 edad int check(edad>0),
 primary key(id)
)