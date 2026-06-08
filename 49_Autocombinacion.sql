/*Primer problema:
Una agencia matrimonial almacena la información de sus clientes en una tabla llamada "clientes".
1- Cree la tabla:*/

drop table if exists clientes;

 create table clientes(
  nombre varchar(30),
  sexo char(1),--'f'=femenino, 'm'=masculino
  edad int,
  domicilio varchar(30)
 );

--2- Ingrese los siguientes registros:
 insert into clientes values('Maria Lopez','f',45,'Colon 123');
 insert into clientes values('Liliana Garcia','f',35,'Sucre 456');
 insert into clientes values('Susana Lopez','f',41,'Avellaneda 98');
 insert into clientes values('Juan Torres','m',44,'Sarmiento 755');
 insert into clientes values('Marcelo Oliva','m',56,'San Martin 874');
 insert into clientes values('Federico Pereyra','m',38,'Colon 234');
 insert into clientes values('Juan Garcia','m',50,'Peru 333');

--3- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo 
--masculino. Use un  "cross join" (12 registros)
     select c.nombre, c.sexo,t.nombre,t.sexo
	     from clientes c cross join clientes t
          where c.sexo='f' and t.sexo='m'

--4- Obtenga la misma salida anterior pero realizando un "join".
       select c.nombre,c.sexo,t.nombre,t.sexo
	   from clientes c inner join clientes t 
	   on  c.nombre !=t.nombre
	   where c.sexo='f' and t.sexo='m'

	   select c.nombre,c.sexo,t.nombre,t.sexo
	   from clientes c inner join clientes t 
	   on  c.nombre <>t.nombre
	   where c.sexo='f' and t.sexo='m'


       select c.nombre,c.sexo,t.nombre,t.sexo
	   from clientes c inner join clientes t 
	   on  not c.nombre =t.nombre
	   where c.sexo='f' and t.sexo='m'

       select c.nombre,c.sexo,t.nombre,t.sexo
	   from clientes c inner join clientes t 
	   on c.sexo='f' and t.sexo='m'
	  
--5- Realice la misma autocombinación que el punto 3 pero agregue la condición que las parejas no 
--tengan una diferencia superior a 5 años (5 registros)

  select c.nombre, c.sexo,t.nombre,t.sexo, c.edad -t.edad diferencia
	     from clientes c cross join clientes t
          where c.sexo='f' and t.sexo='m'
		  and c.edad -t.edad between -5 and 5

