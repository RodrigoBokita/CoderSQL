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

-- ingreso datos para la tabla sucursal

INSERT INTO sucursal (nombre, direccion, ciudad) VALUES
('Sucursal Centro','Av. San Martin 120','Buenos Aires'),
('Sucursal Norte','Av. Libertador 450','Buenos Aires'),
('Sucursal Sur','Av. Mitre 330','Avellaneda'),
('Sucursal Oeste','Rivadavia 2200','Moreno'),
('Sucursal Este','Av. Belgrano 800','La Plata'),
('Sucursal Pilar','Ruta 8 km 50','Pilar'),
('Sucursal San Miguel','Av. Peron 1200','San Miguel'),
('Sucursal Tigre','Av. Cazon 450','Tigre'),
('Sucursal Quilmes','Av. Calchaqui 600','Quilmes'),
('Sucursal Moron','Av. Rivadavia 17500','Moron'),
('Sucursal Lujan','San Martin 450','Lujan'),
('Sucursal Escobar','Av. Tapia de Cruz 900','Escobar'),
('Sucursal Lanus','Hipolito Yrigoyen 3500','Lanus'),
('Sucursal Ituzaingo','Santa Rosa 900','Ituzaingo'),
('Sucursal San Isidro','Av. Centenario 700','San Isidro');

-- ingreso datos para la tabla empleados, poniendo 3 empleados por sucursal (total de 45 datos)

INSERT INTO empleado (nombre, apellido, cargo, sueldo, id_sucursal) VALUES
('Juan','Perez','Gerente',350000,1),
('Maria','Lopez','Cajero',220000,1),
('Carlos','Gomez','Asesor',240000,1),

('Ana','Martinez','Gerente',360000,2),
('Luis','Rodriguez','Cajero',210000,2),
('Laura','Fernandez','Asesor',230000,2),

('Pedro','Sanchez','Gerente',355000,3),
('Sofia','Ramirez','Cajero',205000,3),
('Miguel','Torres','Asesor',235000,3),

('Lucia','Flores','Gerente',365000,4),
('Diego','Acosta','Cajero',215000,4),
('Valeria','Mendez','Asesor',240000,4),

('Fernando','Rojas','Gerente',370000,5),
('Carla','Silva','Cajero',210000,5),
('Andres','Castro','Asesor',245000,5),

('Martin','Suarez','Gerente',360000,6),
('Julieta','Diaz','Cajero',220000,6),
('Nicolas','Herrera','Asesor',235000,6),

('Carolina','Navarro','Gerente',355000,7),
('Lucas','Paz','Cajero',205000,7),
('Camila','Sosa','Asesor',230000,7),

('Mateo','Ruiz','Gerente',365000,8),
('Valentina','Vega','Cajero',215000,8),
('Tomas','Morales','Asesor',240000,8),

('Florencia','Reyes','Gerente',360000,9),
('Agustin','Molina','Cajero',210000,9),
('Paula','Ortega','Asesor',235000,9),

('Joaquin','Ibarra','Gerente',370000,10),
('Milagros','Campos','Cajero',220000,10),
('Bruno','Luna','Asesor',245000,10),

('Santiago','Benitez','Gerente',360000,11),
('Luciana','Paredes','Cajero',215000,11),
('Franco','Villalba','Asesor',235000,11),

('Daniela','Godoy','Gerente',355000,12),
('Gonzalo','Quiroga','Cajero',210000,12),
('Marina','Vargas','Asesor',230000,12),

('Sebastian','Peralta','Gerente',365000,13),
('Rocio','Farias','Cajero',220000,13),
('Ivan','Ledesma','Asesor',240000,13),

('Natalia','Correa','Gerente',360000,14),
('Ezequiel','Bustamante','Cajero',210000,14),
('Lorena','Serrano','Asesor',235000,14),

('Pablo','Salinas','Gerente',370000,15),
('Gabriela','Cardozo','Cajero',220000,15),
('Adrian','Ojeda','Asesor',245000,15);

-- para el caso de la tabla cliente ingreso 2 por sucursal

INSERT INTO cliente (nombre, apellido, dni, direccion, telefono, email, id_sucursal) VALUES
('Martin','Suarez','30111222','Av Siempre Viva 123','1122334455','martin@gmail.com',1),
('Julieta','Diaz','30222333','San Martin 450','1122221111','julieta@hotmail.com',1),

('Nicolas','Herrera','30333444','Belgrano 780','1133344455','nico@gmail.com',2),
('Carolina','Navarro','30444555','Mitre 120','1144455566','caro@gmail.com',2),

('Lucas','Paz','30555666','Rivadavia 900','1155566677','lucas@hotmail.com',3),
('Camila','Sosa','30666777','Lavalle 345','1166677788','camila@hotmail.com',3),

('Mateo','Ruiz','30777888','Urquiza 111','1177788899','mateo@gmail.com',4),
('Valentina','Vega','30888999','Colon 567','1188899900','vale@hotmail.com',4),

('Tomas','Morales','30999000','Brown 222','1199900011','tomas@gmail.com',5),
('Florencia','Reyes','31000111','Pueyrredon 654','1100011122','flor@gmail.com',5),

('Agustin','Molina','31111222','Alsina 876','1101122233','agus@hotmail.com',6),
('Paula','Ortega','31222333','Callao 345','1102233344','paula@gmail.com',6),

('Joaquin','Ibarra','31333444','Independencia 765','1103344455','joa@gmail.com',7),
('Milagros','Campos','31444555','Saavedra 543','1104455566','mili@gmail.com',7),

('Bruno','Luna','31555666','Guemes 222','1105566677','bruno@hotmail.com',8),
('Sofia','Roldan','31666777','Lavalle 200','1106677788','sofia@hotmail.com',8),

('Diego','Fernandez','31777888','Mitre 340','1107788899','diego@yahoo.com',9),
('Lucia','Gimenez','31888999','San Martin 500','1108899900','lucia@gmail.com',9),

('Fernando','Acosta','31999000','Belgrano 890','1109900011','fer@yahoo.com',10),
('Carla','Mendez','32000111','Rivadavia 150','1110011122','carla@yahoo.com',10),

('Juan','Torres','32111222','Colon 765','1111122233','juan@gmail.com',11),
('Laura','Silva','32222333','Urquiza 222','1112233344','laura@gmail.com',11),

('Pedro','Castro','32333444','Brown 333','1113344455','pedro@yahoo.com',12),
('Ana','Vargas','32444555','Alsina 444','1114455566','ana@hotmail.com',12),

('Miguel','Rojas','32555666','Callao 555','1115566677','miguel@yahoo.com',13),
('Valeria','Navarro','32666777','Mitre 777','1116677788','valeria@gmail.com',13),

('Santiago','Ledesma','32777888','Belgrano 888','1117788899','santi@yahoo.com',14),
('Daniela','Godoy','32888999','Rivadavia 999','1118899900','dani@hotmail.com',14),

('Pablo','Ojeda','32999000','San Martin 222','1119900011','pablo@hotmail.com',15),
('Gabriela','Cardozo','33000111','Lavalle 111','1120011122','gabi@gmail.com',15);

-- para insertar datos en la tabla cuentas, hice 1 cuenta por cliente

INSERT INTO cuenta (tipo_cuenta, saldo, fecha_apertura, id_sucursal) VALUES
('Caja de ahorro',150000,'2023-01-10',1),
('Cuenta corriente',200000,'2023-02-10',1),
('Caja de ahorro',90000,'2023-03-10',2),
('Cuenta corriente',250000,'2023-04-10',2),
('Caja de ahorro',80000,'2023-05-10',3),
('Cuenta corriente',300000,'2023-06-10',3),
('Caja de ahorro',95000,'2023-07-10',4),
('Cuenta corriente',270000,'2023-08-10',4),
('Caja de ahorro',110000,'2023-09-10',5),
('Cuenta corriente',220000,'2023-10-10',5),
('Caja de ahorro',70000,'2023-11-10',6),
('Cuenta corriente',310000,'2023-12-10',6),
('Caja de ahorro',60000,'2024-01-10',7),
('Cuenta corriente',260000,'2024-02-10',7),
('Caja de ahorro',120000,'2024-03-10',8),
('Cuenta corriente',240000,'2024-04-10',8),
('Caja de ahorro',130000,'2024-05-10',9),
('Cuenta corriente',210000,'2024-06-10',9),
('Caja de ahorro',85000,'2024-07-10',10),
('Cuenta corriente',290000,'2024-08-10',10),
('Caja de ahorro',90000,'2024-09-10',11),
('Cuenta corriente',230000,'2024-10-10',11),
('Caja de ahorro',75000,'2024-11-10',12),
('Cuenta corriente',280000,'2024-12-10',12),
('Caja de ahorro',100000,'2025-01-10',13),
('Cuenta corriente',260000,'2025-02-10',13),
('Caja de ahorro',115000,'2025-03-10',14),
('Cuenta corriente',270000,'2025-04-10',14),
('Caja de ahorro',95000,'2025-05-10',15),
('Cuenta corriente',300000,'2025-06-10',15);

-- relacion entre cliente y cuenta (30 relaciones)

INSERT INTO cliente_cuenta VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),
(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),
(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),
(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),
(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);

-- para el caso de tarjetas 1 por cuenta (total de 30)

INSERT INTO tarjeta VALUES
(4500000000000001,'Credito','2027-01-01',200000,1),
(4500000000000002,'Debito','2027-02-01',150000,2),
(4500000000000003,'Credito','2027-03-01',180000,3),
(4500000000000004,'Debito','2027-04-01',120000,4),
(4500000000000005,'Credito','2027-05-01',300000,5),
(4500000000000006,'Debito','2027-06-01',100000,6),
(4500000000000007,'Credito','2027-07-01',400000,7),
(4500000000000008,'Debito','2027-08-01',90000,8),
(4500000000000009,'Credito','2027-09-01',220000,9),
(4500000000000010,'Debito','2027-10-01',110000,10),
(4500000000000011,'Credito','2027-11-01',350000,11),
(4500000000000012,'Debito','2027-12-01',95000,12),
(4500000000000013,'Credito','2028-01-01',420000,13),
(4500000000000014,'Debito','2028-02-01',100000,14),
(4500000000000015,'Credito','2028-03-01',310000,15),
(4500000000000016,'Debito','2028-04-01',90000,16),
(4500000000000017,'Credito','2028-05-01',210000,17),
(4500000000000018,'Debito','2028-06-01',120000,18),
(4500000000000019,'Credito','2028-07-01',330000,19),
(4500000000000020,'Debito','2028-08-01',95000,20),
(4500000000000021,'Credito','2028-09-01',250000,21),
(4500000000000022,'Debito','2028-10-01',110000,22),
(4500000000000023,'Credito','2028-11-01',360000,23),
(4500000000000024,'Debito','2028-12-01',100000,24),
(4500000000000025,'Credito','2029-01-01',410000,25),
(4500000000000026,'Debito','2029-02-01',95000,26),
(4500000000000027,'Credito','2029-03-01',230000,27),
(4500000000000028,'Debito','2029-04-01',120000,28),
(4500000000000029,'Credito','2029-05-01',340000,29),
(4500000000000030,'Debito','2029-06-01',100000,30);

-- ingreso datos para la tabla Movimientos

INSERT INTO movimiento (fecha,monto,tipo_movimiento,id_cuenta) VALUES
('2024-01-10',5000,'Deposito',1),
('2024-01-11',2000,'Extraccion',2),
('2024-01-12',7000,'Deposito',3),
('2024-01-13',1500,'Extraccion',4),
('2024-01-14',8000,'Deposito',5),
('2024-01-15',2500,'Extraccion',6),
('2024-01-16',6000,'Deposito',7),
('2024-01-17',1200,'Extraccion',8),
('2024-01-18',4500,'Deposito',9),
('2024-01-19',3000,'Extraccion',10),
('2024-01-20',9000,'Deposito',11),
('2024-01-21',1000,'Extraccion',12),
('2024-01-22',11000,'Deposito',13),
('2024-01-23',2000,'Extraccion',14),
('2024-01-24',7500,'Deposito',15),
('2025-01-05', 12000, 'Transferencia', 3),
('2025-01-07', 8500, 'Transferencia', 5),
('2025-01-10', 15000, 'Transferencia', 7),
('2025-01-12', 6400, 'Transferencia', 9),
('2025-01-15', 9200, 'Transferencia', 11),
('2025-01-18', 13400, 'Transferencia', 14),
('2025-01-20', 7800, 'Transferencia', 17),
('2025-01-22', 9900, 'Transferencia', 21),
('2025-01-25', 5600, 'Transferencia', 24),
('2025-01-28', 14300, 'Transferencia', 28);

-- por ultimo agrego datos en la Tabla Servicios

INSERT INTO servicio 
(tipo_servicio, descripcion, costo, fecha, id_cliente, id_cuenta, id_sucursal, id_empleado) VALUES
('Seguro', 'Seguro de tarjeta premium', 2100, '2025-02-01', 1, 1, 1, 2),
('Mantenimiento', 'Mantenimiento de cuenta corriente', 1600, '2025-02-02', 4, 4, 2, 5),
('Transferencia', 'Transferencia internacional', 2800, '2025-02-03', 6, 6, 3, 8),
('Prestamo', 'Gestion de prestamo personal', 3500, '2025-02-04', 9, 9, 5, 13),
('Seguro', 'Seguro de cuenta bancaria', 1900, '2025-02-05', 12, 12, 6, 16),
('Mantenimiento', 'Mantenimiento mensual', 1500, '2025-02-06', 15, 15, 8, 22),
('Transferencia', 'Transferencia nacional', 1300, '2025-02-07', 18, 18, 9, 25),
('Prestamo', 'Gestion de prestamo hipotecario', 4200, '2025-02-08', 21, 21, 11, 31),
('Seguro', 'Seguro de tarjeta de credito', 2000, '2025-02-09', 25, 25, 13, 38),
('Mantenimiento', 'Mantenimiento de cuenta ahorro', 1500, '2025-02-10', 29, 29, 15, 44),
('Mantenimiento','Mantenimiento mensual',1500,'2024-02-01',1,1,1,1),
('Transferencia','Transferencia internacional',2500,'2024-02-02',2,2,2,2),
('Seguro','Seguro de cuenta',1800,'2024-02-03',3,3,3,3),
('Mantenimiento','Mantenimiento mensual',1500,'2024-02-04',4,4,4,4),
('Prestamo','Gestion de prestamo',3000,'2024-02-05',5,5,5,5),
('Seguro','Seguro de tarjeta',1700,'2024-02-06',6,6,6,6),
('Mantenimiento','Mantenimiento mensual',1500,'2024-02-07',7,7,7,7),
('Transferencia','Transferencia nacional',1200,'2024-02-08',8,8,8,8),
('Seguro','Seguro de cuenta',1800,'2024-02-09',9,9,9,9),
('Mantenimiento','Mantenimiento mensual',1500,'2024-02-10',10,10,10,10),
('Prestamo','Gestion de prestamo',3200,'2024-02-11',11,11,11,11),
('Seguro','Seguro de tarjeta',1700,'2024-02-12',12,12,12,12),
('Transferencia','Transferencia internacional',2600,'2024-02-13',13,13,13,13),
('Mantenimiento','Mantenimiento mensual',1500,'2024-02-14',14,14,14,14),
('Prestamo','Gestion de prestamo',3500,'2024-02-15',15,15,15,15);

