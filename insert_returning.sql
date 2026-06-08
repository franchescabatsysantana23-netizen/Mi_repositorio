select * from postgresssqlya.alumnos;

insert into postgresssqlya.alumnos (apellido,nombre,documento, domicilio,fechaingreso,fechanacimiento)
values('Rodriguez','Susana','22234','sosua 3','1991-04-01','1996-02-01')
returning *;  --retorna todos los campos de la insercion realizada. 



insert into postgresssqlya.alumnos (apellido,nombre,documento, domicilio,fechaingreso,fechanacimiento)
values('Rodriguez','Juana','22234','1osua 3','1992-04-01','1980-02-01')
returning apellido,domicilio,documento;  --retorna campos especificos de la insercion realizada. 