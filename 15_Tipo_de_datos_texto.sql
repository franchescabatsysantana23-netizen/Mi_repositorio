-- Primer Problema

create table sqlserverya.autos(
   patente char(6),
   marcha varchar(20),
   modelo char(4),
   precio float, 
   primary key(patente)
)

 insert into 
      sqlserverya.autos
  values	  
  ('ACD123','Fiat 128','1970',15000),
  ('ACG234','Renault 11','1990',40000),
  ('BCD333','Peugeot 505','1990',80000),
  ('GCD123','Renault Clio','1990',70000),
  ('BCC333','Renault Megane','1998',95000),
  ('BVF543','Fiat 128','1975',20000

select * from sqlserverya.autos
where modelo='1990'

drop table sqlserverya.autos;


create table sqlserverya.autos(
   patente character(6),
   marcha character varying(20),
   modelo character(4),
   precio float, 
   primary key(patente)
)

 insert into 
      sqlserverya.autos
  values	  
  ('ACD123','Fiat 128','1970',15000);

  select * from sqlserverya.autos

--Segundo problema

 create table sqlserverya.clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11)
 );

 insert into sqlserverya.clientes
  values('2233344','Perez','Juan','Sarmiento 980','4342345');
 insert into sqlserverya.clientes (documento,apellido,nombre,domicilio)
  values('2333344','Perez','Ana','Colon 234');
 insert into sqlserverya.clientes
  values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
 insert into sqlserverya.clientes
  values('2533344','Juarez','Ana','Urquiza 444','4789900');

  select * from sqlserverya.clientes
  where apellido='Perez'

  
  
  