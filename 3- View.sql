-- Vistas en el esquema Inventario
use Inventario;

-- Vista que muestra todos los departamentos junto con su ubicación y responsable.
CREATE OR REPLACE VIEW vw_departamentos AS
SELECT departamento_id, nombre_departamento, ubicacion, responsable
FROM Departamentos;

-- Vista que lista los sectores con su nombre, departamento al que pertenecen y responsable.
CREATE OR REPLACE VIEW vw_sectores AS
SELECT s.sector_id, s.nombre_sector, d.nombre_departamento AS departamento, s.responsable
FROM Sectores s
JOIN Departamentos d ON s.departamento_id = d.departamento_id;

-- Vista que muestra los productos disponibles junto con su categoría y cantidad.
CREATE OR REPLACE VIEW vw_productos_disponibles AS
SELECT p.producto_id, p.nombre AS producto, c.nombre_categoria AS categoria, p.cantidad_disponible AS cantidad_disponible
FROM Productos p
JOIN Categorias c ON p.categoria_id = c.categoria_id;

-- Vistas en el esquema usuarios
use Usuarios;

-- Vista que muestra los empleados del hospital con su cargo y sector.
CREATE OR REPLACE VIEW Usuarios.vw_empleados_hospital AS
SELECT empleado_id, nombre, apellido, cargo, s.nombre_sector AS sector
FROM Inventario.Empleados e
JOIN Inventario.Sectores s ON e.sector_id = s.sector_id;

-- Vista que lista los pedidos de productos con detalles de proveedores y sectores de destino.
CREATE OR REPLACE VIEW Usuarios.vw_pedidos_productos AS
SELECT p.pedido_id, prod.nombre AS producto, p.cantidad, prov.nombre_proveedor AS proveedor, s.nombre_sector AS sector_destino
FROM Inventario.Pedidos p
JOIN Inventario.Productos prod ON p.producto_id = prod.producto_id
JOIN Inventario.Proveedores prov ON p.proveedor_id = prov.proveedor_id
JOIN Inventario.Sectores s ON p.sector_destino_id = s.sector_id;

-- Vista que muestra los movimientos de inventario con detalles de productos y responsables.
CREATE OR REPLACE VIEW Usuarios.vw_movimientos_inventario AS
SELECT m.movimiento_id, prod.nombre AS producto, m.tipo_movimiento, m.cantidad, e.nombre AS responsable, s.nombre_sector AS sector_destino
FROM Inventario.Movimientos_Inventario m
JOIN Inventario.Productos prod ON m.producto_id = prod.producto_id
JOIN Inventario.Empleados e ON m.responsable_id = e.empleado_id
JOIN Inventario.Sectores s ON m.sector_destino_id = s.sector_id;
