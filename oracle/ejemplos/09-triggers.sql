-- clasificacion de los triggers
-- los triggers pueden ser ejecutados antes o despues de la sentencia insert, update o delete
-- before (antes de la sentencia)
-- after (despues de la sentencia)
-- nivel: se ejecutar por cada línea

--borrar tablas (si existen)
drop table libros;
drop table control;

--crear tablas
create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
);
create table control(
  usuario varchar2(30),
  fecha date
);


-- BEFORE INSERT
-- agregamos una línea de control por cada libro creado
create or replace trigger tr_insert_libro
before insert on libros
begin
	insert into control values (user, sysdate);
end tr_insert_libro;


-- BEFORE INSERT EACH ROW
-- agregamos una línea de control por cada empleado creado
drop table empleados;
create table empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  seccion varchar2(20)
);

create or replace trigger tr_insert_empleado
before insert on empleados
for each row
  begin
	  insert into control values (user, sysdate);
end tr_insert_empleado;

-- ejemplo de carga
truncate table control;
insert into empleados values('22333444','ACOSTA','Ana','Secretaria');
insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria');
insert into empleados values('22999000','FUENTES','Federico','Sistemas');
insert into empleados values('22555666','CASEROS','Carlos','Contaduria');
insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas');
insert into empleados values('23666777','JUAREZ','Juan','Contaduria');



-- TRIGGER MULTIPLES
create table control_empleados(
  usuario varchar2(20),
  fecha date,
  accion varchar(20)
);

-- creacion del trigger
create or replace trigger tr_control_empleados
before insert or update or delete
on empleados
for each row
  begin
    if inserting then
      insert into control_empleados values (user, sysdate, 'insert');
    end if;
    if deleting then
      insert into control_empleados values (user, sysdate, 'delete');
    end if; 
    if updating then
      insert into control_empleados values (user, sysdate, 'update');
    end if;
end tr_control_empleados;

-- inserción de datos
insert into empleados values(22656698,'GONZALES','JOSE','GERENCIA',3000);
insert into empleados values(22655568,'RODRIGUEZ','MANUEL','TALLER',1000);
update empleados set sueldo=2000 where documento=23444555;
delete from empleados where documento=23666777;



-- triggers NEW y OLD
-- existen dos tablas temporales que se generan al agregar  eliminar un registro

drop table libros;
drop table ofertas;

create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar(20),
  precio number(6,2)
);
create table ofertas(
  codigo number(6),
  precio number(6,2),
  usuario varchar2(20),
  fecha date
);

-- agregamos un registro en ofertas por cada libro con precio menor de 31
create or replace trigger tr_ingresa_libro
before insert on libros for each row
begin
  if (:new.precio <= 30 ) then
    insert into ofertas values (:new.codigo, :new.precio, user, sysdate);
  end if;
end tr_ingresa_libro;

-- datos de pruebas
insert into libros values(100,'Uno','Richard Bach','Planeta',25);
insert into libros values(103,'El aleph','Borges','Emece',28);
insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);

-- trigger de actualización de datos en la tabla libros
-- quitamos o agregamos ofertas
create or replace trigger tr_actualiza_libro
before update on libros for each row
begin
  if (:old.precio <= 30) and (:new.precio > 30) then
    delete from ofertas where codigo=:old.codigo;
  end if;
  if (:old.precio > 30) and (:new.precio <= 30) then
    insert into ofertas values (:new.codigo, :new.precio, user, sysdate);
  end if;

end tr_actualiza_libro;



-- triggen WHEN
drop table empleados;
create table empleados(
  documento char(8),
  apellido varchar2(20),
  nombre varchar2(20),
  seccion varchar2(30),
  sueldo number(8,2)
);
drop table control;
create table control(
  usuario varchar2(30),
  fecha date,
  documento char(8),
  antiguosueldo number(8,2),
  nuevosueldo number(8,2)
); 

-- se dispara cuando se modifica un campo de la tabla
create or replace trigger tr_actualiza_sueldo
before update of sueldo on empleados
for each row when(:new.sueldo<>:old.sueldo)
begin
  insert into control values (user, sysdate, :old.documento, :old.sueldo, :new.sueldo);
end tr_actualiza_sueldo;



-- trigger para controlar datos al insertar empleado
-- apellido siempre en mayúsculas
-- sueldo distinto de null
create or replace trigger tr_controlar_datos_empleado
before insert on empleados
for each row 
begin
  :new.apellido := upper(:new.apellido);
  if :new.sueldo is null then
    :new.sueldo := 0;
  end if;
end tr_controlar_datos_empleado;



-- trigger ENABLE / DISABLE
-- podemos habilitar o desabilitar un trigger para realizar alguna prueba
select trigger_name, triggering_event, table_name, status
from user_triggers
where table_name = 'EMPLEADOS';

alter trigger tr_actualiza_sueldo disable;
-- relizamos tarea y volvemos a actualizar
alter trigger tr_actualiza_sueldo enable;



-- trigger con control de errores
-- no se puede agregar un sueldo > 5000
-- no se puede eliminar un registro de gerencia
-- no se puede actualizar el campo documento
create or replace trigger tr_control_empleados
before insert or update or delete on empleados
for each row
  begin
    if (:new.sueldo>5000) then
      raise_application_error(-20000, 'Sueldo no puede ser mayor a 5000');
    end if;

    if (:old.seccion='Gerencia') then
      raise_application_error(-20000, 'No se puede eliminar Gerencia');
    end if;

    if updating('documento') then
      raise_application_error(-20000, 'No se puede actualizar nro. documento');    
    end if;
end tr_control_empleados;
