--1- Cree una tabla alumnos

create table sqlserverya.alumnos(
  apellido varchar(30),
  nombre varchar(30),
  documento character(8),
  domicilio character varying(30),
  fechaingreso date, 
  fechanacimiento date);

  --2- Setee el formato para entrada de datos de tipo fecha para que acepte valores "día-mes-año" 
  set datestyle to 'European'
  --3- Ingrese un alumno empleando distintos separadores para las fechas:
  insert into sqlserverya.alumnos values
   ('Juarez','Bernardo','99999999','republica de colombia','21-08-1990','10/11/2020')

 --4- Ingrese otro alumno empleando solamente un dígito para día y mes y 2 para el año:
   insert into sqlserverya.alumnos values
   ('Juarez','Bernardo','99999999','republica de colombia','2-8-90','10/11/2020')

  --5- Ingrese un alumnos empleando 2 dígitos para el año de la fecha de ingreso y "null" en 
"fechanacimiento":
   insert into sqlserverya.alumnos values
   ('Jacinto','Bernardo','12233445','republica de colombia','2-8-90',null)
   
 --6- Intente ingresar un alumno con fecha de ingreso correspondiente a "15 de marzo de 1990" pero en 
-- orden incorrecto  
        insert into sqlserverya.alumnos values
   ('marta','Bernardo','12233445','republica de colombia','90-15-3',null)

   --7- Muestre todos los alumnos que ingresaron antes del '1-1-91'. 1 registro
   select * from sqlserverya.alumnos
   where fechaingreso <'1-1-91';
   --8- Muestre todos los alumnos que tienen "null" en "fechanacimiento". 1 registro
   select * from sqlserverya.alumnos
   where fechanacimiento is null;
   
     