use Inventario;

/* 	SP para registrar un nuevo pedido en el sistema
	Objetivo: Insertar un nuevo pedido en la tabla Pedidos.
	Tablas: Pedidos, Productos, Sectores, Proveedores
*/

DELIMITER $$
CREATE PROCEDURE sp_registrar_pedido(
    IN producto_id INT,
    IN cantidad INT,
    IN fecha_entrega DATE,
    IN sector_destino_id INT,
    IN proveedor_id INT
)
BEGIN
    INSERT INTO Pedidos (producto_id, cantidad, fecha_pedido, fecha_entrega, estado, sector_destino_id, proveedor_id)
    VALUES (producto_id, cantidad, CURDATE(), fecha_entrega, 'Pendiente', sector_destino_id, proveedor_id);
END$$
DELIMITER ;

/* 	SP para actualizar la cantidad disponible de un producto
	Objetivo: Actualizar la cantidad disponible de un producto en la tabla Productos.
	Tablas: Productos
*/
DELIMITER $$
CREATE PROCEDURE sp_actualizar_cantidad_producto(
    IN producto_id INT,
    IN nueva_cantidad INT
)
BEGIN
    UPDATE Productos
    SET cantidad_disponible = nueva_cantidad
    WHERE producto_id = producto_id;
END$$
DELIMITER ;

-- SP para obtener todos los productos de una categoría específica
-- Objetivo: Listar todos los productos de una categoría determinada.
-- Tablas: Productos, Categorias
DELIMITER $$
CREATE PROCEDURE sp_listar_productos_por_categoria(
    IN categoria_id INT
)
BEGIN
    SELECT p.producto_id, p.nombre AS producto, c.nombre_categoria AS categoria
    FROM Productos p
    JOIN Categorias c ON p.categoria_id = c.categoria_id
    WHERE c.categoria_id = categoria_id;
END$$
DELIMITER ;

-- SP para obtener el historial de movimientos de un producto
-- Objetivo: Mostrar todos los movimientos (entradas, salidas, transferencias) de un producto.
-- Tablas: Movimientos_Inventario, Productos
DELIMITER $$
CREATE PROCEDURE sp_historial_movimientos_producto(
    IN producto_id INT
)
BEGIN
    SELECT m.movimiento_id, m.tipo_movimiento, m.cantidad, m.fecha_movimiento, e.nombre AS responsable, s.nombre_sector AS sector_destino
    FROM Movimientos_Inventario m
    JOIN Empleados e ON m.responsable_id = e.empleado_id
    JOIN Sectores s ON m.sector_destino_id = s.sector_id
    WHERE m.producto_id = producto_id;
END$$
DELIMITER ;