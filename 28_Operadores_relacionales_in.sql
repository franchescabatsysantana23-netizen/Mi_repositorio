
drop table if exists postgresssqlya.medicamentos;

create table postgresssqlya.medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad smallint,
  fechavencimiento date not null,
  primary key(codigo)
 );
 select * from postgresssqlya.medicamentos;

  insert into postgresssqlya.medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento)
  values('Sertal','Roche',5.2,1,'2005-02-01');
 insert into postgresssqlya.medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) 
  values('Buscapina','Roche',4.10,3,'2006-03-01');
 insert into postgresssqlya.medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) 
  values('Amoxidal 500','Bayer',15.60,100,'2007-05-01');
 insert into postgresssqlya.medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento)
  values('Paracetamol 500','Bago',1.90,20,'2008-02-01');
 insert into postgresssqlya.medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) 
  values('Bayaspirina','Bayer',2.10,150,'2009-12-01'); 
 insert into postgresssqlya.medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) 
  values('Amoxidal jarabe','Bayer',5.10,250,'2010-10-01'); 

--3- Recupere los nombres y precios de los medicamentos cuyo laboratorio sea "Bayer" o "Bago" 
--empleando el operador "in" (4 registros).
select nombre, precio from postgresssqlya.medicamentos
where laboratorio in('Bayer','Bago')

--4- Seleccione los remedios cuya cantidad se encuentre entre 1 y 5 empleando el operador "between" y 
--luego el operador "in" (2 registros).Note que es más conveniente emplear, en este caso, el operador ""between".
select * from postgresssqlya.medicamentos
where cantidad between 1 and 5

select * from postgresssqlya.medicamentos
where cantidad in(1,2,3,4,5)

  