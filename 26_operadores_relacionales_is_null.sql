drop table if exists peliculas; 

create table postgresssqlya.peliculas(
  codigo serial,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion smallint,
  primary key (codigo)
 );

 insert into postgresssqlya.peliculas(titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into postgresssqlya.peliculas(titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',null);
 insert into postgresssqlya.peliculas(titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into postgresssqlya.peliculas(titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into postgresssqlya.peliculas(titulo,actor,duracion)
  values('Mujer bonita',null,120);
 insert into postgresssqlya.peliculas(titulo,actor,duracion)
  values('Tootsie','D. Hoffman',90);
 insert into postgresssqlya.peliculas (titulo)
  values('Un oso rojo');

--3- Recupere las películas cuyo actor sea nulo (2 registros)

     select * from postgresssqlya.peliculas 
	 where actor is null; 

--4- Cambie la duración a 0, de las películas que tengan duración igual a "null" (2 registros)

   update postgresssqlya.peliculas 
   set duracion=0
   where duracion is null

--5- Borre todas las películas donde el actor sea "null" y cuya duración sea 0 (1 registro)
        select * from postgresssqlya.peliculas 
		where (actor is null) and (duracion =0)

        delete from postgresssqlya.peliculas 
		where (actor is null) and (duracion =0)

		select * from postgresssqlya.peliculas;
 