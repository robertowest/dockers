-- para activar el paquete dbms_output
set serveroutput on;

Declare
    nombre   Varchar2(20);
    apellido Varchar2(30);
    detalle  Clob;
    eleccion Char(1);
    mensaje varchar2(30);
Begin
    nombre := 'Pedro';
    apellido := 'Perez';
    detalle := 'Este es el detalle de la variabe clob, es una variable de gran almacenamiento';
    eleccion := 'y';
    If eleccion = 'y' Then
        dbms_output.put_line('Nombre y Apellido: ' || nombre || ' ' || apellido);
        dbms_output.put_line('Apellido y Nombre: ' || apellido || ', ' || nombre);
        dbms_output.put_line(detalle);
    End If;

    -- algunas funciones para cadenas de caracteres
    dbms_output.put_line('Upper: ' || upper(nombre));
    dbms_output.put_line('Lower: ' || lower(nombre));
    mensaje := 'bienvenidos a mi mundo';
    dbms_output.put_line('InitCap: ' || initcap(mensaje));
    dbms_output.put_line('SubStr: ' || substr(mensaje, 13, 4));
    dbms_output.put_line('InStr: ' || instr(mensaje, 'm'));
    mensaje := '###bienvenidos a mi mundo###';
    dbms_output.put_line(RTRIM(mensaje, '#')); --corta caracteres del lado derecho
    dbms_output.put_line(LTRIM(mensaje, '#')); --corta caracteres del lado izquierdo
    dbms_output.put_line(TRIM('#' from mensaje)); --corta caracteres de ambos lados    
End;