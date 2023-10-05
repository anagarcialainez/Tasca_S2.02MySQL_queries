SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999';
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND right(nif,1) = 'K';
SELECT nombre FROM asignatura WHERE cuatrimestre = '1' AND curso = '3' AND id_grado = '7';
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nombre_departamento FROM persona AS p JOIN profesor AS pr ON p.id = pr.id_profesor JOIN departamento AS d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT a.nombre AS nombre_asignatura, ce.anyo_inicio, ce.anyo_fin FROM alumno_se_matricula_asignatura AS ama JOIN persona AS p ON ama.id_alumno = p.id JOIN asignatura AS a ON ama.id_asignatura = a.id JOIN curso_escolar AS ce ON ama.id_curso_escolar = ce.id WHERE p.nif = '26902806M';
SELECT DISTINCT d.nombre AS nombre_departamento FROM departamento AS d JOIN profesor AS p ON d.id = p.id_departamento JOIN asignatura AS a ON p.id_profesor = a.id_profesor JOIN grado AS g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona AS p JOIN alumno_se_matricula_asignatura AS ama ON p.id = ama.id_alumno JOIN curso_escolar AS ce ON ama.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;
SELECT d.nombre AS nombre_del_departamento, p.apellido1, p.apellido2, p.nombre AS nombre_del_profesor FROM departamento AS d RIGHT JOIN profesor AS pr ON d.id = pr.id_departamento LEFT JOIN persona AS p ON pr.id_profesor = p.id ORDER BY nombre_del_departamento, p.apellido1, p.apellido2, p.nombre;
SELECT p.apellido1, p.apellido2, p.nombre AS nombre_del_profesor FROM profesor AS pr LEFT JOIN departamento AS d ON pr.id_departamento = d.id INNER JOIN persona AS p ON pr.id_profesor = p.id WHERE d.id IS NULL;
SELECT d.nombre AS nombre_del_departamento FROM departamento AS d LEFT JOIN profesor AS pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL;
SELECT p.apellido1, p.apellido2, p.nombre FROM persona AS p LEFT JOIN profesor AS pr ON p.id = pr.id_profesor LEFT JOIN asignatura AS a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL AND p.tipo = 'profesor';
SELECT id, nombre FROM asignatura WHERE id_profesor IS NULL;
SELECT d.id, d.nombre FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor WHERE a.id IS NULL GROUP BY d.id, d.nombre;
SELECT COUNT(*) AS Total_de_Alumnos FROM persona WHERE tipo = 'alumno';
SELECT COUNT(*) AS Alumnos_Nacidos_en_1999 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre AS Departamento, COUNT(p.id_profesor) AS Numero_de_Profesores FROM departamento d INNER JOIN profesor p ON d.id = p.id_departamento GROUP BY d.nombre ORDER BY Numero_de_Profesores DESC;
SELECT d.nombre AS Departamento, COUNT(p.id_profesor) AS Numero_de_Profesores FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY d.nombre ORDER BY Departamento;
SELECT g.nombre AS Grado, COUNT(a.id) AS Numero_de_Asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY Numero_de_Asignaturas DESC;
SELECT g.nombre AS Grado, COUNT(a.id) AS Numero_de_Asignaturas FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.id) > 40 ORDER BY Numero_de_Asignaturas DESC;
SELECT g.nombre AS Nombre_del_Grado, a.tipo AS Tipo_de_Asignatura, SUM(a.creditos) AS Suma_de_Creditos FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo ORDER BY Nombre_del_Grado, Tipo_de_Asignatura;
SELECT ce.anyo_inicio AS Anio_de_Inicio_del_Curso, COUNT(a.id_alumno) AS Numero_de_Alumnos_Matriculados FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura a ON ce.id = a.id_curso_escolar GROUP BY ce.anyo_inicio ORDER BY ce.anyo_inicio;
SELECT p.id AS id_profesor, p.nombre AS Nombre, p.apellido1 AS Primer_Apellido, p.apellido2 AS Segundo_Apellido, COUNT(a.id) AS Numero_de_Asignaturas FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = 'profesor' GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 ORDER BY Numero_de_Asignaturas DESC;
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT DISTINCT p.id AS id_profesor, p.nombre AS Nombre, p.apellido1 AS Primer_Apellido, p.apellido2 AS Segundo_Apellido FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' AND a.id_profesor IS NULL AND p.id IN (SELECT id_profesor FROM profesor); 












