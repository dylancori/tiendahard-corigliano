
-- Tabla auditora para registrar productos eliminados
CREATE TABLE ProductoEliminado (
    id_eliminado INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    nombre_producto VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,2),
    stock INT,
    id_categoria INT,
    fecha_eliminacion DATETIME
);

-- Trigger que guarda productos eliminados en la tabla ProductoEliminado
DELIMITER //
CREATE TRIGGER trg_producto_eliminado
BEFORE DELETE ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO ProductoEliminado (id_producto, nombre_producto, descripcion, precio, stock, id_categoria, fecha_eliminacion)
    VALUES (OLD.id_producto, OLD.nombre_producto, OLD.descripcion, OLD.precio, OLD.stock, OLD.id_categoria, NOW());
END;
//
DELIMITER ;
