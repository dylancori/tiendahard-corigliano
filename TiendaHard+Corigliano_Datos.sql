
USE TiendaHardCorigliano;

INSERT INTO Categoria (nombre_categoria) VALUES
('Periféricos'), ('Componentes'), ('Almacenamiento');

INSERT INTO Proveedor (nombre_proveedor, telefono, email) VALUES
('GamerZone', '1122334455', 'contacto@gamerzone.com'),
('HardStore', '1133445566', 'ventas@hardstore.com');

INSERT INTO Producto (nombre_producto, descripcion, precio, stock, id_categoria, id_proveedor) VALUES
('Mouse RGB', 'Mouse gamer con iluminación RGB', 4500.00, 25, 1, 1),
('Teclado Mecánico', 'Teclado con switches rojos', 8500.00, 15, 1, 2),
('SSD 1TB', 'Disco sólido de 1TB NVMe', 19500.00, 10, 3, 2);

INSERT INTO Cliente (nombre_cliente, email, telefono, direccion) VALUES
('Juan Pérez', 'juanp@gmail.com', '1144556677', 'Av. Corrientes 1234'),
('Ana Torres', 'ana_t@hotmail.com', '1177889900', 'Calle Falsa 456');

INSERT INTO MetodoPago (descripcion) VALUES
('Efectivo'), ('Transferencia'), ('Tarjeta de Crédito');

INSERT INTO Pedido (id_cliente, fecha_pedido, id_metodo_pago, total) VALUES
(1, '2024-06-10 14:30:00', 3, 13000.00),
(2, '2024-06-12 10:15:00', 1, 4500.00);

INSERT INTO DetallePedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 2, 1, 8500.00),
(1, 1, 1, 4500.00),
(2, 1, 1, 4500.00);

INSERT INTO EmpresaEnvio (nombre_empresa) VALUES
('Correo Rápido'), ('EnvíaYA Express');

INSERT INTO Envio (id_pedido, direccion_envio, fecha_envio, id_empresa, estado) VALUES
(1, 'Av. Corrientes 1234', '2024-06-11', 1, 'Entregado'),
(2, 'Calle Falsa 456', '2024-06-13', 2, 'En Camino');
