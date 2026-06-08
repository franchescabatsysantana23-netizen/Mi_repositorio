create table sqlserverya.visitantes(
   nombre varchar(30),
   edad smallint, 
   sexo char(1) default 'f',
   domicilio varchar(30),
   ciudad varchar(20) default 'Cordoba',
   telefono varchar(11),
   mail varchar(30) default 'no tiene',
   montocompra decimal(6,2)
);

select 
  table_name,column_name,
  udt_name, character_maximum_length,
  is_nullable, column_default
  from information_schema.columns
  where table_name='visitantes';


--3- Ingrese algunos registros sin especificar valores para algunos campos para ver cómo opera la 
--   cláusula "default":
       insert into sqlserverya.visitantes (nombre,edad,domicilio,telefono,montocompra)
	     values('franchesca',30,'maria montez','8494989898',600)
		 
     insert into sqlserverya.visitantes (nombre,edad,domicilio,telefono,mail,montocompra)
	     values('sofia',30,'maria montez','8494989898','prueba@prueba.com',600)

		 select * from sqlserverya.visitantes;



-- 4- Use la palabra "default" para ingresar valores en un insert.

     insert into sqlserverya.visitantes (nombre,edad,sexo,domicilio,ciudad,telefono,mail,montocompra)
	     values('sofia',30,default,'maria montez',default,'8494989898',default,600)

		 select * from sqlserverya.visitantes;
--5- Ingrese un registro con "default values".
insert into sqlserverya.visitantes
default values


select * from sqlserverya.visitantes;

--renombrando el esquema
alter schema sqlserverya rename to postgressSQLya;

-- Segundo Problema 

drop table if exists prestamos;
--cree la tabla 
create table postgresssqlya.prestamos(
   titulo varchar(40) not null,
   documento char(8) not null,
   fechaprestamo date not null,
   fechadevolucion date, 
   devuelto character(1) default 'n'
);

 insert into postgresssqlya.prestamos (titulo,documento,fechaprestamo,fechadevolucion)
  values ('Manual de 1 grado','23456789','2006-12-15','2006-12-18');
 insert into postgresssqlya.prestamos (titulo,documento,fechaprestamo)
  values ('Alicia en el pais de las maravillas','23456789','2006-12-16');
 insert into postgresssqlya.prestamos (titulo,documento,fechaprestamo,fechadevolucion)
  values ('El aleph','22543987','2006-12-16','2006-08-19');
 insert into postgresssqlya.prestamos (titulo,documento,fechaprestamo,devuelto)
  values ('Manual de geografia 5 grado','25555666','2006-12-18','s');

  select * from postgresssqlya.prestamos;


--  4- Ingrese un registro colocando "default" en los campos que lo admiten y vea cómo se almacenó.

      insert into postgresssqlya.prestamos (titulo,documento,fechaprestamo,devuelto)
       values ('Manual de matematica 5 grado','21153666',default,default);
  
-- 5- Intente ingresar un registro con "default values" y analice el mensaje de error (no se puede)
      insert into postgresssqlya.prestamos 
	  default values