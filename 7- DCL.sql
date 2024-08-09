-- Asignar roles y permisos en el esquema Usuarios
USE Usuarios;

-- Crear los usuarios
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'Inf#098';
CREATE USER 'operativo_user'@'localhost' IDENTIFIED BY 'Password';

-- Administradores (empleados del sector de informática)
GRANT ALL PRIVILEGES ON Usuarios.* TO 'admin_user'@'localhost';
GRANT ALL PRIVILEGES ON Inventario.* TO 'admin_user'@'localhost';

-- Usuarios Operativos (otros empleados)
GRANT SELECT, INSERT, UPDATE ON Inventario.Pedidos TO 'operativo_user'@'localhost';
GRANT SELECT ON Inventario.Productos TO 'operativo_user'@'localhost';
GRANT SELECT ON Inventario.Movimientos_Inventario TO 'operativo_user'@'localhost';
