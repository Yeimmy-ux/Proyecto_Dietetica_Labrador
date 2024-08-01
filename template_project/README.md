## Segunda PreEntrga de SQL

### DOCUMENTACION DE VISTAS

### Vista: vista_detalles_pedidos

**Descripción:**
Esta vista proporciona una visión detallada de los pedidos realizados en el sistema, incluyendo información del cliente, método de pago utilizado y el producto comprado. Es útil para revisar el detalle completo de cada pedido.

**Columnas:**

• IDPedido: Identificador único del pedido.
• Fecha_Pedido: Fecha en la que se realizó el pedido.
• Total_Pedido: Monto total del pedido.
• Nombre_Cliente: Nombre del cliente que realizó el pedido.
• Metodo_Pago: Nombre del método de pago utilizado para el pedido.
• Producto: Nombre del producto incluido en el pedido.

**Ejemplo de consulta:**: 

SELECT * FROM db_dietetica.vista_detalles_pedidos
WHERE Fecha_Pedido BETWEEN '2024-07-01' AND '2024-07-30'
AND Metodo_Pago = 'Tarjeta de Crédito';


### Vista: vista_facturacion_cliente

**Descripción:**
Esta vista muestra la facturación total acumulada por cada cliente. Resume el total facturado por cliente basado en la información de pedidos y facturas, proporcionando un panorama de cuánto ha gastado cada cliente en total.

**Columnas:**

• IDCliente: Identificador único del cliente.
• Nombre_Cliente: Nombre del cliente.
• Total_Facturado: Suma total de las facturas para el cliente.

**Ejemplo de consulta:**:

SELECT * FROM db_dietetica.vista_facturacion_cliente
WHERE Total_Facturado > 100
ORDER BY Total_Facturado DESC;

### DOCUMENTACION DE FUNCIONES

### Función: Calcular_Total_Ventas_Producto

**Descripción:**
Esta función calcula el total de ventas para un producto específico sumando el total de todos los pedidos que incluyen ese producto. Es útil para obtener una visión general de las ventas acumuladas de un producto particular.

**Parámetros:**

• p_IDProducto (INT): El identificador del producto para el cual se desea calcular el total de ventas.

**Retorno:**

DECIMAL(10, 2): El total de ventas acumulado para el producto especificado, con dos decimales.

**Ejemplo de consulta:**: 

SELECT Calcular_Total_Ventas_Producto(11) AS Total_Ventas;

En este ejemplo, la función calcula el total de ventas para el producto con el identificador 11.


### Función: Verificar_Stock_Minimo

**Descripción:**
Esta función verifica si el stock actual de un producto está por debajo del stock mínimo requerido. Es útil para la gestión de inventarios, ya que ayuda a identificar cuándo es necesario reabastecer un producto.

**Parámetros:**

• p_IDProducto (INT): El identificador del producto para verificar el stock.

**Retorno:**

BOOLEAN: Devuelve TRUE si el stock actual del producto es menor que el stock mínimo; de lo contrario, devuelve FALSE.

**Ejemplo de consulta:**: 

SELECT Verificar_Stock_Minimo(11) AS Stock_Bajo;

En este ejemplo, la función verifica si el stock del producto con el identificador 11 está por debajo del nivel mínimo. Si el stock es bajo, la función devuelve TRUE; si no, devuelve FALSE.

### DOCUMENTACION DE TRIGGERS

### Trigger: Actualizar_Stock_After_Pedido

**Descripción:**
Este trigger se activa automáticamente después de la inserción de un nuevo registro en la tabla PEDIDO. Su función principal es actualizar el stock del producto correspondiente, reduciendo el stock actual en una unidad cada vez que se realiza un nuevo pedido.

**Detalles:**

• Evento: AFTER INSERT en la tabla PEDIDO.
• Acción: Resta 1 al StockActual del producto asociado al pedido.
• Tabla afectada: PRODUCTO.
• Referencia: Usa el valor de NEW.IDProducto del registro recién insertado en PEDIDO.

**Ejemplo de funcionamiento:**

Supongamos que se inserta un nuevo pedido para el producto con IDProducto 12:

INSERT INTO PEDIDO (IDPedido, IDCliente, IDProducto, Total) 
VALUES (1, 1, 12, 50.00);
Después de ejecutar esta inserción, el stock del producto con IDProducto 12 en la tabla PRODUCTO se actualizará automáticamente, reduciendo su StockActual en 1.

### Trigger: Verificar_Stock_Minimo_After_Update

**Descripción:**
Este trigger se activa automáticamente después de una actualización en la tabla PRODUCTO. Su propósito es verificar si el stock actual del producto, después de la actualización, es menor que el stock mínimo requerido. Si el stock actual es insuficiente, el trigger genera un error para alertar sobre la situación.

**Detalles:**

• Evento: AFTER UPDATE en la tabla PRODUCTO.
• Acción: Verifica si StockActual es menor que StockMinimo después de la actualización. Si es así, se genera un error con un mensaje personalizado.
• Condición: Compara el stock actual con el stock mínimo utilizando OLD (valores anteriores antes de la actualización).
• Manejo de errores: Usa SIGNAL SQLSTATE '45000' para lanzar un error y mostrar un mensaje específico.

**Ejemplo de funcionamiento:**

Supongamos que se actualiza el stock de un producto con IDProducto 12:

UPDATE PRODUCTO 
SET StockActual = 5 
WHERE IDProducto = 12;

Si el stock mínimo para este producto es 10 y el stock actual después de la actualización queda por debajo de ese umbral, el trigger generará un error con el mensaje "Stock actual por debajo del stock mínimo."

### DOCUMENTACION DE TRIGGERS

### Procedimiento Almacenado: Agregar_Producto

**Descripción:**
Este procedimiento almacenado se utiliza para agregar un nuevo producto a la tabla PRODUCTO. Permite ingresar todos los detalles relevantes del producto, como nombre, descripción, precios, stock, proveedor y categoría.

**Parámetros:**

• p_Nombre (VARCHAR(100)): Nombre del producto.
• p_Descripcion (TEXT): Descripción del producto.
• p_PrecioVenta (DECIMAL(10, 2)): Precio de venta del producto.
• p_PrecioCosto (DECIMAL(10, 2)): Precio de costo del producto.
• p_StockActual (INT): Cantidad actual en stock del producto.
• p_StockMinimo (INT): Stock mínimo del producto.
• p_IDProveedor (INT): Identificador del proveedor del producto.
• p_IDCategoria (INT): Identificador de la categoría del producto.

**Retorno:**

SELECT 'Producto creado exitosamente.'; (Este retorno se maneja como un mensaje de confirmación en lugar de un valor de retorno tradicional.)

**Ejemplo de uso:**


CALL Agregar_Producto(
  'Proteína Whey',
  'Suplemento de proteína para deportistas',
  29.99,
  15.00,
  100,
  10,
  3,
  2
);

En este ejemplo, se agrega un producto llamado "Proteína Whey" con sus respectivos detalles a la tabla PRODUCTO.

### Procedimiento Almacenado: Registrar_Pedido

**Descripción:**
Este procedimiento almacenado se utiliza para registrar un nuevo pedido en la tabla PEDIDO. Inserta información relevante sobre el pedido, incluyendo la fecha, el total del pedido, el cliente, el producto y el método de pago.

**Parámetros:**

• p_Fecha (DATE): Fecha en la que se realizó el pedido.
• p_Total (DECIMAL(10, 2)): Monto total del pedido.
• p_IDCliente (INT): Identificador del cliente que realiza el pedido.
• p_IDProducto (INT): Identificador del producto incluido en el pedido.
• p_IDMetodoPago (INT): Identificador del método de pago utilizado para el pedido.

**Retorno:**

No tiene un valor de retorno explícito. La operación se completa con la inserción del nuevo registro en la tabla PEDIDO.

**Ejemplo de uso:**

CALL Registrar_Pedido(
  '2024-07-31',
  89.75,
  5,
  11,
  2
);

En este ejemplo, se registra un pedido realizado el 31 de julio de 2024, con un total de 89.75 Pesos, realizado por el cliente con ID 5, para el producto con ID 111, utilizando el método de pago con ID 2.