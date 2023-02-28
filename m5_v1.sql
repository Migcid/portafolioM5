CREATE TABLE usuarios(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	password VARCHAR(50) NOT NULL
);

select * from usuarios;

CREATE TABLE productos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(50) NOT NULL,
	stock INT not null default 0,
	precio DECIMAL NOT NULL check(precio >=0),
	categoria VARCHAR(50)
);

-- check(stock >=0)

-- INSERT USUARIOS:

INSERT INTO usuarios(nombre, email, password) VALUES('Miguel', 'miguel@miguel.cl', '123456');
INSERT INTO usuarios(nombre, email, password) VALUES('Gigi', 'gipp@si.cl', '123456');
INSERT INTO usuarios(nombre, email, password) VALUES('Pedro', 'pedro@gmail.com', '123456');
INSERT INTO usuarios(nombre, email, password) VALUES('Juan', 'juanito@gmail.com', '123456');
INSERT INTO usuarios(nombre, email, password) VALUES('Facundo', 'facundo@gmail.com', '123456');

-- INSERT PRODUCTOS:

INSERT INTO productos(nombre, descripcion, stock, precio, categoria) VALUES('Pan', 'Marraqueta', 10, 1500, 'masas');
INSERT INTO productos(nombre, descripcion, stock, precio, categoria) VALUES('Bebida 2 litros fanta', 'Fanta 2 litros', 10, 1800, 'Bebestibles');
INSERT INTO productos(nombre, descripcion, stock, precio, categoria) VALUES('Arrollado huaso Emporio Aleman', 'Cecina con aji', 5, 15000, 'Fiambreria');
INSERT INTO productos(nombre, descripcion, stock, precio, categoria) VALUES('Tomate granel', 'Tomate larga vida Quillon', 10, 1200, 'Verduras');
INSERT INTO productos(nombre, descripcion, stock, precio, categoria) VALUES('Cerveza Austral', 'Calafate', 6, 1800, 'Bebestibles con alcohol');

SELECT * FROM productos;
 
 -- CREAR TABLA BOLETAS
 
CREATE TABLE boletas(
	numero_boleta INT PRIMARY KEY,
	fecha DATE NOT NULL,
	id_usuario INT NOT NULL,
	FOREIGN KEY(id_usuario) REFERENCES usuarios(id)
);

select * from boletas;

CREATE TABLE detalles_boletas(
	id SERIAL PRIMARY KEY,
	numero_boleta INT NOT NULL,
	id_producto INT NOT NULL,
	cantidad INT NOT NULL,
	precio DECIMAL NOT NULL check(precio >=0),
	FOREIGN KEY(numero_boleta) REFERENCES boletas(numero_boleta),
	FOREIGN KEY(id_producto) REFERENCES productos(id)
);

select * from detalles_boletas;

CREATE TABLE carritos(
	id SERIAL PRIMARY KEY,
	id_usuario INT NOT NULL,
	FOREIGN KEY(id_usuario) REFERENCES usuarios(id)
);

select * from carritos;

CREATE TABLE detalle_carritos(
	id SERIAL PRIMARY KEY,
	id_carrito INT NOT NULL,
	id_producto INT NOT NULL,
	FOREIGN KEY(id_carrito) REFERENCES carritos(id),
	FOREIGN KEY(id_producto) REFERENCES productos(id)
);

select * from detalle_carritos;

-- ACTUALIZACION DE PRECIOS CON 20% DE DESCUENTO

UPDATE productos set precio=(precio * 0.8);

select * from productos;

-- LISTAR STOCK CRITICO PRODUCTOS MENOR O IGUAL A 5

select * from productos where stock<=5;

-- SIMULAR LA COMPRA DE AL MENOS 3 PRODUCTOS, CALCULAR EL SUBTOTAL, AGREGAR EL IVA Y MOSTRAR EL TOTAL DEL PRODUCTO.

-- primero agregamos un usuario que hizo la compra a la tabla carrito

INSERT INTO carritos(id_usuario) values ('1');

-- insertamos los productosa la tabla detalle carritos

INSERT INTO detalle_carritos(id_carrito, id_producto) VALUES ('1', '2');
INSERT INTO detalle_carritos(id_carrito, id_producto) VALUES ('1', '3');
INSERT INTO detalle_carritos(id_carrito, id_producto) VALUES ('1', '5');

-- CREAMOS LA BOLETA



-- insertamos los detalles a la boleta
numero_boleta INT NOT NULL,
	id_producto INT NOT NULL,
	cantidad INT NOT NULL,
	precio DECIMAL NOT NULL check(precio >=0),
	
INSERT INTO detalle_boletas(numero_boleta, id_producto, cantidad, precio) VALUES ('0001', '2', '1', precio.productos);



