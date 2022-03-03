-- USER SQL
CREATE USER "roberto" IDENTIFIED BY "roberto";

-- ROLES
GRANT "AUTHENTICATEDUSER" TO "roberto" WITH ADMIN OPTION;
ALTER USER "roberto" DEFAULT ROLE "AUTHENTICATEDUSER";


-- creamos la tabla libros
CREATE TABLE libros(
    idlibro Number,
    titulo  Varchar2(50),
    autor   Varchar2(50),
    precio  Number(12, 2)
        Constraint libro_pk Primary Key ( Libro_Id ) 
);

-- insertamos datos de pruebas
insert into libros (libro_id, titulo, autor, precio) values (1, 'El Quijote', 'Miguel de Cervantes', 454.5);
insert into libros (libro_id, titulo, autor, precio) values (2, 'Cien años de soledad', 'Gabriel G. Marquez', 545.4);
insert into libros (libro_id, titulo, autor, precio) values (3, 'El Alquimista', 'Paulo Coehlo', 636.3);

-- visualizamos los libros
select * from libros;
