-- para activar el paquete dbms_output
set serveroutput on;

/*
exiten tres tipo de procedimiento almacenados
1. a nivel de esquema
2. dentro de un paquete
3. dentro de un bloque
*/

Create Or Replace Procedure saludo As
Begin
    dbms_output.put_line('Saludos a todos');
End saludo;

-- ejecutar el paquete
Begin
    saludo;
End;

-- ejecutar el paquete
execute saludo;



-- creamos procedimiento
-- aumentar el salario de todos los empleados que tengan una determinada antiguedad.
create or replace Procedure aumentar_sueldo(anio in number, porcentaje in number) 
As
Begin 
    Update empleados
    Set sueldo = sueldo + ( sueldo * ( porcentaje / 100 ) )
    Where ( extract(Year From current_date) - extract(Year From fecha_ingreso) ) < anio;
End aumentar_sueldo;
