
drop table if exists agenda

Create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
)

insert into agenda values
('Alvarez','Alberto','Colon 123','4234567'),
('Juarez','Juan','Avellaneda 135','4458787'),
('Lopez','Maria','Urquiza 333','4545454'),
('Lopez','Jose','Urquiza 333','4545454'),
('Salas','Susana','Gral. Paz 1234','4123456');
--3- Elimine el registro cuyo nombre sea "Juan" (1 registro afectado)
delete from agenda 
where nombre='Juan'
--4- Elimine los registros cuyo número telefónico sea igual a "4545454" (2 registros afectados)
delete from agenda 
where telefono ='4545454'

--5- Muestre la tabla.
select * from agenda; 

--6- Elimine todos los registros (2 registros afectados)
delete from agenda;

--6- Muestre la tabla.
select * from agenda; 


--Segundo Problema 
drop table if exists articulos;

 create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 );
--2 Ingrese algunos registros; 
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);

--3- Elimine los artículos cuyo precio sea mayor o igual a 500 (2 registros)
delete from articulos 
where precio >=500; 

select * from articulos;


delete from articulos
where nombre='impresora';
select * from articulos;

delete from articulos 
where codigo <>4;

select * from articulos;

 
