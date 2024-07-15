
use Inventario;

-- Cambiamos el delimitador para permitir el uso de ;
DELIMITER $$

-- Función para obtener el nombre completo de un empleado
CREATE FUNCTION fn_obtener_nombre_completo(empleado_id INT)
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN
    DECLARE nombre_completo VARCHAR(250);
    
    SELECT CONCAT(nombre, ' ', apellido)
    INTO nombre_completo
    FROM Empleados
    WHERE empleado_id = empleado_id;
    
    RETURN nombre_completo;
END$$

-- Restauramos el delimitador original ;
DELIMITER ;

/*Descripción detallada:
 Esta función devuelve el nombre completo de un empleado, concatenando el nombre y apellido.
 Objetivo:
 Proporciona una manera sencilla de obtener el nombre completo de un empleado a partir de su ID.
 Tablas/manipulación de datos:
 Accede a la tabla Empleados para recuperar el nombre y apellido del empleado.
*/

-- Función para calcular el total de productos disponibles por categoría
DELIMITER $$

CREATE FUNCTION fn_calcular_total_productos_categoria(categoria_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_productos INT;
    
    SELECT SUM(cantidad_disponible)
    INTO total_productos
    FROM Productos
    WHERE categoria_id = categoria_id;
    
    RETURN total_productos;
END$$

DELIMITER ;

/* Descripción detallada:
 Esta función calcula el total de productos disponibles en una categoría específica.
 Objetivo:
 Proporciona un resumen del inventario mostrando cuántos productos están disponibles en una categoría.
 Tablas/manipulación de datos:
 Accede a la tabla Productos para sumar la cantidad disponible según la categoría especificada.
*/