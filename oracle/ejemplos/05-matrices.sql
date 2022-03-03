-- para activar el paquete dbms_output
set serveroutput on;

Declare
    Type paises Is Varray(5) Of Varchar2(20);
    nombre paises;
Begin
    nombre := paises('España', 'Portugal', 'Brasil', 'Argentina', 'Inglaterra');
    For f In 1..5 Loop
        dbms_output.put_line('País: ' || nombre(f));
    End Loop;

End;