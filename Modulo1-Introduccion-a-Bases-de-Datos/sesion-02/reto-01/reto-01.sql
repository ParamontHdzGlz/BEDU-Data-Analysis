USE tienda;
-- pregunta 1
SELECT id_articulo, nombre FROM articulo WHERE nombre LIKE '%pasta%';
-- pregunta 2
SELECT id_articulo, nombre FROM articulo WHERE nombre LIKE '%cannelloni%';
-- pregunta 3
SELECT id_articulo, nombre FROM articulo WHERE nombre LIKE '% - %';
-- pregunta 4
SELECT id_puesto, nombre FROM puesto WHERE nombre LIKE '%designer%';
-- pregunta 5
SELECT id_puesto, nombre FROM puesto WHERE nombre LIKE '%developer%';