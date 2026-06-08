drop table libros;

 create table libros(
  titulo character varying(40),
  autor character varying(30),
  editorial character varying(20),
  precio decimal(5,2)
 );

 insert into libros values('Uno','Richard Bach','Planeta',15);
 insert into libros values('Ilusiones','Richard Bach','Planeta',18);
 insert into libros values('El aleph','Borges','Emece',25);
 insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',45);
 insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values('Java en 10 minutos','Mario Molina','Paidos',35);

 -- La librería, frecuentemente, aumenta los precios de los libros en un 10%.
 -- Necesitamos un procedimiento almacenado que actualice los precios de los
 -- libros aumentándolos en un 10%:
 create or replace procedure pa_libros_aumentar10()
 language plpgsql
  as $$
  begin
   update libros set precio=precio+(precio*0.1);
  end;
  $$;
  
 -- Lo ejecutamos:
 call pa_libros_aumentar10()

 -- Verificamos que los precios han aumentado:
 select * from libros;

 -- Eliminamos el procedimiento almacenado que acabamos de crear

 drop procedure pa_libros_aumentar10