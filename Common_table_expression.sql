/*Common Table Expresion
with alias_del_cte as (
     select campos(s)
	      from tablas(s)

)
  select | insert | update | delete
*/
--- text
SELECT table_name,column_name,udt_name,character_maximum_length 
  FROM information_schema.columns WHERE table_name = 'sobreviviente';

 with consulta as (
      select nombre, sexo,survived
	  from titanic
	  where survived =1
 ),
 update_consulta as(
    select sexo from titanic 
	where sexo='female'
 )
 ,
 delete_consulta as 
 (
    select sexo from sobreviviente
	where sexo ='male'
 )
 -- insert into sobreviviente
 -- select nextval('id_survived'),nombre,sexo,survived from consulta

 --update sobreviviente 
 --set apellido = substring(nombre,position(','in nombre)+1,length(nombre)-position(','in nombre))
 --where sexo in (select sexo from update_consulta)

    delete from sobreviviente
	where sexo in (select sexo from delete_consulta)


 select * from sobreviviente 
 where sexo ='female';

 SELECT POSITION('A' IN 'OpenAI');

 LENGTH('OpenAI SQL') - 4;

 select substring(nombre,position(','in nombre)+1,length(nombre)-position(','in nombre)) as apellido from sobreviviente;



 alter table sobreviviente add column apellido character varying(100)



 select * from titanic;

create sequence id_survived
start with 1
increment by 1
Maxvalue 20000
minvalue 1
no cycle;


alter table sobreviviente alter column id set default nextval('id_survived');
alter table sobreviviente alter column nombre type varchar(100)

select * from titanic;

create table sobreviviente(
       id integer default nextval('id_survived'), 
	   nombre character varying(60),
	   sexo char(6), 
	   survived int,
	   primary key(id)
)