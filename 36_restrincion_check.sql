--Primer problema:
--Una empresa tiene registrados datos de sus empleados en una tabla llamada "empleados".
--1- Créela con la siguiente estructura:

drop table if exists postgresssqlya.empleados;

 create table postgresssqlya.empleados (
  documento varchar(8),
  nombre varchar(30),
  fechanacimiento date,
  cantidadhijos smallint,
  seccion varchar(20),
  sueldo decimal(6,2)
 );

--2- Agregue una restricción "check" para asegurarse que no se ingresen valores negativos para el sueldo
alter table postgresssqlya.empleados
add constraint valores_sueldos check(sueldo>0)


--3- Ingrese algunos registros válidos:
 insert into postgresssqlya.empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
 insert into postgresssqlya.empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
 insert into postgresssqlya.empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);
 truncate table postgresssqlya.empleados;

--4- Intente agregar otra restricción "check" al campo sueldo para asegurar que ninguno supere el valor 5000
--La sentencia no se ejecuta porque hay un sueldo que no cumple la restricción.

   alter table postgresssqlya.empleados
   add constraint CK_empleado_sueldo check(sueldo<=5000) --ERROR:  check constraint "ck_empleado_sueldo" of relation "empleados" is violated by some row 

--5- Elimine el registro infractor y vuelva a crear la restricción
  
     delete from postgresssqlya.empleados
	 where sueldo >5000
	 

 alter table postgresssqlya.empleados
 add constraint CK_empleados_sueldo_maximo
 check (sueldo<=5000); 

--6- Establezca una restricción para controlar que la fecha de nacimiento que se ingresa no supere la fecha actual
         alter table postgresssqlya.empleados 
		 add constraint CK_empleados_fechanacimiento
		 check(fechanacimiento<=current_date)

--7- Establezca una restricción "check" para "cantidadhijos" que permita solamente valores entre 0 y 15.
       alter table postgresssqlya.empleados
	   add constraint CK_empleados_cantidadhijos 
	   check (cantidadhijos between 0 and 15)

--8- Vea todas las restricciones de la tabla (5 filas)

    select * from information_schema.table_constraints
	where table_name='empleados'

--9- Intente agregar un registro que vaya contra alguna de las restricciones al campo "sueldo".
--Mensaje de error porque se infringe la restricción "CK_empleados_sueldo_positivo".
      alter table postgresssqlya.empleados
	  add constraint CK_empleados_sueldos
	  check (sueldo <0)  --ERROR:  check constraint "ck_empleados_sueldos" of relation "empleados" is violated by some row 


--10- Intente agregar un registro con fecha de nacimiento futura.
--Mensaje de error.

alter table postgresssqlya.empleados
add constraint CK_empleados_fechanacimiento
check(fechanacimiento>current_date) /*ERROR:  constraint "ck_empleados_fechanacimiento" for relation "empleados" already exists */

--11- Intente modificar un registro colocando en "cantidadhijos" el valor "21".
--Mensaje de error.
         update postgresssqlya.empleados 
		 set cantidadhijos=21
		 where documento ='22222222'

/*
ERROR:  new row for relation "empleados" violates check constraint "ck_empleados_cantidadhijos"
Failing row contains (22222222, Alberto Lopez, 1965-10-05, 21, Sistemas, 1000.00). 

*/
--Segundo Problema:

--Una playa de estacionamiento almacena los datos de los vehículos que ingresan en la tabla llamada "vehiculos".

--1- Cree la tabla:
drop table if exists postgresssqlya.vehiculos;

 create table postgresssqlya.vehiculos(
  numero serial,
  patente char(6),
  tipo char(4),
  fechahoraentrada timestamp,
  fechahorasalida timestamp,
  primary key(numero)
 );


select current_timestamp

--2- Ingresamos algunos registros:
 insert into postgresssqlya.vehiculos (patente,tipo,fechahoraentrada,fechahorasalida)
   values('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30');
 insert into postgresssqlya.vehiculos (patente,tipo,fechahoraentrada,fechahorasalida)
   values('CAA258','auto','2007/01/17 8:10',null);
 insert into postgresssqlya.vehiculos (patente,tipo,fechahoraentrada,fechahorasalida) 
   values('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');

--3- Agregue una restricción "check" para asegurarse que la fecha de entrada a la playa no sea posterior a la fecha y hora actual
   alter table postgresssqlya.vehiculos
   add constraint CK_verificacion_fechahoraentrada
   check (fechahoraentrada<=current_timestamp)

--4- Agregue otra restricción "check" al campo "fechahoraentrada" que establezca que sus valores 
--no sean posteriores a "fechahorasalida"
   alter table postgresssqlya.vehiculos
   add constraint CK_verficacion_fechahoraentrada
   check (fechahoraentrada<fechahorasalida)
   
    alter table postgresssqlya.vehiculos
   drop constraint  CK_verficacion_fechahoraentrada

--5- Intente ingresar un valor que no cumpla con la primera restricción establecida en el campo "fechahoraentrada"

 insert into postgresssqlya.vehiculos (patente,tipo,fechahoraentrada,fechahorasalida) 
   values('DSE368','moto','2026/05/03 12:30','2026/05/03 18:00');

--6- Intente modificar un registro para que la salida sea anterior a la entrada.Mensaje de error.
   update postgresssqlya.vehiculos 
   set fechahorasalida='2007/01/17 7:30'
   where patente='DSE367'

--7- Vea todas las restricciones para la tabla "vehiculos":
 select *
  from information_schema.table_constraints 
  where table_name = 'vehiculos';

--8- Vea todos los registros
select * from postgresssqlya.vehiculos; 