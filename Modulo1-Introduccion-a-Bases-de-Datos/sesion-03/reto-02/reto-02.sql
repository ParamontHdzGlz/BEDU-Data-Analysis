USE tienda;

-- pregunta 1
SELECT v.clave, v.id_venta, CONCAT(e.nombre,' ',e.apellido_paterno) nombre
FROM venta v
	LEFT JOIN empleado e ON v.id_empleado = e.id_empleado
ORDER BY clave;
-- left join en caso de que exista una clave de venta que no tenga vendedor asociado
-- notese que hay más de un vendedor por clave
    
-- pregunta 2
SELECT v.clave, a.id_articulo, nombre
FROM articulo a
	INNER JOIN venta v ON a.id_articulo = v.id_articulo;

-- pregunta 3
SELECT clave, ROUND(SUM(precio),2) total
FROM venta v
	INNER JOIN articulo a ON v.id_articulo = a.id_articulo
GROUP BY clave;
