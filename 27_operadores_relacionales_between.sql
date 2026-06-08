drop table if exists postgresssqlya.visitas;


create table postgresssqlya.visitas(
   numero serial,
   nombre varchar(30) default 'Anonimo',
   mail varchar(50),
   pais  varchar(20),
   fechayhora timestamp,
   primary key(numero)
);
 select * from postgresssqlya.visitas;


insert into postgresssqlya.visitas (nombre,mail,pais,fechayhora)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into postgresssqlya.visitas (nombre,mail,pais,fechayhora)
  values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
 insert into postgresssqlya.visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into postgresssqlya.visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into postgresssqlya.visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into postgresssqlya.visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');
 insert into postgresssqlya.visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
 insert into postgresssqlya.visitas (nombre,mail,pais)
  values ('Federico1','federicogarcia@xaxamail.com','Argentina');


--3- Seleccione los usuarios que visitaron la página entre el '2006-09-12' y '2006-10-11' (5 
--registros)Note que incluye los de fecha mayor o igual al valor mínimo y menores al valor máximo, y que los 
--valores null no se incluyen.
        select * from postgresssqlya.visitas
		where fechayhora between '2006-09-12' and  '2006-10-11'

--4- Recupere las visitas cuyo número se encuentra entre 2 y 5 (4 registros)
--Note que incluye los valores límites. 
   select * from postgresssqlya.visitas
   where numero between 2 and 5


--Segundo Problema

drop table if exists postgresssqlya.autos;

 create table postgresssqlya.autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio decimal(8,2),
  primary key(patente)
 );

 insert into postgresssqlya.autos
  values('ACD123','Fiat 128','1970',15000);
 insert into postgresssqlya.autos
  values('ACG234','Renault 11','1980',40000);
 insert into postgresssqlya.autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into postgresssqlya.autos
  values('GCD123','Renault Clio','1995',70000);
 insert into postgresssqlya.autos
  values('BCC333','Renault Megane','1998',95000);
 insert into postgresssqlya.autos
  values('BVF543','Fiat 128','1975',20000);

--3- Seleccione todos los autos cuyo modelo se encuentre entre '1970' y '1990' usando el operador 
--"between" y ordénelos por dicho campo(4 registros)

   select * from postgresssqlya.autos
   where modelo between '1970' and '1990'
   order by modelo

--4- Seleccione todos los autos cuyo precio esté entre 50000 y 100000.
 select * from postgresssqlya.autos
 where precio between 50000 and 100000

 

   

  