SELECT apellido1, apellido2, nombre FROM persona p WHERE p.tipo = "alumno" ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT nombre, apellido1, apellido2 FROM persona p WHERE p.tipo = "alumno" && p.telefono IS NULL;
SELECT * FROM persona p WHERE p.tipo = "alumno" && year(p.fecha_nacimiento) = 1999;
SELECT * FROM persona p WHERE p.tipo = "profesor" && p.telefono IS NULL && p.nif LIKE "%K";
SELECT * FROM asignatura a WHERE a.cuatrimestre = 1 && a.curso = 3 && id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM profesor pr JOIN persona p ON pr.id_profesor = p.id JOIN departamento d ON pr.id_departamento = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT a.nombre, c.anyo_inicio, c.anyo_fin FROM alumno_se_matricula_asignatura al JOIN asignatura a ON al.id_asignatura = a.id JOIN curso_escolar c ON al.id_curso_escolar = c.id JOIN persona p ON al.id_alumno = p.id WHERE p.nif = "26902806M";
SELECT DISTINCT d.nombre FROM profesor p JOIN departamento d ON p.id_departamento = d.id JOIN asignatura a ON p.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = "Grado en Ingeniería Informática (Plan 2015)";
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno JOIN curso_escolar ce ON a.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 && ce.anyo_fin = 2019;

SELECT d.nombre, p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
SELECT p.id, p.nombre, p.apellido1, p.apellido2 FROM persona p RIGHT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE d.id IS NULL && p.tipo = "profesor"; 
SELECT * FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento WHERE p.id_profesor IS NULL;
SELECT p.id, p.nombre, p.apellido1, p.apellido2 FROM persona p RIGHT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL && p.tipo = "profesor";
SELECT a.id, a.nombre FROM asignatura a LEFT JOIN profesor p ON a.id_profesor = p.id_profesor WHERE p.id_profesor IS NULL; 
SELECT DISTINCT d.* FROM departamento d RIGHT JOIN profesor p ON d.id = p.id_departamento LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor WHERE p.id_profesor IS NULL || a.id IS NULL;

SELECT COUNT(tipo) total_alumnes FROM persona WHERE tipo = "alumno";
SELECT COUNT(tipo) alumnes_del_1999 FROM persona WHERE tipo = "alumno" && YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre, COUNT(p.id_departamento) numero_profes FROM departamento d JOIN profesor p ON d.id = p.id_departamento GROUP BY d.nombre ORDER BY numero_profes DESC;  
SELECT d.nombre, COUNT(p.id_departamento) numero_profes FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY d.nombre ORDER BY numero_profes;
SELECT g.nombre, COUNT(a.id_grado) numero_assignatures FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY numero_assignatures DESC;
SELECT g.nombre, COUNT(a.id_grado) numero_assignatures_mes40 FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING numero_assignatures_mes40 > 40;
SELECT g.nombre, a.tipo, SUM(a.creditos) total_credits FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;
SELECT c.anyo_inicio, COUNT(a.id_alumno) alumnes_matriculats FROM curso_escolar c LEFT JOIN alumno_se_matricula_asignatura a ON c.id = a.id_curso_escolar GROUP BY c.anyo_inicio;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) nombre_assignatures FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor GROUP BY p.id ORDER BY nombre_assignatures DESC;
SELECT * FROM persona WHERE tipo = 'alumno' && fecha_nacimiento IN (SELECT MIN(fecha_nacimiento) FROM persona WHERE tipo = 'alumno');
SELECT p.* FROM persona p JOIN profesor pr JOIN departamento d ON p.id = pr.id_profesor && pr.id_departamento = d.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;
 
