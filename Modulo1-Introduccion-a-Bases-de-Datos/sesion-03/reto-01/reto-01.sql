USE tienda;

-- pregunta 1
SELECT CONCAT(nombre,' ',apellido_paterno,' ',apellido_materno) nombre
FROM empleado
WHERE id_puesto IN (
	SELECT id_puesto FROM puesto WHERE salario > 10000
);

-- pregunta 2
SELECT A.id_empleado, 
	CONCAT(e.nombre,' ',e.apellido_paterno) nombre, 
	min(A.articulos_por_factura) min_ventas, 
    max(A.articulos_por_factura) max_ventas
FROM(
	SELECT clave, id_empleado, count(id_venta) articulos_por_factura
    FROM venta
    GROUP BY clave, id_empleado
    ) AS A
	LEFT JOIN empleado e ON A.id_empleado = e.id_empleado
GROUP BY id_empleado;
-- por cada factura o ticket, sacamos la cantidad de articulos que vendio cada vendedor, 
-- después regresamos la cantidad mínima y máxima de esas ventas por factura

-- pregunta 3
SELECT v.clave, v.id_articulo, a.nombre, a.precio
FROM venta v
	LEFT JOIN articulo a ON v.id_articulo = a.id_articulo
WHERE v.id_articulo IN (
	SELECT id_articulo FROM articulo WHERE precio > 5000
);