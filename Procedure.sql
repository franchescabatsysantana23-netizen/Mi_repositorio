
/*
CREATE OR REPLACE PROCEDURE nombre_procedimiento()
LANGUAGE plpgsql
AS $$
BEGIN
    -- código
END;
$$;

*/

/*
Primer problema:
Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".

1- Eliminamos la tabla y la creamos:
*/
  drop table empleados;

 create table empleados(
  documento char(8),
  nombre character varying(20),
  apellido character varying(20),
  sueldo decimal(6,2),
  cantidadhijos decimal(2,0),
  fechaingreso date,
  primary key(documento)
 );
--2- Ingrese algunos registros:

 insert into empleados values('22222222','Juan','Perez',200,2,'1980/10/10');
 insert into empleados values('22333333','Luis','Lopez',250,0,'1990/02/10');
 insert into empleados values('22444444','Marta','Perez',350,1,'1995/05/02');
 insert into empleados values('22555555','Susana','Garcia',400,2,'2008/12/15');
 insert into empleados values('22666666','Jose Maria','Morales',500,3,'2015/08/25');

 
--3- Cree (o reemplace) el procedimiento almacenado llamado "pa_aumentarsueldo" 
--que aumente los sueldos inferiores al promedio en un 20%

create or replace procedure pa_aumentarsueldo()
language plpgsql
as $$
begin 
     update empleados 
	 set sueldo=sueldo +(sueldo*0.20)
	 where sueldo < (select avg(sueldo) from empleados);
	 raise notice 'sueldo actualizado';
end;
 $$;

 -- documento 22222222,22333333

select * from empleados
where sueldo < (select avg(sueldo) from empleados);

 -- documento 22222222,22333333,22444444

--4- Ejecute el procedimiento creado anteriormente

   call pa_aumentarsueldo()

--5- Verifique que los sueldos han aumentado
 select * from empleados 
 where documento in ('22222222','22333333')

--6- Ejecute el procedimiento nuevamente
call pa_aumentarsueldo()

--7- Verifique que los sueldos han aumentado
 select * from empleados 
 where documento in ('22222222','22333333','22444444')

--8- Elimine la tabla "empleados_antiguos"
 drop table if exists empleados_antiguos;

--9- Cree la tabla "empleados_antiguos"

 create table empleados_antiguos(
  documento char(8),
  nombre character varying(40)
);
---10- Cree (o reemplace) un procedimiento almacenado que ingrese en la tabla "empleados_antiguos"
--el documento, nombre y apellido (concatenados) de todos los empleados de la tabla "empleados"
--que ingresaron a la empresa hace más de 10 años.

create or replace procedure pa_insertardatos_empleados_antiguos()
language plpgsql
as $$
begin
      insert into empleados_antiguos(documento,nombre)
	   select documento, nombre||' '||apellido from empleados
	    where extract(year from current_date) -extract(year from fechaingreso) >10;

	  raise notice 'registro insertado';
end; 
$$;
--11- Ejecute el procedimiento creado anteriormente

call pa_insertardatos_empleados_antiguos()

--12- Verifique que la tabla "empleados_antiguos" ahora tiene registros (3 registros)
select * from empleados_antiguos;



