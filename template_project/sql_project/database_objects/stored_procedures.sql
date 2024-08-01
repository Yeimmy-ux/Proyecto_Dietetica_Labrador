-- Crear Stored Procedures

DROP PROCEDURE IF EXISTS Agregar_Producto;
DROP PROCEDURE IF EXISTS Registrar_Pedido;

-- Procedimiento para agregar un nuevo producto

DELIMITER //

CREATE PROCEDURE Agregar_Producto (
  IN p_Nombre VARCHAR(100),
  IN p_Descripcion TEXT,
  IN p_PrecioVenta DECIMAL(10, 2),
  IN p_PrecioCosto DECIMAL(10, 2),
  IN p_StockActual INT,
  IN p_StockMinimo INT,
  IN p_IDProveedor INT,
  IN p_IDCategoria INT
)
BEGIN
  INSERT INTO PRODUCTO (Nombre, Descripcion, PrecioVenta, PrecioCosto, StockActual, StockMinimo, IDProveedor, IDCategoria)
  VALUES (p_Nombre, p_Descripcion, p_PrecioVenta, p_PrecioCosto, p_StockActual, p_StockMinimo, p_IDProveedor, p_IDCategoria);
   SELECT 'Producto creado exitosamente.';
END //
DELIMITER ;

-- Procedimiento para registrar un nuevo pedido

DELIMITER //

CREATE PROCEDURE Registrar_Pedido (
  IN p_Fecha DATE,
  IN p_Total DECIMAL(10, 2),
  IN p_IDCliente INT,
  IN p_IDProducto INT,
  IN p_IDMetodoPago INT
)
BEGIN
  INSERT INTO PEDIDO (Fecha, Total, IDCliente, IDProducto, IDMetodoPago)
  VALUES (p_Fecha, p_Total, p_IDCliente, p_IDProducto, p_IDMetodoPago);
END //
DELIMITER ;