
USE db_dietetica;

-- Vista que muestra los detalles de los pedidos con información del cliente y método de pago

CREATE OR REPLACE VIEW db_dietetica.vista_detalles_pedidos AS

SELECT 
  p.IDPedido,
  p.Fecha AS Fecha_Pedido,
  p.Total AS Total_Pedido,
  c.Nombre AS Nombre_Cliente,
  m.Nombre AS Metodo_Pago,
  pr.Nombre AS Producto
  
FROM PEDIDO p

JOIN CLIENTE c ON p.IDCliente = c.IDCliente
JOIN METODO_DE_PAGO m ON p.IDMetodoPago = m.IDMetodoPago
JOIN PRODUCTO pr ON p.IDProducto = pr.IDProducto;

-- Vista que muestra la facturación total de cada cliente

CREATE OR REPLACE VIEW  db_dietetica.vista_facturacion_cliente AS

SELECT 
  c.IDCliente,
  c.Nombre AS Nombre_Cliente,
  SUM(f.Total) AS Total_Facturado
FROM CLIENTE c
JOIN PEDIDO p ON c.IDCliente = p.IDCliente
JOIN FACTURA f ON p.IDPedido = f.IDPedido
GROUP BY c.IDCliente, c.Nombre;

