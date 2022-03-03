-- preparación de prueba
drop table empleados;

create table empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  domicilio varchar2(30),
  seccion varchar2(20),
  sueldo number(8,2)
);
insert into empleados values('22222222','Acosta','Ana','Avellaneda 11','Secretaria',1800);
insert into empleados values('23333333','Bustos','Betina','Bulnes 22','Gerencia',5000);
insert into empleados values('24444444','Caseres','Carlos','Colon 333','Contabilidad',3000);
insert into empleados values('32323255','Gonzales','Miguel','Calle 4ta No.90','Contabilidad',8000);
insert into empleados values('56565555','Suarez','Tomas','Atarazana 78','Cobros',1500);


-- probando los atributos (%isopen, %found, %notfound, %rowcount)
declare
  filas number(3);
begin
  update empleados set sueldo = sueldo+500 where sueldo>=9000;
  if sql%notfound then
    dbms_output.put_line('no existen registros con esta condición');
  elsif sql%found then
    filas:=sql%rowcount;
    dbms_output.put_line(filas || ' empleado actualizados');
  end if;
end;


-- cursores implícitos
-- se utilizan cuando la sentencia select devuelve un registro
declare
  v_doc empleados.documento%type;
  v_nom empleados.nombre%type;
  v_ape empleados.apellido%type;
  v_sue empleados.sueldo%type;

  cursor c_cursor2 is 
    select documento, nombre, apellido, sueldo
    from empleados
    where documento = '22222222';

begin
  open c_cursor2;
  fetch c_cursor2 into v_doc, v_nom, v_ape, vsue;
  close c_cursor2;
  dbms_output.put_line('Documento: ' || v_doc);
  dbms_output.put_line('Nombre   : ' || v_nom);
  dbms_output.put_line('Apellido : ' || v_ape);
  dbms_output.put_line('Sueldo   : ' || v_sue);

end;



-- cursores explícitos
-- se utilizan cuando la sentencia select devuelve varios registros
declare
  v_empleados empleados%rowtype;  -- obtiene la estructura del registro
begin
  for v_empleados in (select * from empleados) loop
    dbms_output.put_line(v_empleados.sueldo);
  end loop;
end;



-- cursores con parámetros
declare
	v_nom empleados.nombre%type
  cursor c_empleado (pid empleados.idempleado%type)
    is select nombre from empleados where idempleado = pid;
begin
  open c_empleado( 425 );   -- id=425
  loop
    fetch c_empleado into v_nom;
    exit when c_empleado%notfound;
    dbms_output.put_line('Empleado: ' || v_nom);
  end loop;
  close c_empleado;
end;



-- REF CURSOR
create or replace function f_datos_empleados(v_documento in number)
return sys_refcursor
is
  v_ref sys_refcursor;
begin
  open v_ref for select * from empleados
  where documento = v_documento;
  return v_ref;
end;

-- forma de usarlo
select f_datos_empleados('22222222') from dual;
-- cambiar visualización
var rc1 refcursor
exec :rc1:=f_datos_empleados('22222222');
print rc1



-- 
