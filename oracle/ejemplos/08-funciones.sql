-- creamos una función sencilla
create or replace function f_prueba(valor number)
return number
is
begin
  return valor*2;
end;


-- prueba de la funcion
select f_prueba(8) as total from dual;



