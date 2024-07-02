## CREACION BASE DE UN SISTEMA PARA GESTIONAR UNA DIETETICA

### PROBLEMA:
Actualmente la Dietética “Yerbabuena Tienda Saludable“ utiliza Excel como sistema de gestión de pedidos para poder controlar y analizar datos sobre proveedores, productos y ventas, pero sus datos han incrementado y con el uso se rompe constantemente el archivo, por este motivo se encuentra en la necesidad de diseñar una base de datos eficiente que pueda manejar todas las operaciones relacionadas con su negocio.

### DESCRIPCION DEL PROBLEMA:

•	**Pedidos**: Contiene la información de los pedidos realizados por los clientes, incluyendo detalles como fecha, Productos, precio por unidad, Precio total, y método de pago utilizado.

•	**Productos**: Incluye los productos disponibles para la venta, con detalles como nombre, descripción, precio y stock. Además, se quiere hacer referencia a las categorías a las que pertenecen y los proveedores que los suministran.

•	**Facturación**: Base de datos que contiene los detalles específicos de cada factura asociada a un pedido, como cantidad, precio unitario y subtotal.

•  **Gestion de Clientes**: Base de datos que almacena la información de los clientes que realizan pedidos.

•	**Proveedores**: Para gestionar la información de los proveedores que suministran productos a la dietética.

•	**Categorías**: Define las categorías a las que pertenecen los productos.

•	**Métodos de Pago**: Contiene información sobre los métodos de pago disponibles para los clientes (Efectivo, Debito, Crédito, Billeteras virtuales)


### OBJETIVO:

Diseñar e implementar una base de datos relacional que cumpla con los requerimientos de la dietética en cuanto a gestión de pedidos, facturas y controles internos de stock y proveedores, esta base  de datos debe ser eficiente y fácil de mantener, para poder gestionar y analizar de manera ágil y precisa las operaciones

### DESCRIPCION DE LA BASE DE DATOS

### Tablas:

1. **CLIENTE**:
   - Almacena información sobre los clientes que realizan reservas.
   - Atributos: ID cliente, Nombre, Telefono, email, Dirección.

2. **PROVEEDOR**:
   - CContiene información sobre los proveedores.
   - Atributos: ID Proveedor, Nombre, Dirección, Telefono, email.

3. **PRODUCTOS**:
   - Contiene información sobre los productos, incluyendo referencias al proveedor y a la categoría del producto.
   - Atributos: ID Producto, Nombre, Descripción, Precio Venta, Precio Costo, Stock Actual, Stock Minimo, ID Proveedor, ID Categoria.
     
4. **PEDIDOS**:
   - Registra los pedidos realizados por los clientes, incluyendo el método de pago.
   - Atributos: ID Pedido, Fecha, Total, ID CLiente, ID Metodopago.

5. **FACTURAS**:
   - Registra las facturas generadas a partir de los pedidos.
   - Atributos: IID Factura,Fecha, Total, ID pedido;.

6. **METODO DE PAGO**:
   - Define los métodos de pago disponibles.
   - Atributos: ID Metodo de Pago, Nombre, Descripción.

7. **CATEGORIA DE PRODUCTO**:
   - Define las categorías a las que pueden pertenecer los productos.
   - Atributos: IID Categoria, Nombre, Descripción.

### Problemática Resuelta:

Esta base de datos permite gestionar eficientemente el proceso de pedidos y controles de productos, desde la información de los clientes y proveedores hasta la facturación. Algunos aspectos que aborda incluyen:

- Registro de clientes y proveedores.
- Categorias de los productos y cantidades.
- Gestión de los pedidos y facturas.

#### DER simplificado
```
+------------------+        +----------------------+        +------------------+
|      CLIENTE     |        |       PEDIDO         |        | Metedo_de_pago   |
+------------------+        +----------------------+        +------------------+
| IDCliente (PK)   |<>-----o| IDPedido  (PK)       |o-------| IDMetodoPago(PK)||
| nombre           |        | IDCliente (FK)       |        | nombre           |
| telefono         |        | IDProducto (FK)      |        | descripcion      |
| email            |        | idEmpleado (FK)      |        +------------------+
| direccion        |     ---| idMetodoPago (FK)    |          
+------------------+    |   | fecha                |        
                        |   | Total                |
            |-----------    +----------------------+                  
            |                        |                                  
            |                        |                                  
            |                        |                                  
            |                        v                                  
+------------------+        +-------------------+             +-------------------+
|     Factura      |        |      Producto     |             |     Proveedor     |
+------------------+        +-------------------+             +-------------------+
| IDFactura (PK)   |        | IDProducto (PK)   |             | IDProveedor (PK)  |
| Fecha            |        | IDProveedor(FK)   |o------------| nombre            |
| Total            |        | ICategoria(FK)    |             | Direccion         |
| IDPedido(FK)     |        | Descripcion       |             | telefono          | 
+------------------+        | Precio Costo      |             | Email             |
                            | Stock Actual      |             +-------------------+
                            | Stock Minimo      |
                            +-------------------+
                                      |
                                      |
                                      |
                                      v
                            +-------------------+
                            |Categoria_Producto |
                            +-------------------+
                            | IDCategoria(PK)   |
                            | nombre            |
                            | descripcion       |
                            +-------------------+
