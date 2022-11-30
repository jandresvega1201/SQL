--Me consulta todos los datos de mi tabla cliente
SELECT *FROM clients;

--Me consulta todos los nombres y correos de mi tabla cliente
SELECT name, email FROM clients;

--Me consulta un limite de clientes de mi tabla
SELECT name FROM clients limit 10;

--Me consulta los clientes pasandole una condicioN con WHERE
SELECT name, email FROM clients where gender = 'M';

--SQL tiene imnumerable de funciales
SELECT name, YEAR(NOW()) - YEAR(birthdate) from clients limit 10;

--La funcion like me trae todos los clientes que coincidadna con las palabra dentro del porcentaje
SELECT *FROM clients where name like '%Saave%';

--Este query combina todo lo anterior
SELECT name, email, YEAR(NOW()) - YEAR(birthdate) AS edad FROM clients WHERE GENDER = 'F' AND name LIKE '%Lop%';

--Esta consulta me dice cuantos filas ahi o cuantos datos ahi guardados en mi tabla
SELECT count(*) FROM books;

SELECT * FROM authors WHERE author_id > 0 and author_id <= 5;

/*-------------------------------------------------------------------------------*/

--Esta consulta con la palabra reservada JOIN nos tra datos de dos o mas tablas que este nrelacionadas
SELECT b.book_id, a.name, b.title FROM books AS b JOIN authors AS a ON a.author_id = b.author_id
WHERE a.author_id between 1 and 5;

--INNER JOIN || JOIN es lo mismo
SELECT c.name, b.title, a.name, t.type FROM transactions AS t JOIN books AS b ON t.book_id = b.book_id
JOIN clients AS c on t.client_id = c.client_id
JOIN authors AS a ON b.book_id = a.author_id
WHERE c.gender = 'F' AND t.type = 'sell';

--LEFT JOIN me trae todo lo que pido si aun si no existe algun dato
SELECT a.author_id, a.name, a.nationality, b.title FROM authors AS a
LEFT JOIN books as b
ON b.author_id = a.author_id
WHERE a.author_id between 1 and 5
ORDER BY a.author_id;

SELECT a.author_id, a.name, a.nationality, COUNT(b.book_id)FROM authors AS a
LEFT JOIN books as b
ON b.author_id = a.author_id
WHERE a.author_id between 1 and 5
GROUP BY a.author_id
ORDER BY a.author_id;

--Para borrar un registro de una tabla para
DELETE FROM authors WHERE author_id = 161 limit 1;

--Modifica un registro de la tabla para
UPDATE clients SET active = 0 WHERE client_id = 80 limit 1;

----------------------------------------------------------------------------------------
--casos de uso:

-- Que nacionalidades ahi?
SELECT DISTINCT nationality FROM authors;

-- Cuantos escritores ahi de cada nacionalidades?
SELECT nationality, COUNT(author_id) FROM authors
GROUP BY nationality;

-- Cual es el promedio/ desviacion standart del precio de libros?
--AVG = promedio
--STDDEV = desviacion standart
SELECT nationality, COUNT(book_id) AS libros, AVG(price) AS prmedio,
STDDEV(price) AS std FROM books AS b
JOIN authors AS a ON a.author_id = b.author_id
GROUP BY nationality;

-- Cual es el precio maximo/Minimo de un libros del
SELECT nationality, MAX(price), MIN(price) FROM books AS b
JOIN authors AS a ON a.author_id = b.author_id
GROUP BY nationality;

-- Quien rento o opero el libro y cuando funciales
SELECT c.name, t.type, b.title, CONCAT(a.name, " (", a.nationality, ")") AS author
FROM transactions AS t
LEFT JOIN clients AS c ON c.client_id = t.client_id
LEFT JOIN books AS b ON b.book_id = t.book_id
LEFT JOIN authors AS a ON b.author_id = a.author_id;


-----------------------------------------------------------
--Agregar una columna a una tabla para

ALTER TABLE authors ADD COLUMN birthyear INTEGER DEFAULT 1930 AFTER name;

--Modificar el nombre de una columna a una tabla

ALTER TABLE authors MODIFY COLUMN birthyear INTEGER DEFAULT 1920 AFTER name;

--eLIMINAR LA COLUMNA DE LA TABLA
ALTER TABLE authors DROP COLUMN birthyear;




























