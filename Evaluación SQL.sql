CREATE SCHEMA IF NOT EXISTS negociodonpepe_schema;
CREATE TABLE `negociodonpepe_schema`.`producto`(
`producto_id` INT NOT NULL AUTO_INCREMENT,
`nombre`  VARCHAR(20) NOT NULL,
`proveedor_id`  VARCHAR(20) NOT NULL,
`precio` INT NOT NULL,
PRIMARY KEY (`producto_id`));

CREATE TABLE `negociodonpepe_schema`. `cliente`(
`cliente_id` INT NOT NULL AUTO_INCREMENT,
`producto_id` INT NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(20) NOT NULL,
`precio` INT NOT NULL,
PRIMARY KEY (`cliente_id`));

CREATE TABLE `negociodonpepe_schema`.`proveedor`(
`proveedor_id` INT NOT NULL AUTO_INCREMENT,
`producto_id` INT NOT NULL AUTO_INCREMENT,
`dirección` VARCHAR(40) NOT NULL,
`precio` INT NOT NULL,
PRIMARY KEY (`proveedor_id`));

CREATE TABLE `negociodonpepe_schema`.`factura`(
`factura_id` INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`factura_id`));

CREATE TABLE `negociodonpepe_schema`.`boleta`(
`boleta_id` INT NOT NULL,
`fecha` DATE NOT NULL,
`totalDeCompra` INT NOT NULL,


CREATE TABLE `negociodonpepe_schema`.`detalleDeCompra`(
`total` INT NOT NULL,
`producto_id`INT NOT NULL AUTO_INCREMENT,
`cliente_id` INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`detalleDeCompra`));

CREATE TABLE `negociodonpepe_schema`.`proveedor`(
`proveedor_id` INT NOT NULL AUTO_INCREMENT,
`producto_id` INT NOT NULL AUTO_INCREMENT,
`dirección` VARCHAR (40) NOT NULL,
PRIMARY KEY (`proveedor_id`));

#detalle de compra con producto
ALTER TABLE negociodonpepe_schema.detalleDeCompra ADD producto_id INT NOT NULL;
ALTER TABLE negociodonpepe_schema.detalleDeCompra ADD CONSTRAINT detalleDeCompra FOREIGN KEY (producto_id) REFERENCES negociodonpepe_schema(producto_id);

#boleta con producto y detalle
ALTER TABLE negociodonpepe_schema ADD boleta_id INT NOT NULL;
ALTER TABLE negociodonpepe_schema ADD CONSTRAINT detalleDeCompra FOREIGN KEY (boleta_id) REFERENCES negociodonpepe_schema(boleta_id);

#boleta con cliente
ALTER TABLE negociodonpepe_schema ADD cliente_id INT NOT NULL;
ALTER TABLE negociodonpepe_schema ADD CONSTRAINT boleta_cliente FOREIGN KEY (cliente_id) REFERENCES negociodonpepe_schema (cliente_id);

# detalle de compra y producto
ALTER TABLE negociodonpepe_schema.detalleDeCompra ADD producto_id INT NOT NULL;
ALTER TABLE negociodonpepe_schema.detalleDeCompra ADD CONSTRAINT detalleDeCompra_producto FOREIGN KEY (producto_id) REFERENCES negociodonpepe_schema.producto(producto_id);

#detalle de compra con factura
ALTER TABLE negociodonpepe_schema.detalleDeCompra ADD factura_id INT NOT NULL;
ALTER TABLE negociodonpepe_schema.detalleDeCompra ADD CONSTRAINT detalleDeCompra_factura FOREIGN KEY (factura_id) REFERENCES negociodonpepe_schema.factura(factura_id);

#Factura con proveedor
ALTER TABLE negociodonpepe_schema.factura ADD proveedor_id INT NOT NULL;
ALTER TABLE negociodonpepe_schema.factura ADD CONSTRAINT factura_proveedor FOREIGN KEY (proveedor_id) REFERENCES negociodonpepe_schema.proveedor(proveedor_id);

#Asignacion de valores a productos
INSERT INTO negociodonpepe_schema.tipo_de_producto (tipo_de_producto_id,categoria) VALUES (1,'dulces');
INSERT INTO negociodonpepe_schema.tipo_de_producto (tipo_de_producto_id,categoria) VALUES (2,'abarrotes');
INSERT INTO negociodonpepe_schema.tipo_de_producto (tipo_de_producto_id,categoria) VALUES (3,'frios');
INSERT INTO negociodonpepe_schema.tipo_de_producto (tipo_de_producto_id,categoria) VALUES (4,'congelados');
INSERT INTO negociodonpepe_schema.tipo_de_producto (tipo_de_producto_id,categoria) VALUES (5,'snacks');
SELECT * FROM negociodonpepe_schema.tipo_de_producto;

#Asignación valores a tabla con productos
INSERT INTO negociodonpepe_schema.producto (producto_id,nombre,tipo_de_producto_id,precio,stock) VALUES (1,'chocman',1,20,50);
INSERT INTO negociodonpepe_schema.producto (producto_id,nombre,tipo_de_producto_id,precio,stock) VALUES (2,'tallarines',2,700,40);
INSERT INTO negociodonpepe_schema.producto (producto_id,nombre,tipo_de_producto_id,precio,stock) VALUES (3,'AguaMás',3,1500,90);
INSERT INTO negociodonpepe_schema.producto (producto_id,nombre,tipo_de_producto_id,precio,stock) VALUES (4,'PulpadeFruta',4,7000,20);
INSERT INTO negociodonpepe_schema.producto (producto_id,nombre,tipo_de_producto_id,precio,stock) VALUES (5,'PapaFritas',5,700,40);
SELECT * FROM negociodonpepe_schema.producto;

#Relacion tabla producto y tipo de producto
SELECT tipo_de_producto.categoria , producto.producto_id, producto.nombre , producto.precio, producto.stock
FROM negociodonpepe_schema.producto
INNER JOIN negociodonpepe_pepe.tipo_de_producto on negociodonpepe_schema.tipo_de_producto.tipo_de_producto_id = negociodonpepe_schema.producto.tipo_de_producto_id;


