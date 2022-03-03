-- set serveroutput on;
-- para activar el paquete dbms_output

Declare
    valor Number := 10;
Begin
    -- bucle LOOP
    Loop
        dbms_output.put_line(valor);
        valor := valor + 10;
        If valor > 50 Then
            Exit;
        End If;
    End Loop;

    dbms_output.put_line('valor final: ' || valor);
    
    -- bucle WHILE
    valor := 1;
    While valor < 11 Loop
        dbms_output.put_line('9x' || valor || ' = ' || 9 * valor);
        valor := valor + 1;
    End Loop;
    
    -- bucle FOR
    For valor In 10..20 Loop
        dbms_output.put_line('bucle for ' || valor);
    End Loop;
    
    For valor In reverse 10..20 Loop
        dbms_output.put_line('bucle for en reversa ' || valor);
    End Loop;

End;