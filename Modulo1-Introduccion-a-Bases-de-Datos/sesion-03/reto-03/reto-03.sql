USE tienda;

-- pregunta 1
CREATE VIEW puestos002 AS(
	SELECT e.id_empleado, 
		CONCAT(e.nombre,' ',e.apellido_paterno,' ',e.apellido_materno) nombre,
        p.id_puesto,
        p.nombre puesto
	FROM empleado e
		JOIN puesto p ON e.id_puesto = p.id_puesto
);
SELECT *
FROM puestos002;

-- pregunta 2
CREATE VIEW empleado_articulo002 AS(
	SELECT v.clave, 
		v.fecha, 
		a.nombre producto, 
        a.precio, 
        CONCAT(e.nombre, ' ', e.apellido_paterno) empleado
	FROM venta AS v
		JOIN empleado e ON v.id_empleado = e.id_empleado
		JOIN articulo a ON v.id_articulo = a.id_articulo
	ORDER BY producto
);
SELECT *
FROM empleado_articulo002;

-- pregunta 3
CREATE VIEW puesto__con_max_ventas002 AS(
SELECT CONCAT(e.nombre, ' ', e.apellido_paterno) empleado,
	p.nombre puesto,
	v.id_empleado,
	COUNT(id_venta) venta_articulos
FROM venta v
	INNER JOIN empleado e ON v.id_empleado = e.id_empleado
	INNER JOIN puesto p ON e.id_puesto = p.id_puesto
GROUP BY v.id_empleado
ORDER BY venta_articulos DESC
LIMIT 1
);
SELECT *
FROM puesto__con_max_ventas002 