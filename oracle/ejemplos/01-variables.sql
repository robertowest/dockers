-- habilitamos la salida de mesajes de editor
-- set serveroutput on;

Declare
    numero  Number(5) := 3000;
    mensaje Constant Varchar2(30) := 'mensaje estático';
Begin
    dbms_output.put_line(mensaje);
    dbms_output.put_line(numero);
End;



-- variables compuestas
-- la variable toma todos los tipo de datos de la tabla
-- también podría ser un cursor en vez de una tabla
declare
    reg_productos productos%rowtype;	
begin
    select * into reg_productos from productos where codigo = 3;
    dbms_output.put_line('Características del producto');
    dbms_output.put_line('Código: ' || reg_productos.codigo);
    dbms_output.put_line('Artículo: ' || reg_productos.nombre);
end;



