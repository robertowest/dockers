Drop Table clientes;

Create Table clientes (
    id_cliente Int Not Null,
    nombre     Varchar2(30),
    edad       Numeric(2),
    direccion  Varchar(60),
    salario    Number(6, 2)
);


-- SOLO HACER ESTOS INSERTS PRIMERO
insert into clientes values (1,'Ramon Rodriguez',32,'Calle primera numero 001',2000.00); 
insert into clientes values (2,'Jose Tomas',25,'Calle segunda numero 002',1500.00); 
insert into clientes values (3,'Ana Jimenez',23,'Calle tercera numero 003',2000.00); 
insert into clientes values (4,'Emilio Contreras',25,'Calle cuarta numero 004',6500.00); 
insert into clientes values (6,'Pedro Sandoval',22,'Calle quinta numero 005',4500.00); 
--------------------------------------------------------------------------------------------

select * from clientes;

-- control de transacciones
savepoint punto1;
    insert into  clientes values (7,'Esther Sanchez',27,'Calle sexta numero 006',5500.00 ); 
    insert into  clientes values (8,'Antonio Peralta',21,'Calle septima numero 007',4500.00 ); 
    
    savepoint punto2;
        update clientes set salario = salario+100;

    -- rollback to punto1;  eliminará todas las acciones
    -- rollback to punto2;  eliminará solo la actualización

commit;
