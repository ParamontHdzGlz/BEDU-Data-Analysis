USE tienda;
-- pregunta 1
SELECT ROUND(AVG(salario)) FROM puesto;
-- pregunta 2 
SELECT COUNT(*) FROM articulo WHERE nombre LIKE '%pasta%';
-- pregunta 3
SELECT MIN(salario) AS salario_min, MAX(salario) AS salario_max FROM puesto;
-- pregunta 4 
SELECT SUM(salario) FROM (SELECT salario 
	FROM puesto 
    ORDER BY id_puesto 
    DESC LIMIT 5) AS ultimos_cinco;

