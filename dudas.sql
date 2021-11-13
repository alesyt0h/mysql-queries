-- He probado muchas formas para hacerlo con un MIN()/MAX() pero no ha habido forma.
-- Así que lo he hecho con el order y el limit. Como se haría con un MIN() ??

SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto 
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio ASC LIMIT 1;





-- Esta es la query que te comente en clase. Más abajo esta de forma correcta pero con esta versión me surgio esta gran duda. Yo esperaría que devolviese el valor raw del precio, en este caso 559, ya que esta dentro de un where y es una subquery con un max, pero me devuelve todos los productos de Lenovo y si uso != me devuelve todos los que no son de Lenovo. Muy raro.

SELECT producto.* FROM producto 
LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante 
WHERE producto.precio = (
	SELECT MAX(producto.precio) 
    FROM producto 
    WHERE fabricante.nombre = 'Lenovo'
);
