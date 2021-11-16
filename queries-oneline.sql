/* TIENDA */
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio FROM producto;
SELECT nombre AS 'Nom de producte', precio AS 'Euros', precio AS 'Dolars' FROM producto;
SELECT nombre AS 'Nom de producte', concat(precio,"€") AS 'Euros', concat(precio,"$") AS 'Dolars' FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER( LEFT(nombre, 2) ) AS 'Upper 2 First Chars' FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, FORMAT(precio, 0) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- Lo hice de estas 4 formas por que no sabia exactamente lo que pedian y la data no ayuda para comprobarlo correctamente a menos que se genere.
SELECT nombre FROM producto ORDER BY nombre ASC;
SELECT precio FROM producto ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre, precio DESC;
SELECT nombre, precio FROM producto ORDER BY precio DESC, nombre;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;
SELECT producto.codigo AS 'Código Producto', producto.nombre AS 'Nombre Producto', fabricante.codigo AS 'Código Fabricante', fabricante.nombre AS 'Nombre Fabricante' FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo';
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Crucial' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre IN('Crucial', 'Hewlett-Packard', 'Seagate');
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%e';
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%w%';
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre;
SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT fabricante.codigo, fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
SELECT fabricante.codigo, fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE producto.nombre IS NULL;
SELECT producto.* FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo';
SELECT producto.* FROM producto WHERE producto.precio = ( SELECT MAX(producto.precio) FROM producto WHERE codigo_fabricante = ( SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Lenovo' ) ) AND NOT codigo_fabricante = ( SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Lenovo' );
SELECT producto.nombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Hewlett-Packard' ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.* FROM producto WHERE producto.precio >= ( SELECT MAX(producto.precio) FROM producto WHERE codigo_fabricante = ( SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Lenovo' ) ) AND NOT codigo_fabricante = ( SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Lenovo' );
SELECT producto.* FROM producto WHERE producto.precio > ( SELECT AVG(producto.precio) FROM producto WHERE codigo_fabricante = ( SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Asus' ) ) AND codigo_fabricante = ( SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Asus' );
/* UNIVERSIDAD */
SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1, apellido2, nombre AND tipo = 'Alumno';
SELECT apellido1, apellido2, nombre FROM persona WHERE telefono IS NULL AND tipo = 'Alumno';
SELECT * FROM persona WHERE fecha_nacimiento LIKE '1999%' AND tipo = 'Alumno';
SELECT * FROM persona WHERE telefono IS NULL AND tipo = 'Profesor' AND nif LIKE '%K';
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS 'Nombre Departamento' FROM persona INNER JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1, persona.apellido2, persona.nombre;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id LEFT JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar LEFT JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura WHERE nif = '26902806M';
SELECT DISTINCT departamento.nombre FROM universidad.grado INNER JOIN asignatura ON asignatura.id_grado = grado.id LEFT JOIN profesor USING (id_profesor) LEFT JOIN departamento ON departamento.id = profesor.id_departamento WHERE NOT asignatura.id_profesor IS NULL;
SELECT DISTINCT persona.* FROM universidad.curso_escolar INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id LEFT JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id WHERE anyo_inicio = 2018 AND anyo_fin = 2019;
-- LEFT JOIN & RIGHT JOIN ONLY
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona RIGHT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
SELECT persona.* FROM persona RIGHT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento NOT IN( SELECT departamento.id FROM departamento );
SELECT departamento.* FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id RIGHT JOIN departamento ON departamento.id = profesor.id_departamento WHERE departamento.id NOT IN ( SELECT profesor.id_departamento FROM profesor );
SELECT DISTINCT persona.* FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id RIGHT JOIN asignatura ON profesor.id_profesor != asignatura.id_profesor WHERE persona.id NOT IN( SELECT asignatura.id_profesor FROM asignatura WHERE NOT asignatura.id_profesor IS NULL );
-- Lo que comentamos en clase que no hace falta ningún JOIN para esta query al tener la referencia al id_profesor en la misma tabla
SELECT * FROM asignatura WHERE id_profesor IS NULL;
SELECT DISTINCT departamento.* FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id LEFT JOIN asignatura USING (id_profesor) LEFT JOIN curso_escolar ON curso_escolar.id = asignatura.curso WHERE asignatura.nombre IS NULL AND asignatura.curso IS NULL;
/* CONSULTES RESUM */
SELECT COUNT(id) FROM persona WHERE tipo = 'alumno';
SELECT COUNT(id) from persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE '1999%';
SELECT departamento.nombre, COUNT(id) AS numero_de_profesores from departamento INNER JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY id ORDER BY numero_de_profesores DESC;
SELECT departamento.nombre, COUNT(id_profesor) as numero_de_profesores from departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY id ORDER BY numero_de_profesores DESC;
SELECT grado.nombre, COUNT(asignatura.id_grado) as numero_de_asignaturas FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY numero_de_asignaturas DESC;
SELECT grado.nombre, COUNT(asignatura.id_grado) as numero_de_asignaturas FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre HAVING numero_de_asignaturas > 40 ORDER BY numero_de_asignaturas DESC;
SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) FROM grado INNER JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre, asignatura.tipo;
SELECT COUNT(DISTINCT id_alumno), curso_escolar.anyo_inicio FROM alumno_se_matricula_asignatura INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY anyo_inicio;
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id_profesor) as numero_de_asignaturas FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN asignatura USING (id_profesor) WHERE persona.tipo = 'profesor' GROUP BY persona.id ORDER BY numero_de_asignaturas DESC;
-- Primera forma de hacerlo
SELECT * FROM persona ORDER BY fecha_nacimiento DESC LIMIT 1;
-- Segunda forma
SELECT * FROM persona WHERE fecha_nacimiento = ( SELECT MAX(fecha_nacimiento) FROM persona );
SELECT DISTINCT persona.* FROM persona INNER JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON profesor.id_departamento = departamento.id RIGHT JOIN asignatura ON profesor.id_profesor != asignatura.id_profesor WHERE persona.id NOT IN( SELECT asignatura.id_profesor FROM asignatura WHERE NOT asignatura.id_profesor IS NULL );