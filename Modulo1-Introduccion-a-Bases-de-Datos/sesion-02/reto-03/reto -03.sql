USE tienda;
-- pregunta 1
SELECT nombre, COUNT(*) AS cantidad FROM puesto GROUP BY nombre ORDER BY nombre ASC;
-- pregunta 2 
SELECT nombre, ROUND(SUM(salario)) AS Total FROM puesto GROUP BY nombre ORDER BY nombre ASC;
-- pregunta 3 
SELECT id_empleado, COUNT(*) AS ventas_totales FROM venta GROUP BY id_empleado ORDER BY id_empleado ASC;
-- pregunta 4
SELECT v.id_articulo, a.nombre, COUNT(*) AS ventas_totales 
FROM venta v
	LEFT JOIN articulo a ON v.id_articulo = a.id_articulo
GROUP BY id_articulo;