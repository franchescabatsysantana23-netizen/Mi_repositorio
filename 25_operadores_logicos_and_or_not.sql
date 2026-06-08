drop table if exists postgresssqlya.medicamentos;

create table postgresssqlya.medicamentos(
   codigo serial, 
   nombre character varying(20),
   laboratorio varchar(20),
   precio decimal(5,2),
   cantidad smallint,
   primary key(codigo)
)
 insert into postgresssqlya.medicamentos (nombre,laboratorio,precio,cantidad)
  values('Sertal','Roche',5.2,100);
 insert into postgresssqlya.medicamentos (nombre,laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into postgresssqlya.medicamentos (nombre,laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);
 insert into postgresssqlya.medicamentos (nombre,laboratorio,precio,cantidad)
  values('Paracetamol 500','Bago',1.90,200);
 insert into postgresssqlya.medicamentos (nombre,laboratorio,precio,cantidad)
  values('Bayaspirina','Bayer',2.10,150); 
 insert into postgresssqlya.medicamentos (nombre,laboratorio,precio,cantidad)
  values('Amoxidal jarabe','Bayer',5.10,250); 


--3- Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea 'Roche' y cuyo precio sea 
--menor a 5 (1 registro cumple con ambas condiciones)

select codigo, nombre from postgresssqlya.medicamentos 
where laboratorio='Roche' and precio<5


--4- Recupere los medicamentos cuyo laboratorio sea 'Roche' o cuyo precio sea menor a 5 (4 registros)
--Note que el resultado es diferente al del punto 4, hemos cambiado el operador de la sentencia anterior.

select * from postgresssqlya.medicamentos 
where laboratorio ='Roche' or precio <5



--5- Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100 (1 registro).
select * from postgresssqlya.medicamentos 
where (not laboratorio ='Bayer') and (cantidad=100)


--6- Muestre todos los medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100 (2 registros)
--Analice estas 2 últimas sentencias. El operador "not" afecta a la condición a la cual antecede, no a 
--las siguientes. Los resultados de los puntos 6 y 7 son diferentes.
select * from postgresssqlya.medicamentos
where laboratorio='Bayer' and not cantidad=100



--7- Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10 (1 
--registro eliminado).

    delete from postgresssqlya.medicamentos
	where laboratorio='Bayer' and precio >10


--8- Cambie la cantidad por 200, a todos los medicamentos de "Roche" cuyo precio sea mayor a 5 (1 
--registro afectado).
        update postgresssqlya.medicamentos
		set cantidad=200
		where laboratorio='Roche' and precio >5
 select * from postgresssqlya.medicamentos;


--9- Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3 (3 registros borrados)

  delete from postgresssqlya.medicamentos 
  where (laboratorio ='Bayer') or (precio <3

   select * from postgresssqlya.medicamentos;

---Segundo Problema 

drop table if exists postgresssqlya.peliculas;

create table postgresssqlya.peliculas(
   codigo serial,
   titulo varchar(40) not null,
   actor varchar(20),
   duracion smallint,
   primary key(codigo));

  insert into postgresssqlya.peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into postgresssqlya.peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into postgresssqlya.peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into postgresssqlya.peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into postgresssqlya.peliculas (titulo,actor,duracion)
  values('Mujer bonita','Richard Gere',120);
 insert into postgresssqlya.peliculas (titulo,actor,duracion)
  values('Tootsie','D. Hoffman',90);
 insert into postgresssqlya.peliculas (titulo,actor,duracion)
  values('Un oso rojo','Julio Chavez',100);
 insert into postgresssqlya.peliculas (titulo,actor,duracion)
  values('Elsa y Fred','China Zorrilla',110);
 

--3- Recupere los registros cuyo actor sea "Tom Cruise" or "Richard Gere" (3 registros)

    select * from postgresssqlya.peliculas 
	where actor ='Tom Cruise' or actor='Richard Gere'
--4- Recupere los registros cuyo actor sea "Tom Cruise" y duración menor a 100 (ninguno cumple ambas condiciones)
      select * from postgresssqlya.peliculas
	  where actor='Tom Cruise' and duracion <100

--5- Cambie la duración a 200, de las películas cuyo actor sea "Daniel R." y cuya duración sea 180 (1 registro afectado)
     update postgresssqlya.peliculas
	 set duracion=200
--	 select * from postgresssqlya.peliculas
	 where actor ='Daniel R.' and duracion=180

--6- Borre todas las películas donde el actor NO sea "Tom Cruise" y cuya duración sea mayor o igual a 100 (2 registros eliminados) 
      
       delete from postgresssqlya.peliculas 
	   where (not actor ='Tom Cruise') and (duracion >=100)