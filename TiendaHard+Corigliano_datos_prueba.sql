
USE TiendaHardCorigliano;

-- Insertar Categorías
INSERT INTO Categoria (nombre_categoria) VALUES
('Placas de Video'),
('Procesadores'),
('Periféricos'),
('Motherboards');

-- Insertar Proveedores
INSERT INTO Proveedor (nombre_proveedor, telefono, email) VALUES
('ProveedorTech', '123456789', 'contacto@proveedortech.com'),
('Distribuciones Gamer', '987654321', 'ventas@distgamer.com');

-- Insertar Productos
INSERT INTO Producto (nombre_producto, descripcion, precio, stock, id_categoria, id_proveedor) VALUES
('NVIDIA RTX 4070', 'Placa de video de alto rendimiento', 950.00, 10, 1, 1),
('AMD Ryzen 7 5800X', 'Procesador para gaming', 380.00, 15, 2, 2),
('Teclado Mecánico RGB', 'Periférico con retroiluminación', 70.00, 30, 3, 1),
('MSI B550 Gaming Plus', 'Motherboard para AMD Ryzen', 150.00, 8, 4, 2);

-- Insertar Clientes
INSERT INTO Cliente (nombre_cliente, email, telefono, direccion) VALUES
('Juan Pérez', 'juanperez@mail.com', '1122334455', 'Calle Falsa 123'),
('María González', 'mariagonzalez@mail.com', '2233445566', 'Av. Siempre Viva 742');

-- Insertar Métodos de Pago
INSERT INTO MetodoPago (descripcion) VALUES
('Tarjeta de Crédito'),
('Transferencia Bancaria');

-- Insertar Pedidos
INSERT INTO Pedido (id_cliente, fecha_pedido, id_metodo_pago, total) VALUES
(1, NOW(), 1, 1020.00),
(2, NOW(), 2, 450.00);

-- Insertar Detalles de Pedido
INSERT INTO DetallePedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 950.00),
(1, 3, 1, 70.00),
(2, 2, 1, 380.00),
(2, 4, 1, 150.00);

-- Insertar Envíos
INSERT INTO Envio (id_pedido, direccion_envio, fecha_envio, empresa_envio, estado) VALUES
(1, 'Calle Falsa 123', CURDATE(), 'Correo Rápido', 'En camino'),
(2, 'Av. Siempre Viva 742', CURDATE(), 'EnvíaYA', 'Entregado');
