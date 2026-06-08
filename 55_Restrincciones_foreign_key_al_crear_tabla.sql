drop table if exists postgresssqlya.clientes; 
drop table if exists postgresssqlya.provincias;


create table postgresssqlya.provincias (
   codigo serial,
   nombre varchar(20),
   primary key(codigo)
)

create table postgresssqlya.clientes(
  codigo serial, 
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint references postgresssqlya.provincias(codigo),
  primary key(codigo)
)
insert into postgresssqlya.provincias values
(1,'Distrito Nacional'),
(2,'Azua'),
(3,'Baoruco'),
(4,'Barahona'),
(5,'Dajabón'),
(6,'Duarte'),
(7,'Elías Piña'),
(8,'El Seibo'),
(9,'Espaillat'),
(10,'Hato Mayor');

alter table postgresssqlya.clientes alter column ciudad TYPE  VARCHAR(30)




insert into postgresssqlya.clientes values
(1,'Juan Pérez','Calle 1 #10','Santo Domingo',1),
(2,'María López','Av. Independencia #45','Azua',2),
(3,'Carlos Sánchez','Calle Duarte #23','Neiba',3),
(4,'Ana Rodríguez','Av. Enriquillo #12','Barahona',4),
(5,'Luis Gómez','Calle Restauración #8','Dajabón',5),
(6,'Pedro Martínez','Av. Libertad #67','San Francisco de Macorís',6),
(7,'Laura Fernández','Calle Sánchez #34','Comendador',7),
(8,'Miguel Torres','Calle Colón #19','Santa Cruz del Seibo',8),
(9,'Sofía Ramírez','Av. Duarte #55','Moca',9),
(10,'Diego Herrera','Calle Principal #101','Hato Mayor del Rey',10);

insert into postgresssqlya.clientes values
(11,'Diego Herrera','Calle Principal #101','Hato Mayor del Rey',11);

DELETE FROM postgresssqlya.PROVINCIAS 
WHERE CODIGO=10


