--1- Cree la tabla con la siguiente estructura:
drop table if exists postgresssqlya.visitantes;

 create table postgresssqlya.visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );

--2- Ingrese algunos registros:
 insert into postgresssqlya.visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into postgresssqlya.visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into postgresssqlya.visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into postgresssqlya.visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into postgresssqlya.visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into postgresssqlya.visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into postgresssqlya.visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into postgresssqlya.visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

--3- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" (4 filas devueltas)
     select ciudad, count(*) total 
	 from postgresssqlya.visitantes 
	 group by ciudad

--4- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas)
        select ciudad, count(telefono) total 
		  from postgresssqlya.visitantes
		  group by ciudad

--5- Necesitamos el total del monto de las compras agrupadas por sexo (3 filas)
         select sexo, sum(montocompra) total_monto_compras 
		   from postgresssqlya.visitantes
		   group by sexo
     
--6- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas)
         select ciudad, sexo,max(montocompra) maximo_compra,
		 min(montocompra) minimo_compra 
		     from postgresssqlya.visitantes
			 group by 2,1 --numero de campos seleccionados
			 
--7- Calcule el promedio del valor de compra agrupados por ciudad (4 filas)
      select ciudad, avg(montocompra) promedio_compra 
	    from postgresssqlya.visitantes
		group by ciudad
  
--8- Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas)
        select ciudad, count(mail) total
		 from postgresssqlya.visitantes
		  where not mail ='no tiene'
		  group by ciudad;

  select ciudad,
  count(*) as cantidadconmail
  from postgresssqlya.visitantes
  where mail is not null and
  mail<>'no tiene'
  group by ciudad;

		 
		 select * from postgresssqlya.visitantes;


---Una empresa almacena los datos de sus empleados en una tabla "empleados".
--1- Cree la tabla:
drop table if exists postgresssqlya.empleados;

create table postgresssqlya.empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos smallint,
  fechaingreso date,
  primary key(documento)
 );

--2- Ingrese algunos registros:
 insert into postgresssqlya.empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10');
 insert into postgresssqlya.empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12');
 insert into postgresssqlya.empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25');
 insert into postgresssqlya.empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25');
 insert into postgresssqlya.empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01');
 insert into postgresssqlya.empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01');
 insert into postgresssqlya.empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01');
 insert into postgresssqlya.empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01');
 insert into postgresssqlya.empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null,null);

--3- Cuente la cantidad de empleados agrupados por sección (5 filas)
     select seccion, count(*) from postgresssqlya.empleados 
	 group by seccion

--4- Calcule el promedio de hijos por sección (5 filas)
      select seccion, avg(cantidadhijos) as promedio_hijos
	  from postgresssqlya.empleados
	   group by seccion

--5- Cuente la cantidad de empleados agrupados por año de ingreso (6 filas)
        select extract(year from fechaingreso) año,count(*)
		from postgresssqlya.empleados 
		group by 1

         select extract(year from fechaingreso) año,count(*)
		from postgresssqlya.empleados 
		group by año
		
--6- Calcule el promedio de sueldo por sección de los empleados con hijos (4 filas)
          select seccion, avg(sueldo) promedio_sueldo
		   from postgresssqlya.empleados
			 where cantidadhijos is not null and cantidadhijos>0
			   group by seccion


		 
