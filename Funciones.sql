create or replace function dividir(integer, decimal) returns decimal(10,2)
as 
  $$
    select $1/$2
   $$
   language sql;

   select dividir(5,10.5)


create or replace function sumar(integer,integer) returns int
 as 
    $$
	 select $1+$2
	 $$
	 language sql;

select sumar(10,20)	 