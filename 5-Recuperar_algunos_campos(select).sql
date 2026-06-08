drop table if exists peliculas;
/*
1-cree la tabla
*/
create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer, 
  cantidad integer
)
--2 vea la estructura de la tabla 
select table_name, column_name, udt_name, character_maximum_length
from information_schema.columns
where table_name='peliculas'

 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',180,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',190,2);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);
--4- Realice un "select" mostrando solamente el título y actor de todas las películas
  select titulo, actor from peliculas;
--5- Muestre el título y duración de todas las peliculas  
  select titulo, duracion from peliculas; 
--6- Muestre el título y la cantidad de copias  
  select titulo, cantidad from peliculas;

