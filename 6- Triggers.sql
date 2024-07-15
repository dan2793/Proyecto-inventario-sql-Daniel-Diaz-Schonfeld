use Inventario;

/*Este trigger se activa después de una inserción en la tabla Movimientos_Inventario. 
Su función es mantener actualizado el campo "cantidad_disponible" de la tabla Productos
 según el tipo de movimiento de inventario realizado (entrada o salida).
 */
 
 DELIMITER $$

CREATE TRIGGER trg_actualizar_stock
AFTER INSERT ON Movimientos_Inventario
FOR EACH ROW
BEGIN
    -- Declaración de la variable para la cantidad movida
    DECLARE cantidad_movida INT;
    
    -- Determina la cantidad movida según el tipo de movimiento
    IF NEW.tipo_movimiento = 'Entrada' THEN
        SET cantidad_movida = NEW.cantidad;
    ELSEIF NEW.tipo_movimiento = 'Salida' THEN
        SET cantidad_movida = -NEW.cantidad;
    END IF;
    
    -- Actualiza la cantidad disponible en la tabla Productos sumando o restando la cantidad_movida, asegurando que el stock refleje con precisión los cambios realizados en el inventario.
    UPDATE Productos
    SET cantidad_disponible = cantidad_disponible + cantidad_movida
    WHERE producto_id = NEW.producto_id;
END$$

DELIMITER ;


/*Este trigger se dispara después de una actualización en la tabla Productos. 
Su objetivo es registrar cada modificación realizada en la tabla Productos en una tabla de auditoría (Auditoria_Productos), 
capturando detalles como el campo modificado, valores anterior y nuevo, fecha de modificación y usuario responsable del cambio.
*/

DELIMITER $$

CREATE TRIGGER trg_auditoria_productos
AFTER UPDATE ON Productos
FOR EACH ROW
BEGIN
    -- Registro de auditoría de la actualización
    INSERT INTO Auditoria_Productos (producto_id, campo_modificado, valor_anterior, valor_nuevo, fecha_modificacion, usuario_modificacion)
    VALUES (OLD.producto_id, 'nombre', OLD.nombre, NEW.nombre, NOW(), CURRENT_USER());
END$$

DELIMITER ;