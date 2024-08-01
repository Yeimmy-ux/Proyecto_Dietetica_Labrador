-- Crear Triggers

USE db_dietetica;

DROP TRIGGER IF EXISTS Actualizar_Stock_After_Pedido;
DROP TRIGGER IF EXISTS Verificar_Stock_Minimo_After_Update;

-- Trigger que actualiza el stock del producto después de un pedido

DELIMITER //

CREATE TRIGGER Actualizar_Stock_After_Pedido
AFTER INSERT ON PEDIDO
FOR EACH ROW
BEGIN 
	UPDATE PRODUCTO
    SET StockActual = StockActual - 1
    WHERE IDProducto = NEW.IDProducto;

END //

DELIMITER ;

-- Trigger que verifica el stock mínimo después de una actualización

DELIMITER //

CREATE TRIGGER Verificar_Stock_Minimo_After_Update
AFTER UPDATE ON PRODUCTO
FOR EACH ROW
BEGIN
  IF OLD.StockActual < OLD.StockMinimo THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Stock actual por debajo del stock mínimo.';
  END IF;
END //

DELIMITER ;
