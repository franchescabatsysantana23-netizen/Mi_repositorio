drop table if exists postgresssqlya.clientes;

create table postgresssqlya.clientes (
  codigo serial,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  credito decimal(9,2),
  primary key(codigo)
);

 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba',1900.56);
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba',450.33);
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba',190);
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Olmos Luis','Sarmiento 444','Rosario','Santa Fe',670.22);
 insert into postgresssqlya.clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba',500.55);

select * from postgresssqlya.clientes;

select ceil(credito) from postgresssqlya.clientes;
select ceiling(credito) from postgresssqlya.clientes;


select abs(-50) valor_absoluto;

select cbrt(20) raiz_cubica; 

select floor(20.7) redondeo_hacia_abajo; 

select ceil(20.7) redondeo_hacia_arriba; 

select power(5,2) potencia_x_elevado_y;

select round(10.464) redondeo_proximo; 

select sign(-10) --si el argumento es un valor positivo devuelve 1;-1 si es negativo y si es 0, 0.

select sign(10)

select sign(0)

select sqrt(50) raiz_cuadrada;

select mod(45,5) --devuelve el resto de dividir x con respecto a y.

select pi() --retorna el pi

select random() -- devuelve un valor aleatorio entre 0 y 1. 

select trunc(51.56688)  ---retorna el valor entero
select trunc(50.55566999,2)  --retorna el valor y la parte decimal truncado hasta el valor indicado en el segundo parametro. 


select sin(51) --Retorna el valor del seno en radianes.

select cos(52) --Retorna el valor del coseno en radianes.

select tan(67) --Retorna el valor de la tangente en radianes..



