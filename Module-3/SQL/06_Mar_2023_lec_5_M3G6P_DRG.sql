SELECT * FROM clientes;

-- Obtener cuantos clientes hay con el max de ingresos en estrato 2
SELECT pais, COUNT(id_cliente), MAX(ingresos)
FROM clientes JOIN tarjetas
WHERE estrato = 2
GROUP BY pais
HAVING MAX(ingresos)>10000 AND COUNT(id_cliente)>=2
ORDER BY MAX(ingresos) ASC;

-- Por default, sin especificar, se manejará como un INNER JOIN
SELECT *
-- Tabla de la izquierda es la que va después del FROM
FROM clientes LEFT JOIN tarjetas
-- Indicación del atributo donde se unirán
ON clientes.id_cliente = tarjetas.cliente;

--
SELECT c.edad as age
-- Así se puede aplicar un "AS" en las tablas al momento de hacer JOINs
FROM clientes c LEFT JOIN tarjetas t
ON c.id_cliente = t.cliente;






