drop table if exists agenda;

create table agenda(
   apellido varchar(30),
   nombre varchar(20),
   domicilio varchar(30),
   telefono varchar(11)
)
select table_name,column_name, udt_name, character_maximum_length
from information_schema.columns
where table_name='agenda'

insert into agenda values 
('Acosta','Ana','Colon 123','423456'),
('Bustamante','Betina','Avellanada 135','4458787'),
('Lopez','Hector','Salta 545','4887788'),
('Lopez','Luis','Urquiza 333','4545454'),
('Lopez','Marisa','Urquiza 333','4545454');

select * from agenda; 
select * from agenda 
where nombre='Marisa'

select nombre, domicilio from agenda 
where apellido='Lopez'

select nombre from agenda 
where telefono='4545454'

---Segundo problema 

drop table if exists libros;

create table libros (
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15));

 select table_name,column_name, udt_name, character_maximum_length
from information_schema.columns
where table_name='libros' 

insert into libros 
values
('El aleph','Borges','Emece'),
('Martin Fierro','Jose Hernandez','Emece'),
('Martin Fierro','Jose Hernandez','Planeta'),
('Aprenda PHP','Mario Molina','Siglo XXI');

select * from libros 
where autor ='Borges'

select titulo from libros 
where editorial='Emece'

select editorial from libros 
where titulo ='Martin Fierro'

