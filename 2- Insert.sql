USE Inventario;

-- Insertar datos en la tabla Departamentos
INSERT INTO Departamentos (nombre_departamento, ubicacion, responsable, telefono, email, extension, horario)
VALUES
('PAIA', 'Planta Baja', 'Juan Pérez', '1144445555', 'juan.perez@hospital.com', '101', '8am-4pm'),
('Intermedios', 'Planta Alta', 'María González', '1144446666', 'maria.gonzalez@hospital.com', '102', '8am-4pm'),
('Minimos', 'Planta Alta', 'Carlos López', '1144447777', 'carlos.lopez@hospital.com', '103', '8am-4pm'),
('Consultorios Externos', 'Planta Alta', 'Laura Martínez', '1144448888', 'laura.martinez@hospital.com', '104', '8am-4pm'),
('Salud Mental', 'Planta Alta', 'José Fernández', '1144449999', 'jose.fernandez@hospital.com', '105', '8am-4pm'),
('Direccion', 'Planta Baja', 'Ana Rodríguez', '1234567896', 'ana.rodriguez@hospital.com', '106', '8am-4pm'),
('Maternidad', 'Planta Baja', 'Sofía Gómez', '1144441111', 'sofia.gomez@hospital.com', '107', '8am-4pm');

-- Insertar datos en la tabla Sectores
INSERT INTO Sectores (nombre_sector, ubicacion, responsable, telefono, email, extension, horario, departamento_id)
VALUES
('Informatica', 'Planta Baja', 'Fernando Díaz', '1144442222', 'fernando.diaz@hospital.com', '201', '8am-4pm', 6),
('Administracion', 'Planta Baja', 'Martín Suárez', '1144443333', 'martin.suarez@hospital.com', '202', '8am-4pm', 6),
('Cardiologia', 'Planta Alta', 'Lucía Ramírez', '1144444444', 'lucia.ramirez@hospital.com', '203', '8am-4pm', 4),
('Neurologia', 'Planta Alta', 'Santiago Torres', '9876543211', 'santiago.torres@hospital.com', '204', '8am-4pm', 4),
('Pediatria', 'Planta Baja', 'Valentina Álvarez', '1144446666', 'valentina.alvarez@hospital.com', '205', '8am-4pm', 1),
('Emergencia', 'Planta Baja', 'Agustín Castillo', '1144447777', 'agustin.castillo@hospital.com', '206', '8am-4pm', 1),
('Traumatologia', 'Planta Baja', 'Catalina Rojas', '9876543214', 'catalina.rojas@hospital.com', '207', '8am-4pm', 1),
('Ginecologia', 'Planta Baja', 'Emilia Herrera', '1144449999', 'emilia.herrera@hospital.com', '208', '8am-4pm', 2),
('Oncologia', 'Planta Alta', 'Julieta Medina', '1144440000', 'julieta.medina@hospital.com', '209', '8am-4pm', 3),
('Radiologia', 'Planta Alta', 'Nicolás Vega', '1234567899', 'nicolas.vega@hospital.com', '210', '8am-4pm', 3);

-- Insertar datos en la tabla Categorias
INSERT INTO Categorias (nombre_categoria, descripcion_categoria, sector_id)
VALUES
('Monitores', 'Pantallas de computadoras', 1),
('Computadoras', 'Equipos de escritorio y portátiles', 1),
('Impresoras', 'Impresoras de tóner', 2),
('Teclados', 'Teclados de diferentes tipos', 2),
('Mouse', 'Mouse de diferentes tipos', 3),
('Discos Rigidos', 'Discos rigido internos y externos', 3),
('Memorias RAM', 'Memorias RAM de varios tamaños', 4),
('Placas de video', 'Placas de video de distintas capacidades', 4),
('Motherboard', 'Motherboard de distintos modelos', 5),
('Fuentes de Alimentación', 'Fuentes de alimentación para PCs', 5);

-- Insertar datos en la tabla Productos
INSERT INTO Productos (nombre, descripcion, cantidad_disponible, marca, modelo, categoria_id)
VALUES
('Monitor Dell', 'Monitor de 24 pulgadas', 10, 'Dell', 'P2419H', 1),
('Computadora HP', 'Equipo de escritorio', 5, 'HP', 'EliteDesk 800', 2),
('Impresora HP', 'Impresora de tóner', 3, 'HP', 'LaserJet Pro', 3),
('Teclado Logitech', 'Teclado mecánico', 15, 'Logitech', 'G Pro', 4),
('Mouse Logitech', 'Mouse inalámbrico', 20, 'Logitech', 'MX Master 3', 5),
('Disco Rigido Seagate', 'Disco Rigido externo de 1TB', 10, 'Seagate', 'Expansion', 6),
('Memoria RAM Corsair', 'Memoria RAM de 8GB', 25, 'Corsair', 'Vengeance LPX', 7),
('Placa de video NVIDIA', 'Placa de video GTX 1660', 7, 'NVIDIA', 'GTX 1660', 8),
('Motherboard ASUS', 'Motherboard ATX', 10, 'ASUS', 'ROG Strix B450-F', 9),
('Fuente de Alimentación Corsair', 'Fuente de alimentación de 750W', 5, 'Corsair', 'RM750x', 10);


-- Insertar datos en la tabla Proveedores con nombres de personas y direcciones ficticias genéricas
INSERT INTO Proveedores (nombre_proveedor, contacto, direccion, telefono, email, pais, ciudad)
VALUES
('Proveedor Tecnológico S.A.', 'Juan Pérez', 'Av. Libertador 1234', '1144445555', 'juan.perez@proveedor.com', 'Argentina', 'Buenos Aires'),
('Suministros Informáticos R.L.', 'María González', 'Calle Proveedores 567', '1144446666', 'maria.gonzalez@proveedor.com', 'Argentina', 'Córdoba'),
('Componentes Electrónicos S.A.', 'Luis Rodríguez', 'Av. Electrónica 789', '1144447777', 'luis.rodriguez@proveedor.com', 'Argentina', 'Rosario'),
('Hardware Solutions S.A.', 'Ana Martínez', 'Calle Tecnológica 456', '1144448888', 'ana.martinez@proveedor.com', 'Argentina', 'Mendoza'),
('Periféricos y Más S.A.', 'Diego García', 'Av. Periféricos 321', '1144449999', 'diego.garcia@proveedor.com', 'Argentina', 'La Plata'),
('Soluciones Tecnológicas R.L.', 'Carolina López', 'Calle Soluciones 654', '1144440000', 'carolina.lopez@proveedor.com', 'Argentina', 'Mar del Plata'),
('Electrónica Avanzada S.A.', 'Pablo Sánchez', 'Av. Avanzada 987', '1144441111', 'pablo.sanchez@proveedor.com', 'Argentina', 'Salta'),
('Equipos Informáticos R.L.', 'Valeria Pérez', 'Calle Equipos 234', '1144442222', 'valeria.perez@proveedor.com', 'Argentina', 'Santa Fe'),
('Tecnología Moderna S.A.', 'Jorge Fernández', 'Av. Tecnología 567', '1144443333', 'jorge.fernandez@proveedor.com', 'Argentina', 'San Juan'),
('Accesorios Electrónicos S.A.', 'Lucía Torres', 'Calle Accesorios 890', '1144444444', 'lucia.torres@proveedor.com', 'Argentina', 'Tucumán');


-- Insertar datos en la tabla Pedidos
INSERT INTO Pedidos (producto_id, cantidad, fecha_pedido, fecha_entrega, estado, sector_destino_id, proveedor_id)
VALUES
(1, 2, '2023-06-01', '2023-06-05', 'Entregado', 1, 1),
(2, 1, '2023-06-02', '2023-06-06', 'Entregado', 1, 2),
(3, 5, '2023-06-03', '2023-06-07', 'Entregado', 2, 3),
(4, 10, '2023-06-04', '2023-06-08', 'Entregado', 2, 4),
(5, 7, '2023-06-05', '2023-06-09', 'Entregado', 3, 5),
(6, 15, '2023-06-06', '2023-06-10', 'Entregado', 3, 6),
(7, 20, '2023-06-07', '2023-06-11', 'Entregado', 4, 7),
(8, 8, '2023-06-08', '2023-06-12', 'Entregado', 4, 8),
(9, 3, '2023-06-09', '2023-06-13', 'Entregado', 5, 9),
(10, 4, '2023-06-10', '2023-06-14', 'Entregado', 5, 10);

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (nombre, apellido, cargo, sector_id, telefono, email, direccion)
VALUES
('Andrea', 'Sosa', 'Médico', 1, '1144445555', 'andrea.sosa@hospital.com', 'Calle 1, Buenos Aires'),
('Mateo', 'Romero', 'Enfermero', 1, '1144446666', 'mateo.romero@hospital.com', 'Calle 2, Buenos Aires'),
('Martina', 'Ibarra', 'Administrativo', 2, '1144447777', 'martina.ibarra@hospital.com', 'Calle 3, Buenos Aires'),
('Daniel', 'Schonfeld', 'Técnico de informática', 2, '1144448888', 'thiago.vega@hospital.com', 'Calle 4, Buenos Aires'),
('Valentina', 'Cáceres', 'Recepcionista', 3, '1144449999', 'valentina.caceres@hospital.com', 'Calle 5, Buenos Aires'),
('Benjamin', 'Paz', 'Camillero', 3, '1144440000', 'benjamin.paz@hospital.com', 'Calle 6, Buenos Aires'),
('Camila', 'Ledesma', 'Fisioterapeuta', 4, '1144441111', 'camila.ledesma@hospital.com', 'Calle 7, Buenos Aires'),
('Santiago', 'Nuñez', 'Radiólogo', 4, '1144442222', 'santiago.nunez@hospital.com', 'Calle 8, Buenos Aires'),
('Catalina', 'Moyano', 'Nutricionista', 5, '1144443333', 'catalina.moyano@hospital.com', 'Calle 9, Buenos Aires'),
('Lucas', 'Guzmán', 'Psicólogo', 5, '1144444444', 'lucas.guzman@hospital.com', 'Calle 10, Buenos Aires');

-- Insertar datos en la tabla Movimientos_Inventario
INSERT INTO Movimientos_Inventario (producto_id, tipo_movimiento, cantidad, fecha_movimiento, responsable_id, sector_destino_id)
VALUES
(1, 'Entrada', 5, '2023-06-15 10:00:00', 1, 1),
(2, 'Salida', 3, '2023-06-16 11:00:00', 2, 1),
(3, 'Transferencia', 2, '2023-06-17 12:00:00', 3, 2),
(4, 'Ajuste', 1, '2023-06-18 13:00:00', 4, 2),
(5, 'Entrada', 7, '2023-06-19 14:00:00', 5, 3),
(6, 'Salida', 10, '2023-06-20 15:00:00', 6, 3),
(7, 'Transferencia', 4, '2023-06-21 16:00:00', 7, 4),
(8, 'Ajuste', 2, '2023-06-22 17:00:00', 8, 4),
(9, 'Entrada', 6, '2023-06-23 18:00:00', 9, 5),
(10, 'Salida', 8, '2023-06-24 19:00:00', 10, 5);

USE Usuarios;

-- Insertar usuarios basados en el sector
INSERT INTO users (empleado_id, username, password, role)
SELECT e.empleado_id, 
       LOWER(CONCAT(e.nombre, '.', e.apellido)) AS username, 
       CONCAT('password_', e.empleado_id) AS password, 
       CASE
           WHEN s.nombre_sector = 'Informatica' THEN 'Admin'
           ELSE 'Operativo'
       END AS role
FROM Inventario.Empleados e
JOIN Inventario.Sectores s ON e.sector_id = s.sector_id;
