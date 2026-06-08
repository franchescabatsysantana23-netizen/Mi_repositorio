/*Primer problema:
Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".

1- Eliminamos la tabla y la creamos:
*/
 drop table empleados;

 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  fechaingreso date
 );
--2- Ingrese algunos registros:

 insert into empleados values('22222222','Juan','Perez',300,'1980/10/10');
 insert into empleados values('22333333','Luis','Lopez',300,'1998/05/10');
 insert into empleados values('22444444','Marta','Perez',500,'1990/08/25');
 insert into empleados values('22555555','Susana','Garcia',400,'2000/05/05');
 insert into empleados values('22666666','Jose Maria','Morales',400,'2005/10/24');
 
--3- Cree un procedimiento almacenado llamado "pa_empleados_aumentarsueldo". Debe incrementar el
--sueldo de los empleados con cierta cantidad de años en la empresa (parámetro "ayear" de
--tipo numérico) en un porcentaje (parámetro "aporcentaje" de tipo numerico); es decir, recibe 2 parámetros.

create or replace procedure pa_empleado_aumentarsueldo(ayear int, aporcentaje int)
language plpgsql
as $$ 
begin 
	update empleados 
	set sueldo= sueldo + sueldo * (aporcentaje/100)
	where extract(year from current_date)-extract(year from fechaingreso)>ayear;
end;
$$;

--4- Ejecute el procedimiento creado anteriormente.
  call pa_empleado_aumentarsueldo(10,20)


--5- Verifique que los sueldos de los empleados con más de 10 años en la empresa han aumentado un 20%
select empleados.*,extract(year from current_date)-extract(year from fechaingreso) ayear from empleados 

--6- Ejecute el procedimiento creado anteriormente enviando otros valores como parámetros (por ejemplo, 8 y 10)
    call pa_empleado_aumentarsueldo(8,10)

--7- Verifique que los sueldos de los empleados con más de 8 años en la empresa han aumentado un 10%


--8- Ejecute el procedimiento almacenado "pa_empleados_aumentarsueldo" sin parámetros

--9- Cree un procedimiento almacenado llamado "pa_empleados_ingresar" que ingrese un empleado en la tabla "empleados", debe recibir valor para el documento, el nombre, apellido y almacenar valores nulos en los campos "sueldo" y "fechaingreso"

--10- Ejecute el procedimiento creado anteriormente y verifique si se ha ingresado en "empleados" un nuevo registro

--11- Reemplace el procedimiento almacenado llamado "pa_empleados_ingresar" para que ingrese un empleado en la tabla "empleados", debe recibir valor para el documento (con valor por defecto nulo) y fechaingreso (con la fecha actual como valor por defecto), los demás campos se llenan con valor nulo

--12- Ejecute el procedimiento creado anteriormente enviándole valores para los 2 parámetros y verifique si se ha ingresado en "empleados" un nuevo registro

--13- Ejecute el procedimiento creado anteriormente enviando solamente la fecha de ingreso y vea el resultado
--Oracle toma el valor enviado como primer argumento e intenta ingresarlo en el campo "documento", muestra un mensaje de error indicando que el valor es muy grande, ya que tal campo admite 8 caracteres.

--14- Cree (o reemplace) un procedimiento almacenado que reciba un documento y elimine de la tabla "empleados" el empleado que coincida con dicho documento

--15- Elimine un empleado empleando el procedimiento del punto anterior

--16- Verifique la eliminación