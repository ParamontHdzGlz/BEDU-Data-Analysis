USE tienda;
-- pregunta 1
SELECT nombre FROM empleado WHERE id_puesto = 4; 
-- pregunta 2
SELECT nombre, salario FROM puesto WHERE salario > 10000;
-- pregunta 3
SELECT nombre FROM articulo WHERE precio > 1000 AND iva > 100;
-- pregunta 4
SELECT id_venta, clave FROM venta WHERE id_articulo IN (135, 963) AND id_empleado IN (835, 369)
