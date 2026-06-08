drop table if exists postgresssqlya.empleados;

create table postgresssqlya.empleados(
    nombre varchar(30),
	documento character(8),
	domicilio character varying(30),
	fechaingreso date,
	seccion varchar(20),
	sueldo decimal(6,2),
	primary key(documento));

 insert into postgresssqlya.empleados
  values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
 insert into postgresssqlya.empleados
  values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
 insert into postgresssqlya.empleados
  values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
 insert into postgresssqlya.empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
 insert into postgresssqlya.empleados
  values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
 insert into postgresssqlya.empleados
  values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
 insert into postgresssqlya.empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

  select * from postgresssqlya.empleados;

--3- Muestre todos los empleados con apellido "Perez" empleando el operador "like" (3 registros)
   select * from postgresssqlya.empleados
   where nombre like '%Perez';

--4- Muestre todos los empleados cuyo domicilio comience con "Co" y tengan un "8" (2 registros)
          select * from postgresssqlya.empleados
		  where domicilio like 'Co%8%'

--5- Muestre todos los nombres y sueldos de los empleados cuyos sueldos incluyen centavos (3 registros)
         select nombre, sueldo from postgresssqlya.empleados
		 where cast(sueldo as varchar) not like '%.00'

--6- Muestre los empleados que hayan ingresado en "1990" (3 registros)	
        select * from postgresssqlya.empleados
		where cast(fechaingreso as text) like '1990%'

        select * from postgresssqlya.empleados
		where fechaingreso::text like '1990%'

		  select * from postgresssqlya.empleados
		where cast(fechaingreso as varchar) like '1990%'

		-- ~~ este simbolo en postgress actua como like

		 select * from postgresssqlya.empleados
		where cast(fechaingreso as varchar) ~~ '1990%'

--operador    --Equivalente
~~             Like
~~*            ilike
!~~            not like
!~~*           not ilike

		

--operador ilike 
select 
    'perro' ilike 'PERR_%';

select 
    'perro' like 'perr_%';


select 
    'perro' ilike '%perro%';	



select 
    'perro' ilike 'perro_%';


	select 'gato' ilike 'g_t_%'
		/*el operador ilike de postgress no le importas las mayusculas y minusculas. */
		
select 'gato' ilike 'G_T_%'