USE db_dietetica;

-- IMPORTANTE PARA QUE ENTIENDA QUE DEBE HACER LA IMPORTACION
SET GLOBAL local_infile = true;

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/clientes.csv'
INTO TABLE CLIENTE
FIELDS TERMINATED BY ','  ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(NOMBRE,TELEFONO,EMAIL,DIRECCION);

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/proveedores.csv'
INTO TABLE PROVEEDOR
FIELDS TERMINATED BY ','  ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(NOMBRE,DIRECCION,TELEFONO,EMAIL);


LOAD DATA  LOCAL INFILE '/sql_project/data_csv/categoria_productos.csv'
INTO TABLE CATEGORIA_PRODUCTO
FIELDS TERMINATED BY ','  ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(NOMBRE,DESCRIPCION);


LOAD DATA  LOCAL INFILE '/sql_project/data_csv/metodo_pago.csv'
INTO TABLE METODO_DE_PAGO
FIELDS TERMINATED BY ','  ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(NOMBRE,DESCRIPCION);


LOAD DATA  LOCAL INFILE '/sql_project/data_csv/facturas.csv'
INTO TABLE FACTURA
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(FECHA,TOTAL,IDPEDIDO);

-- RESERVA

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/pedidos.csv'
INTO TABLE PEDIDO
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(FECHA;TOTAL;IDCLIENTE;IDPRODUCTO;IDMETODOPAGO)

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/producto.csv'
INTO TABLE PRODUCTO
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(NOMBRE,DESCRIPCION,PrecioVenta,PrecioCosto,StockActual,StockMinimo,IDProveedor,IDCategoria)

-- SUSTITUYENDO DATOS POR MEDIO DE COMANDO IUPDATE (PRUEBA)

UPDATE db_dietetica.categoria_producto SET Nombre = 'Sup', Descripcion = 'Suplementos' WHERE (IDCategoria = '1');
UPDATE db_dietetica.categoria_producto SET Nombre = 'Vit', Descripcion = 'Vitaminas' WHERE (IDCategoria = '2');
UPDATE db_dietetica.categoria_producto SET Nombre = 'Min', Descripcion = 'Minerales' WHERE (IDCategoria = '3');
UPDATE db_dietetica.categoria_producto SET Nombre = 'Barras', Descripcion = 'Barras Energeticas' WHERE (IDCategoria = '4');
UPDATE db_dietetica.categoria_producto SET Nombre = 'Snack', Descripcion = 'Snacks Saludables' WHERE (IDCategoria = '5');
UPDATE db_dietetica.categoria_producto SET Nombre = 'Prote', Descripcion = 'Proteinas Vegetales' WHERE (IDCategoria = '6');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '7');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '8');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '9');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '10');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '11');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '12');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '13');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '14');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '15');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '16');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '17');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '18');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '19');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '20');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '21');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '22');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '23');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '24');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '25');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '26');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '27');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '28');
UPDATE db_dietetica.categoria_producto SET Nombre = 'S/C', Descripcion = 'S/C' WHERE (IDCategoria = '29');