-- condicional IF
Declare
    numero Number(2) := 10;
Begin
    If ( numero = 10 ) Then
        dbms_output.put_line('el valor de numero es 10');
    Elsif ( numero < 10 ) Then
        dbms_output.put_line('el valor de numero es menor que 10');
    Elsif ( numero > 10 ) Then
        dbms_output.put_line('el valor de numero es mayor que 10');
    End If;
    dbms_output.put_line('el valor de la variable es: ' || numero);
End;



-- condicional CASE
Declare
	numero int;
  dia varchar2(20);
Begin
   dia:=1;
   case numero
     when 1 then dia:='Lunes';
     when 2 then dia:='Martes';
     when 3 then dia:='Miercoles';
     when 4 then dia:='Jueves';
     when 5 then dia:='Viernes';
     when 6 then dia:='Sabado';
     when 7 then dia:='Domingo';
     else dia:='NO ES NUMERO CORRECTO';
   end case;
   dbms_output.put_line(dia);
end;



-- condicional WHEN

