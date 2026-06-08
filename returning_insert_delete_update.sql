
insert into postgresssqlya.alumnos (apellido,nombre,documento, domicilio,fechaingreso,fechanacimiento)
values('Rodriguez','Juana','22234','1osua 3','1992-04-01','1980-02-01')
returning apellido,domicilio,documento;  ---> retorna los campos apellidos,domicilio, documento del registro insertado. 

update postgresssqlya.alumnos
set domicilio ='maximo gomez 123'
where domicilio ilike '1osua 3'
returning *; ---> retorna los registros que se han actualizado en la tabla. 


delete from postgresssqlya.alumnos
returning *; ---> retorna los registros que se han eliminado de la tabla. 

create database dvdrental;