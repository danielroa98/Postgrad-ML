CREATE DATABASE PruebaBase;

CREATE DATABASE PruebaBase2;

Create DATABASE PruebaBase3;

-- Apunta a la base de datos que se va a usar.
USE PruebaBase3;

DROP DATABASE PruebaBase3;

-- Comentario de línea

/* commit
    Comment
    COME

 */

-- Es buena práctica si los nombres de los schemas están en minúsculas.
USE PruebaBase;

-- SQL puede procesar tanto mayúsculas como minúsculas.
CREATE TABLE persona3(
	-- Def de atributos.
    -- atributo1 tipo,
    id_person SERIAL, -- El tipo de dato SERIAL es un autoincremento, automáticamente se convierte en una PK.
    nombre VARCHAR(50), -- Especificando la cantidad de caracteres que se pueden ingresar
	direccion varchar(100),
    edad INT,
    -- Restricciones de cada atributo (conocidos como constraints)
    -- CONSTRAINT NOMBRE_CONSTRAINT TIPO LOGICA;
    -- PRIMARY KEY pk_tarjeta (id_person),
    CONSTRAINT pk_tarjeta PRIMARY KEY(id_person),
    CONSTRAINT rest_edad CHECK(edad>0)
    -- CONSTRAINT fk_
    
    -- La línea 33 y 34 están declarando lo mismo, solo que están redactado distinto.
    
);
-- create table TABLA1;

-- Creación de tarjetas
CREATE TABLE tarjeta(
    id_tarjeta INT NOT NULL,
    tipo char NOT NULL,
	monto float,
    -- Restricciones de cada atributo (conocidos como constraints)
    -- CONSTRAINT NOMBRE_CONSTRAINT TIPO LOGICA;
    -- PRIMARY KEY pk_tarjeta (id_person),
    CONSTRAINT pk_tarjeta PRIMARY KEY(id_tarjeta),
    CONSTRAINT rest_monto CHECK(monto>0),
	CONSTRAINT tipo_tarjeta CHECK(tipo IN ('d', 'c'))
);


CREATE TABLE persona_t(
	id_person SERIAL,
    nombre varchar(50),
    direccion varchar(100),
    edad INT,
    id_tarjeta INT,
    
    CONSTRAINT pk_persona PRIMARY KEY(id_person),
    CONSTRAINT check_edad CHECK(edad>0),
    CONSTRAINT fk_tarjeta FOREIGN KEY(id_tarjeta) REFERENCES tarjeta(id_tarjeta)
);

-- Se comienza a usar la palabra SELECT para visualizar resultados
-- FROM indicia de donde se van a obtener los datos.
-- Se puede especificar la base y los atributos como aparece en la sentencia de abajo.
-- SELECT * FROM PruebaBase.persona;

-- Actualización de la clase del 1ero de marzo del 2023

/*
INSERT INTO tarjeta(id_persona, edad, apellido, nombre)
VALUES(1,27,"Perez", "Juan"),(1,29,"Garcia","Maria");
 */

INSERT INTO tarjeta(id_tarjeta, tipo, monto)
VALUES (1, "d", 500000);

INSERT INTO persona_t(id_person, nombre, direccion, edad, id_tarjeta)
VALUES (1, "Juan", "Iztapalapa calle 2", 25, 1);

INSERT INTO persona_t(id_person, nombre, direccion, edad, id_tarjeta)
VALUES (2, "Juan", "Iztapalapa calle 2", 25, 1);

INSERT INTO persona_t(id_person, nombre, direccion, edad, id_tarjeta)
VALUES (3, "Juan", "Iztapalapa calle 2", 25, 1);

-- MODIFICACION DE TABLAS

-- Indicación que se va a modificar una tabla
ALTER TABLE persona_T
ADD COLUMN sexo CHAR(1) NOT NULL;
-- Se agrega la columna a datos existentes, pero se usan valores "nulos" para rellenarlo.
-- Realmente no son nulos, pero son valores vacíos.

-- Usado para eliminar una columna de una tabla.
-- Las columnas referenciadas NO deben tener información, mas que nada por precaución.
-- Solo no te deja eliminar la columna que tiene la llave primaria.
ALTER TABLE persona_t
DROP COLUMN sexo;

-- Para modificar restricciones

-- Eliminar una restricción y añadir una nueva.
ALTER TABLE tarjeta 
DROP CONSTRAINT tipo_tarjeta;

-- Inserción de un dato después de que se remueve el constraint
INSERT INTO tarjeta(id_tarjeta, tipo, monto)
VALUES(200,'f',10000);

-- La inserción anterior no permitirá que se ingrese el nuevo constraint, debido a que
-- la restricción no se cumple

-- Añadir un nuevo constraint a una tabla
-- Primero se tiene que correr la actualización de la tabla para poder correr esto.
-- En este ejemplo, se quiere añadir un nuevo valor en el constraint que represente el uso de vales.
ALTER TABLE tarjeta
ADD CONSTRAINT tipo_tarjeta CHECK(tipo IN ('d', 'c','v'));

-- Modificación de una tabla
-- UPDATE - actualización de registros.
-- DELETE - eliminación de registros.
-- DROP - usado para eliminar arquitecturas.

-- Pasos de lo que se está corriendo a continuación
-- 1) Actualización de un registro en específico en la tabla "tarjeta".
-- 2) Se especifica el valor que se va a modificar.
-- 3) Se puede especificar que registro se va a modificar _donde_ se cumpla la condición.
UPDATE tarjeta
SET tipo='v'
WHERE tipo = 'f';

-- SELECT * FROM tarjeta;

-- DELETE - eliminación de registros
DELETE FROM tarjeta
WHERE tipo = 'v';

SELECT * FROM tarjeta;























