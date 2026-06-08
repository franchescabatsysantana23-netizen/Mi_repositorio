

drop table if exists postgresssqlya.visitas;

create table postgresssqlya.visitas (
  numero serial,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha timestamp,
  primary key(numero)
);


 insert into postgresssqlya.visitas (nombre,mail,pais,fecha)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into postgresssqlya.visitas (nombre,mail,pais,fecha)
  values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
 insert into postgresssqlya.visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into postgresssqlya.visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into postgresssqlya.visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into postgresssqlya.visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
 insert into postgresssqlya.visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');


--3- Ordene los registros por fecha, en orden descendente.
    select * from postgresssqlya.visitas
	order by fecha desc


--4- Muestre el nombre del usuario, pais y el número de mes, ordenado por pais (ascendente)
-- y número de mes (descendente)

    select nombre,pais,extract(month from fecha) nro_mes
	from postgresssqlya.visitas
	order by pais,extract(month from fecha) desc 

	  select nombre,pais,extract(month from fecha) nro_mes
	from postgresssqlya.visitas
	order by pais,nro_mes desc 


    select nombre,pais,extract(month from fecha) nro_mes
	from postgresssqlya.visitas
	order by pais,3 desc 

--5- Muestre el pais, el mes, el día y la hora y ordene las visitas por nombre del mes, del día y la 
--hora.
 select pais, extract(month from fecha) nro_mes, 
    extract(day from fecha) dia, extract(hour from fecha) hora 
	from postgresssqlya.visitas
	order by nro_mes,dia,hora 

	 select pais, extract(month from fecha) nro_mes, 
    extract(day from fecha) dia, extract(hour from fecha) hora 
	from postgresssqlya.visitas
	order by 2,3,4 

---6- Muestre los mail, país, ordenado por país, de todos los que visitaron la página 
--en octubre (4 
--registros)

select mail, pais 
from postgresssqlya.visitas
where extract(month from fecha)=10
order by pais


  
