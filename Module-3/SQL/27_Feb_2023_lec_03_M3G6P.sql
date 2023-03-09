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
SELECT * FROM PruebaBase.persona;
