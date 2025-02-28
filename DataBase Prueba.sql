create table presupuestos (  
    id number(10) generated always as identity primary key,  
    nombre varchar2(100) unique
);  
  
create table linea_presupuestos (  
    id number(10) generated always as identity primary key,  
    descripcion varchar2(100),  
    nombre_presupuesto varchar2(100),  
    cod_articulo varchar2(255),  
    cantidad number(19),  
);  
  
create table productos (  
    id number(10) generated always as identity primary key,  
    nombre varchar2(100),  
    precio number(10, 2),  
    cod_articulo varchar2(255) unique
);  
  
create table debug (  
    id number(10) generated always as identity primary key,  
    mensaje varchar2(400)  
);  
  
insert into productos (nombre, precio, cod_articulo) values ('Producto A', 100.50, 'COD001');
insert into productos (nombre, precio, cod_articulo) values ('Producto B', 200.75, 'COD002');
insert into productos (nombre, precio, cod_articulo) values ('Producto C', 150.30, 'COD003');
insert into productos (nombre, precio, cod_articulo) values ('Producto D', 250.00, 'COD004');
insert into productos (nombre, precio, cod_articulo) values ('Producto E', 320.60, 'COD005');
insert into productos (nombre, precio, cod_articulo) values ('Producto F', 400.80, 'COD006');
insert into productos (nombre, precio, cod_articulo) values ('Producto G', 180.25, 'COD007');
insert into productos (nombre, precio, cod_articulo) values ('Producto H', 220.40, 'COD008');
insert into productos (nombre, precio, cod_articulo) values ('Producto I', 540.90, 'COD009');
insert into productos (nombre, precio, cod_articulo) values ('Producto J', 630.10, 'COD010');

CREATE OR REPLACE PROCEDURE p_ins_debug(p_mensaje IN VARCHAR2) AS
BEGIN
    -- Insertar el mensaje en la tabla debug
    INSERT INTO debug (mensaje) 
    VALUES (p_mensaje);

    -- Realizar el commit para asegurar que el cambio se guarde
    COMMIT;
END p_ins_debug;
