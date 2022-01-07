CREATE DATABASE pruebas;

USE pruebas;
-- https://dev.mysql.com/doc/refman/8.0/en/data-types.html
-- https://dev.mysql.com/doc/refman/8.0/en/create-table.html#create-table-types-attributes
CREATE TABLE personas(
	-- Ahora definimos las columnas pertenecientes a esta tabla
    -- solamente se puede tener una sola pk (primary key) por tabla y ademas una sola columna
    -- auto incrementable
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL, -- solamente se podran almacenar numeros
    nombre VARCHAR(100) NOT NULL, -- se podran almacenar caract. HASTA 100 como maximo
    dni CHAR(8) UNIQUE NOT NULL, -- siempre se almacenaran 8 caracteres
    fecha_nacimiento DATE, -- seran solamente fecha
    created_at DATETIME NOT NULL, -- sera fecha y hora , minuto, segundo
    sexo ENUM('MASCULINO','FEMENINO','OTRO','HELICOPTERO'), -- solamente podra tener los valores definidos en el parentesis
    estado BOOL -- o sera true o false
);

-- sirve para modificar el nombre de una columna
-- ALTER TABLE personas RENAME COLUMN nombre TO nombrecito;


-- AHORA INGRESAREMOS LOS DATOS
-- DML (Data Manipulation Language) Lenguaje de Manipulacion de Datos
-- INSERT : ingresar nueva informacion a una tabla en especifico
INSERT INTO personas (id, nombre, dni, fecha_nacimiento, sexo, estado, created_at) VALUES
                     (1, 'Eduardo', '73500749', '1992-08-01', 'MASCULINO', true, now());


INSERT INTO personas (id, nombre, dni, fecha_nacimiento, sexo, estado, created_at) VALUES
                     (2, 'Rogelio', '15964657', '1992-08-01', 'masculino', true, now());

INSERT INTO personas (nombre, dni, fecha_nacimiento, sexo, estado, created_at) VALUES
                     ('Ana Maria', '15964757', '1992-08-01', 'femenino', false, now());
                     

-- SELECT : leer los datos de una determinada tabla o tablas
SELECT nombre, id FROM personas;
SELECT * FROM personas WHERE nombre='eduardo' and estado = true;
SELECT * FROM personas WHERE nombre='eduardo' or estado = false;

SELECT * FROM personas ORDER BY sexo DESC;










-- DDL (Data Definition Language) Lenguaje de Definicion de Datos
-- CREATE : Crear tablas , bases de datos y funciones y procedimientos almacenados entre otros

-- DROP: Eliminar completamente toda una tabla , una base de datos, una estructura 
-- esto NO elimina solamente el contenido de la tabla SINO que elimina toda su estructura
DROP TABLE personas;




-- CREAR UNA TABLA LLAMADA ACTIVIDADES EN LA CUAL TENGAMOS EL ID, NOMBRE, INTENSIDAD Y SU 
-- ESTADO, EL ID TIENE QUE SER PK Y UNIQUE, EL NOMBRE NO PUEDE EXCEDER LOS 20 CARACTERES,
-- LA INTENSIDAD DEBE SER BAJA, MEDIA, ALTA O MUY ALTA Y SU ESTADO V O F

CREATE TABLE actividades (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
    nombre VARCHAR(20),
    intensidad ENUM('baja','media','alta', 'muy alta'),
    estado BOOL,
    persona_id INT, 
    -- para crear las relaciones
    FOREIGN KEY(persona_id) REFERENCES personas(id)
);

-- NOTA: NO HACER LO SIGUIENTE SI YA TIENES LA RELACION ENTRE ACTIVIDADES Y PERSONAS
-- SIRVE PARA AGREGAR UNA NUEVA COLUMNA
-- ALTER TABLE actividades ADD persona_id INT;
-- SIRVE PARA AGREGAR UNA NUEVA RELACION FK EN UNA TABLA
-- ALTER TABLE actividades ADD FOREIGN KEY(persona_id) REFERENCES personas(id);

INSERT INTO actividades (nombre, intensidad, estado, persona_id) VALUES
						('PARRILLADAS', 'ALTA', true, 1);


