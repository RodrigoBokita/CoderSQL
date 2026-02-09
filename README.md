-- # CoderSQL
-- Trabajo Practico

-- al generar las tablas, solo me generaba la tabla sucursal y estuve investigando porque el resto NO
-- aparentemente tenia que agregar "ENGINE=InnoDB" por ser Workbench y ejecutar una tabla a la vez
-- de esa manera pude crear el DER completo

CREATE TABLE IF NOT EXISTS sucursal(
id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (100) NOT NULL,
direccion VARCHAR (100),
ciudad VARCHAR (100));

CREATE TABLE IF NOT EXISTS empleado(
id_empleado INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (100),
apellido VARCHAR (100),
cargo VARCHAR (100),
sueldo DECIMAL (10,2),
id_sucursal INT,
FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS cliente(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (100),
apellido VARCHAR (100),
dni VARCHAR (15) UNIQUE,
direccion VARCHAR (150),
telefono VARCHAR (50),
email VARCHAR(100) DEFAULT 'notiene@notiene.com',
id_sucursal INT,
FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS cuenta (
id_cuenta INT AUTO_INCREMENT PRIMARY KEY,
tipo_cuenta VARCHAR (100),
saldo DECIMAL (12,2),
fecha_apertura DATE,
id_sucursal INT,
FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS cliente_cuenta (
id_cliente INT,
id_cuenta INT,
PRIMARY KEY (id_cliente, id_cuenta),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_cuenta) REFERENCES cuenta(id_cuenta))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS tarjeta (
nro_tarjeta BIGINT PRIMARY KEY,
tipo VARCHAR (100),
fecha_vencimiento DATE,
limite DECIMAL (12,2),
id_cuenta INT,
FOREIGN KEY (id_cuenta) REFERENCES cuenta(id_cuenta))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS movimiento (
id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
fecha DATE,
monto DECIMAL (12,2),
tipo_movimiento VARCHAR (100),
id_cuenta INT,
FOREIGN KEY (id_cuenta) REFERENCES cuenta(id_cuenta))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS servicio (
id_servicio INT AUTO_INCREMENT PRIMARY KEY,
tipo_servicio VARCHAR (100),
descripcion VARCHAR (200),
costo DECIMAL (10,2),
fecha DATE,
id_cliente INT,
id_cuenta INT,
id_sucursal INT,
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_cuenta) REFERENCES cuenta(id_cuenta),
FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal))
ENGINE=InnoDB;

-- me di cuenta que al crear el DER las entidades empleado, servicio y cliente no estaban vinculadas como queria
-- modifique una tabla para que tengan relacion

ALTER TABLE servicio
ADD COLUMN id_empleado INT NOT NULL,
ADD CONSTRAINT fk_servicio_empleado
	FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado);
