

drop table if exists postgresssqlya.alumnos;

create table postgresssqlya.alumnos(
    apellido varchar(30),
	nombre varchar(30),
	documento char(8),
	domicilio varchar(30),
	fechaingreso date,
	fechanacimiento date);

    select * from postgresssqlya.alumnos;
	
--2- Setee el formato para entrada de datos de tipo fecha para que acepte valores "día-mes-año"

   set datestyle to 'European'
   
--3- Ingrese un alumno empleando distintos separadores para las fechas

       insert into postgresssqlya.alumnos (apellido,nombre,documento,domicilio,fechaingreso, fechanacimiento)
	   values('santana','franchesca','333333','maximo gomez 123','29/04/2026','10/10/1994');
	   
       insert into postgresssqlya.alumnos (apellido,nombre,documento,domicilio,fechaingreso, fechanacimiento)
	   values('santana','sofia','343333','maximo gomez 123','29-04-2026','10/11/1994');
	 
--4- Ingrese otro alumno empleando solamente un dígito para día y mes y 2 para el año

      insert into postgresssqlya.alumnos (apellido,nombre,documento,domicilio,fechaingreso, fechanacimiento)
	   values('santana','sofia','343333','maximo gomez 123','1-4-26','1/2/95');

	   insert into postgresssqlya.alumnos (apellido,nombre,documento,domicilio,fechaingreso, fechanacimiento)
	   values('Rodriguez','sofia','243333','maximo gomez 123','1-4-90','1/2/95');
	   
--5- Ingrese un alumnos empleando 2 dígitos para el año de la fecha de ingreso y "null" en "fechanacimiento"
      insert into postgresssqlya.alumnos (apellido,nombre,documento,domicilio,fechaingreso, fechanacimiento)
	   values('Liriano','maria','343334','Nicolas Ovando 123','1-4-25',null);

--6- Muestre todos los alumnos que ingresaron antes del '1-1-91'.
      select * from postgresssqlya.alumnos
	  where fechaingreso<'1-1-91'

--7- Muestre todos los alumnos que tienen "null" en "fechanacimiento":
      select * from postgresssqlya.alumnos
	  where fechanacimiento is null

--8- Muestre el año de nacimiento de todos los alumnos.

   select extract(year from fechanacimiento) as ano from postgresssqlya.alumnos;

   select extract(day from fechanacimiento) as dia from postgresssqlya.alumnos;    

    select extract(month from fechanacimiento) as mes from postgresssqlya.alumnos;   

    select current_date as fecha_actual --retorna el ano mes y dia. 
	select current_time as hora_actual --retorna la hora,minutos y segundos, milis
	select current_timestamp
	
	select extract(hour from current_time) as hora 
    select extract(minute from current_time) as minutos
	select extract(second from current_time) as segundos

    select extract(century from current_timestamp) as siglo

    select extract(dow from current_timestamp) as diaSemana
	select extract(doy from current_timestamp) as diaDelAno

    select extract(week from current_timestamp) as diaDelaSemanaAno

	select extract(quarter from current_timestamp) as retorna_cuarto_ano;
	
   select extract(hour from timestamp '2026-04-30 11:22:50') as hora 
    select extract(minute from timestamp '2026-04-30 11:22:50') as minutos
	select extract(second from timestamp '2026-04-30 11:22:50') as segundos

    select extract(century from timestamp '1994-04-30 11:22:50') as siglo

    select extract(dow from timestamp '2026-04-30 11:22:50') as diaSemana
	select extract(doy from timestamp '2026-04-30 11:22:50') as diaDelAno

    select extract(week from timestamp '2026-04-30 11:22:50') as diaDelaSemanaAno

	select extract(quarter from timestamp '2026-04-30 11:22:50') as retorna_cuarto_ano;