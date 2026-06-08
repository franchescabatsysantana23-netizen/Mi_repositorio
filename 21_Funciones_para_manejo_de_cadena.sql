drop table if exists postgresssqlya.clientes;

create table postgresssqlya.clientes(
   documento char(8),
   apellido varchar(20),
   nombre varchar(20),
   domicilio varchar(30),
   telefono varchar(11)
);

 insert into postgresssqlya.clientes(documento,apellido,nombre,domicilio,telefono)
  values('2233344','Perez','Juan','Sarmiento 980','4342345');
 insert into postgresssqlya.clientes (documento,apellido,nombre,domicilio,telefono)
  values('2333344','Perez','Ana','Colon 234','2345123');
 insert into postgresssqlya.clientes(documento,apellido,nombre,domicilio,telefono)
  values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
 insert into postgresssqlya.clientes (documento,apellido,nombre,domicilio,telefono)
  values('2533344','Juarez','Ana','Urquiza 444','4789900');

--Mostrar todos los registros disponiendo en mayúsculas el apellido y el nombre.
select upper(apellido), upper(nombre) from postgresssqlya.clientes;

--4- Mostrar el primer caracter del nombre.
select substring(nombre from 1 for 1) from postgresssqlya.clientes;

--Longitud del texto nombre 
select char_length(nombre) as longitud from postgresssqlya.clientes;


--Mostrar todos los registros disponiendo en minusculas el apellido y el nombre.
select lower(apellido),lower(nombre) from (
      select 
   upper(apellido) as apellido, 
   upper(nombre) as nombre
   from postgresssqlya.clientes
) t

---funcion position 

select position('a' in 'juan') as p

----funcion leading con trim 

select trim(leading ' ' from ' Hola  Mundo ') --Elimina los espacios de la izquierda. 

select trim(trailing '-' from 'Hola Mundo     ') --trailing en conjunto con el operador trim elimina espacios de la derecha. 


select ltrim('  hola') --Elimina espacio de la izquierda. 

select rtrim('hola   ') -- Elimina espacio de la derecha.

select substr('Esto es una prueba',2,20) --> retorna el texto de la posicion indicada hasta la posicion deseada. 

select lpad('Prueba',8,'-') -->rellena de caracteres a la izquierda. 

select rpad('Prueba',8,'-') -->rellena de caracteres a la derecha. 
 







  