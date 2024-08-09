use Inventario;

-- Representa las unidades organizativas más grandes dentro del hospital, que pueden contener varios sectores.

CREATE TABLE Departamentos (
    departamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_departamento VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(255),
    responsable VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(100),
    extension VARCHAR(10),
    horario VARCHAR(100)
);

-- Almacena información sobre los diferentes sectores del hospital.

CREATE TABLE Sectores (
    sector_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_sector VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(255),
    responsable VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(100),
    extension VARCHAR(10),
    horario VARCHAR(100),
    departamento_id INT NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(departamento_id)
);

-- Organiza los productos en diferentes categorías para una mejor gestión.

CREATE TABLE Categorias (
    categoria_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(100) NOT NULL,
    descripcion_categoria TEXT,
    sector_id INT NOT NULL,
    FOREIGN KEY (sector_id) REFERENCES Sectores(sector_id)
);

-- Almacena información sobre los productos relacionados con informática disponibles en el inventario.

CREATE TABLE Productos (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    cantidad_disponible INT NOT NULL,
    marca VARCHAR(100),
    modelo VARCHAR(100),
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

-- Contiene detalles sobre los proveedores de los productos.

CREATE TABLE Proveedores (
    proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proveedor VARCHAR(255) NOT NULL,
    contacto VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(100),
    pais VARCHAR(100),
    ciudad VARCHAR(100)
);

-- Registra los pedidos de productos, incluyendo detalles como la cantidad, fechas y proveedor.

CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_pedido DATE,
    fecha_entrega DATE,
    estado VARCHAR(50),
    sector_destino_id INT NOT NULL,
    proveedor_id INT NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id),
    FOREIGN KEY (sector_destino_id) REFERENCES Sectores(sector_id),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);

-- Almacena información sobre el personal del hospital.

CREATE TABLE Empleados (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255),
    cargo VARCHAR(100),
    sector_id INT NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(255),
    FOREIGN KEY (sector_id) REFERENCES Sectores(sector_id)
);

-- Registra los movimientos de productos dentro del inventario.

CREATE TABLE Movimientos_Inventario (
    movimiento_id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT NOT NULL,
    tipo_movimiento ENUM('Entrada', 'Salida', 'Transferencia', 'Ajuste') NOT NULL,
    cantidad INT NOT NULL,
    fecha_movimiento DATETIME DEFAULT NOW(),
    responsable_id INT NOT NULL,
    sector_destino_id INT NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id),
    FOREIGN KEY (responsable_id) REFERENCES Empleados(empleado_id),
    FOREIGN KEY (sector_destino_id) REFERENCES Sectores(sector_id)
);

-- registra todas las modificaciones realizadas a los productos en la tabla Productos.

CREATE TABLE Auditoria_Productos (
    auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    campo_modificado VARCHAR(100) NOT NULL,
    valor_anterior VARCHAR(250),
    valor_nuevo VARCHAR(250),
    fecha_modificacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    usuario_modificacion VARCHAR(100) NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

use usuarios;

-- Crear la tabla users para almacenar información de usuarios
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Operativo') NOT NULL,
    FOREIGN KEY (empleado_id) REFERENCES Inventario.Empleados(empleado_id)
);
