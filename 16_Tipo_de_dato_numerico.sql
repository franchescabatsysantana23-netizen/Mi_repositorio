create table sqlserverya.cuentas(
   numero_cuenta int primary key, 
   documento_propietario character(8) not null,
   nombre_del_propietario character varying(30),
   saldo decimal(20,2)
   )
   select table_name, column_name,character_maximum_length, 
   is_nullable 
   from information_schema.columns
   where table_name='cuentas'
   select * from information_schema.table_constraints
   where table_name='cuentas'


  insert into sqlserverya.cuentas
  values('1234','25666777','Pedro Perez',500000.60);
 insert into sqlserverya.cuentas
  values('2234','27888999','Juan Lopez',-250000);
 insert into sqlserverya.cuentas
  values('3344','27888999','Juan Lopez',4000.50);
 insert into sqlserverya.cuentas
  values('3346','32111222','Susana Molina',1000);

--3- Seleccione todos los registros cuyo saldo sea mayor a "4000" (2 registros)
select * from sqlserverya.cuentas 
where saldo>4000;

--4- Muestre el número de cuenta y saldo de todas las cuentas cuyo propietario sea "Juan Lopez" (2 
--registros)
select numero_cuenta, saldo from sqlserverya.cuentas
where nombre_del_propietario='Juan Lopez'
--5- Muestre las cuentas con saldo negativo (1 registro)
select * from sqlserverya.cuentas 
where saldo<0

--6- Muestre todas las cuentas cuyo número es igual o mayor a "3000" (2 registros):
select * from sqlserverya.cuentas 
where saldo>=3000

--Segundo Problema

create table sqlserverya.empleados(
   nombre character varying(30),
   documento character(8),
   sexo character(1),
   domicilio character varying(30),
   sueldobasico decimal(10,2),
   cantidadhijos smallint);

 insert into sqlserverya.empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Juan Perez','22333444','m','Sarmiento 123',500,2);
 insert into sqlserverya.empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Ana Acosta','24555666','f','Colon 134',850,0);
 insert into sqlserverya.empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);

--3- Ingrese un valor de "sueldobasico" con más decimales que los definidos

 insert into sqlserverya.empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.808999,4);
select * from sqlserverya.empleados;

--4- Intente ingresar un sueldo que supere los 10 dígitos (no lo permite)
 insert into sqlserverya.empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',10000777777.808999,4)

 --5- Muestre todos los empleados cuyo sueldo no supere los 900 pesos (1 registro):
 select * from sqlserverya.empleados 
 where sueldobasico<=900
  
--6- Seleccione los nombres de los empleados que tengan hijos (3 registros):
select * from sqlserverya.empleados
where cantidadhijos>0


  