USE db_dietetica;

DROP FUNCTION IF EXISTS Calcular_Total_Ventas_Producto;
DROP FUNCTION IF EXISTS Verificar_Stock_Minimo;

-- Función que calcula el total de ventas para un producto específico

DELIMITER //

CREATE FUNCTION Calcular_Total_Ventas_Producto (p_IDProducto INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA

BEGIN
  DECLARE total DECIMAL(10, 2);
  SELECT SUM(p.Total) INTO total
  FROM PEDIDO p
  WHERE p.IDProducto = p_IDProducto;
  
  RETURN total;
END //
DELIMITER ;


-- Función que verifica si un producto está por debajo del stock mínimo

DELIMITER //

CREATE FUNCTION Verificar_Stock_Minimo (p_IDProducto INT) RETURNS BOOLEAN
DETERMINISTIC
READS SQL DATA

BEGIN
  DECLARE stock INT;
  DECLARE minimo INT;
  
  SELECT StockActual, StockMinimo INTO stock, minimo
  FROM PRODUCTO
  WHERE IDProducto = p_IDProducto;
  
  RETURN stock < minimo;
END //

DELIMITER ;
