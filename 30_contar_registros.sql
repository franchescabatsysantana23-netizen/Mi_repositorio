drop table if exists postgresssqlya.medicamentos; 

 create table postgresssqlya.medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad smallint,
  fechavencimiento date not null,
  numerolote int default null,
  primary key(codigo)
 );
 select * from postgresssqlya.medicamentos;

  insert into postgresssqlya.medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote)
  values('Sertal','Roche',5.2,1,'2015-02-01',null);
 insert into postgresssqlya.medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Buscapina','Roche',4.10,3,'2016-03-01',null);
 insert into postgresssqlya.medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
 insert into postgresssqlya.medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote)
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
 insert into postgresssqlya.medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
  insert into postgresssqlya.medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

---3- Muestre la cantidad de registros empleando la función "count(*)" (6 registros)
 select count(*) from postgresssqlya.medicamentos; 

---4- Cuente la cantidad de medicamentos que tienen laboratorio conocido (5 registros)
    select count(laboratorio) from postgresssqlya.medicamentos
	 
---5- Cuente la cantidad de medicamentos que tienen precio distinto a "null" y que tienen cantidad 
---distinto a "null", disponer alias para las columnas.
      select count(precio),
	  count(cantidad)
	  from postgresssqlya.medicamentos
	
--6- Cuente la cantidad de remedios con precio conocido, cuyo laboratorio comience con "B" (2 registros)
     select count(precio) from postgresssqlya.medicamentos
	 where laboratorio like 'B%'

--7- Cuente la cantidad de medicamentos con número de lote distinto de "null" (0 registros)
     select count(numerolote) from postgresssqlya.medicamentos 


  