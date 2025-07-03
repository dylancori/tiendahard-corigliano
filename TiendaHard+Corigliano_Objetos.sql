
USE TiendaHardCorigliano;

CREATE OR REPLACE VIEW vista_detalle_pedidos AS
SELECT p.id_pedido, c.nombre_cliente, pr.nombre_producto, d.cantidad, d.precio_unitario, p.total
FROM Pedido p
JOIN Cliente c ON p.id_cliente = c.id_cliente
JOIN DetallePedido d ON p.id_pedido = d.id_pedido
JOIN Producto pr ON d.id_producto = pr.id_producto;

CREATE OR REPLACE VIEW vista_stock_bajo AS
SELECT nombre_producto, stock FROM Producto
WHERE stock < 10;

CREATE OR REPLACE VIEW vista_envios_detalle AS
SELECT e.id_envio, em.nombre_empresa, e.estado, p.fecha_pedido
FROM Envio e
JOIN EmpresaEnvio em ON e.id_empresa = em.id_empresa
JOIN Pedido p ON e.id_pedido = p.id_pedido;

CREATE OR REPLACE VIEW vista_ventas_cliente AS
SELECT c.nombre_cliente, COUNT(p.id_pedido) AS cantidad_pedidos, SUM(p.total) AS total_gastado
FROM Cliente c
JOIN Pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.nombre_cliente;

CREATE OR REPLACE VIEW vista_productos_proveedor AS
SELECT pr.nombre_proveedor, p.nombre_producto, p.stock
FROM Proveedor pr
JOIN Producto p ON p.id_proveedor = pr.id_proveedor;

DELIMITER //
CREATE FUNCTION calcular_total_pedido(pedido_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10,2);
  SELECT SUM(cantidad * precio_unitario) INTO total
  FROM DetallePedido WHERE id_pedido = pedido_id;
  RETURN total;
END;
//

CREATE FUNCTION obtener_stock_producto(prod_id INT) RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE s INT;
  SELECT stock INTO s FROM Producto WHERE id_producto = prod_id;
  RETURN s;
END;
//

CREATE PROCEDURE actualizar_stock_pedido(IN pedido_id INT)
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE pid INT;
  DECLARE cant INT;
  DECLARE cur CURSOR FOR
    SELECT id_producto, cantidad FROM DetallePedido WHERE id_pedido = pedido_id;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO pid, cant;
    IF done THEN
      LEAVE read_loop;
    END IF;
    UPDATE Producto SET stock = stock - cant WHERE id_producto = pid;
  END LOOP;
  CLOSE cur;
END;
//

CREATE PROCEDURE registrar_nuevo_cliente(IN nombre VARCHAR(100), IN correo VARCHAR(100),
                                         IN tel VARCHAR(20), IN dir VARCHAR(200))
BEGIN
  INSERT INTO Cliente (nombre_cliente, email, telefono, direccion)
  VALUES (nombre, correo, tel, dir);
END;
//

CREATE TRIGGER trg_calcular_total
BEFORE INSERT ON Pedido
FOR EACH ROW
BEGIN
  IF NEW.total IS NULL THEN
    SET NEW.total = 0;
  END IF;
END;
//

CREATE TRIGGER trg_log_stock_update
AFTER UPDATE ON Producto
FOR EACH ROW
BEGIN
  IF NEW.stock <> OLD.stock THEN
    INSERT INTO Categoria(nombre_categoria) VALUES (CONCAT('Log: Stock de ', NEW.nombre_producto, ' modificado.'));
  END IF;
END;
//
