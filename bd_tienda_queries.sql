SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
DESCRIBE producto;
SELECT nombre AS Nombre_Producto, precio AS Precio_en_Euros, ROUND(precio * 1.06, 2) AS Precio_en_USD FROM producto;
SELECT nombre AS "Nombre de Producto", precio AS "Euros", ROUND(precio * 1.06, 2) AS "Dólares" FROM producto;
SELECT UPPER(nombre) AS "Nombre de Producto", precio AS "Precio" FROM producto;
SELECT LOWER(nombre) AS "Nombre de Producto", precio AS "Precio" FROM producto;
SELECT nombre AS "Nombre del Fabricante", UPPER(SUBSTRING(nombre, 1, 2)) AS "Dos Primeros Caracteres en Mayúsculas" FROM fabricante;
SELECT nombre AS "Nombre del Producto", ROUND(precio) AS "Precio Redondeado" FROM producto;
SELECT nombre AS "Nombre del Producto", TRUNCATE(precio, 0) AS "Precio Truncado" FROM producto;
SELECT f.codigo FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
SELECT p.codigo AS "Código del Producto", p.nombre AS "Nombre del Producto", f.codigo AS "Código del Fabricante", f.nombre AS "Nombre del Fabricante" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MIN(precio) FROM producto);
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MAX(precio) FROM producto);
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
SELECT DISTINCT f.codigo AS "Código del Fabricante", f.nombre AS "Nombre del Fabricante" FROM fabricante AS f INNER JOIN producto AS p ON f.codigo = p.codigo_fabricante;
SELECT f.codigo AS "Código del Fabricante", f.nombre AS "Nombre del Fabricante", COALESCE(p.nombre, 'Ningún producto') AS "Productos" FROM fabricante AS f LEFT JOIN producto AS p ON f.codigo = p.codigo_fabricante ORDER BY f.codigo;
SELECT f.codigo AS "Código del Fabricante", f.nombre AS "Nombre del Fabricante" FROM fabricante AS f LEFT JOIN producto AS p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;
SELECT nombre AS "Nombre del Producto", precio AS "Precio", codigo_fabricante AS "Código del Fabricante" FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo')); 
SELECT p.nombre AS "Nombre del Producto" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1; 
SELECT p.nombre AS "Nombre del Producto" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1; 
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.precio >= ( SELECT MAX(precio) FROM producto AS p2 JOIN fabricante AS f2 ON p2.codigo_fabricante = f2.codigo WHERE f2.nombre = 'Lenovo');
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio" FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus'  AND p.precio > ( SELECT AVG(p2.precio) FROM producto AS p2 WHERE p2.codigo_fabricante = f.codigo);





















