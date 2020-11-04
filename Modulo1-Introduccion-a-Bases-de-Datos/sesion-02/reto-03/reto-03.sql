USE tienda;
-- pregunta 1
SELECT nombre, COUNT(*) AS cantidad FROM puesto GROUP BY nombre ORDER BY nombre ASC;
-- pregunta 2 
SELECT nombre, ROUND(SUM(salario)) AS Total FROM puesto GROUP BY nombre ORDER BY nombre ASC;
-- pregunta 3 
SELECT v.id_empleado, e.nombre, COUNT(*) AS ventas_totales 
FROM venta v
	LEFT JOIN empleado e ON v.id_empleado = e.id_empleado
GROUP BY v.id_empleado 
ORDER BY e.nombre ASC;
-- pregunta 4
SELECT v.id_articulo, a.nombre, COUNT(*) AS ventas_totales 
FROM venta v
	LEFT JOIN articulo a ON v.id_articulo = a.id_articulo
GROUP BY id_articulo;