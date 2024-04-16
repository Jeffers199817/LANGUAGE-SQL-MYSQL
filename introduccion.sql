--CREAR UNA BASE DE DATOS

--Siempre los comandos de SQL deben estar en mayusculas 

CREATE DATABASE cliente;

--Crear una tabla 

CREATE TABLE clientes( 
    id INT(10) NOT NULL AUTO INCREMENT,
    ci INT(7)  NOT NULL ,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

--PARA VER LA ESTRUCTURA DE LA TABLA SE UTILIZA EL SIGUIENTE COMANDO COMMENT

DESCRIBE clientes;

--PARA INGRESAR EL SIGUIENTE PARAMATRO EN LA TABLA SE UTILIZA EL SIGUIENTE CODIGO COMMENT

ALTER TABLE clientes ADD descripcion VARCHAR(60) NOT NULL;

--PARA CAMBIAR DE NOMBRE A UNA ESTRUCTURA A UNA FILA SE PUEDE HACER PERO NO SE PUEDE MODIFICAR EL TIPO DE DATO PERO SI PUEDO CAMBIAR SU EXTENSIÓN DE 20 A 50 


ALTER TABLE servicios CHANGE descripcion nuevoNombre VARCHAR(50) NOT NULL;
--OPERACIONES CRUD 

--CREAR O INSERTAR DATOS EN UNA TABLA COMMENT

INSERT INTO clientes(ci, nombre) VALUES( 138494345,"Jefferson Alquinga");

INSERT INTO clientes(ci,nombre)VALUES(14532346456,"Bernarod Alquinga"),( 345232412351435,"Jose Alquinga");



--READ O LEER LOS DATOS DE UNA TABLA COMME

SELECT * FROM cliente;

--Leer datos por un solo id

SELECT * FROM cliente WHERE id = 1;
SELECT* FROM cliente ORDER BY id DESC;

SELECT*FROM cliente ORDER BY id ASC LIMIT 4;


SELECT*FROM cliente WHERE id = 2;

SELECT*FROM cliente WHERE nombre = "Jefferson Alquinga";



--UPDATE O ACTUALIZAR DATOS DE UNA TABLA

UPDATE clientes SET nombre ="Jefferson Chuquimarca" , ci = 143453462345, WHERE id = 2;

--ELIMINAR DATOS DE TABLA COMMENT elimianra registros de una tabla 

DELETE FROM servicios WHERE id = 1;

--PARA ELIMINAR UNA COLUMNA;
ALTER TABLE servicios DROP COLUMN descripcion;


--ELIMINAR TABLA COMMENT
DROP TABLE servicios;

--PARA REALIZAR CONSULTA UTILIZAMOS COMMENT

SELECT*FROM servicios WHERE precio BETWEEN 299 AND 499;


--FUNCIONES AGREGADORAS

SELECT COUNT(id), fecha FROM reservaciones GROUP BY fecha ORDER BY COUNT(id)DESC;

--FUNCIONES PARA CREAR UN OPERARCION Y UNA TABLA VIRTULA CON AS

SELECT SUM(precio) AS precioTotla FROM servicios;
SELECT MAX(precio)AS maxprecio FROM servicios;
SELECT MIN(precio) AS minprecio FROM servicios;


--PARA PODER BUSCAR UTILIZAMOS LIKE PARA ALGO ESPECIFICAO

SELECT *FROM reservaciones WHERE nombre LIKE 'cabello';



--COMANDO PARA UNIR DOS COLUMNA COMMENT

SELECT CONCAT(nombre,' ', apellido) AS NombresCompletos FROM servicios;


--COMANDO PARA UNIR DOS COLUMAS Y REALIZAR UN BUSQUEDA CON LIKE 

SELECT hora,fecha, CONCAT(nombre,' 'apellido)AS NombreCompletos FROM reservaciones WHERE CONCAT(nombre,' ',apellido) LIKE '%Ana Preciado';


--CREAR RELACIONES CON TABLAS EXISTEN 3 NORMALIZACIONES QUE DEBEMOS SEGUIE LA 1 NO EXISTE DATOS DUPLICADOS
--EN UNA MISMA COLUMAN, 2 NO SE DEBE DUPLICAR DATOS EN UNA MISMA TABLA, 3 NO SE PUEDE REALIZAR CALCULO DE PAGOS.COMMENT

-- CREAMOS CONDICIONES PARA TABLA DE CITAS COMMENT

CREATE TABLE citas (
    id INT(11) NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    hora  TIME NOT NULL,
    clienteId INT(11) NOT NULL,
    PRIMARY KEY(id),
    KEY clienteId(clienteId),
    CONSTRAINT cliente_FK 
    FOREIGN KEY(clienteId)
    REFERENCES clientes(id)
);
