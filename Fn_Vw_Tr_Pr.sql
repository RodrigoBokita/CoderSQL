-- FUNCIONES

DELIMITER //

CREATE FUNCTION fn_imp_transf_int (costo DECIMAL(10,2), tipo VARCHAR(100))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    IF tipo = 'Transferencia Internacional' THEN
        SET total = costo + (costo * 0.20);
    ELSE
        SET total = costo;
    END IF;

    RETURN total;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION fn_retencion_iva_cc (monto DECIMAL (10,2), tipo_cuenta VARCHAR (100))
RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
	DECLARE monto_final DECIMAL (10,2);
    
	IF tipo_cuenta = 'Cuenta Corriente' THEN
		SET monto_final = (monto * 0.21);
	ELSE
		SET monto_final = 0;
	END IF;
    
    RETURN monto_final;
    
    END //

DELIMITER ;


-- VISTAS QUE INCLUYEN LAS FUNCIONES

CREATE OR REPLACE VIEW vw_transferencias_clientes AS
SELECT c.tipo_servicio,
c.descripcion,
c.costo,
fn_imp_transf_int (costo, descripcion) AS costo_con_impuesto,
c.fecha,
c.id_cliente,
d.nombre,
d.apellido,
d.email
FROM servicio AS c
JOIN cliente AS d USING (id_cliente)
WHERE descripcion LIKE '%Transferencia%';

SELECT * FROM vw_transferencias_clientes;

-- FIN 

CREATE OR REPLACE VIEW vw_retenciones_x_extraccion AS
SELECT c.*,
fn_retencion_iva_cc (monto, tipo_cuenta) AS valor_retencion,
b.tipo_cuenta,
q.nombre,
q.apellido,
q.email
FROM movimiento AS c
JOIN cuenta AS b ON c.id_cuenta = b.id_cuenta
JOIN cliente_cuenta AS a ON b.id_cuenta = a.id_cuenta
JOIN cliente AS q USING (id_cliente)
WHERE c.tipo_movimiento = 'Extraccion';

SELECT * FROM vw_retenciones_x_extraccion;

-- FIN 

-- TRIGGERS 

CREATE TABLE IF NOT EXISTS aviso_cliente (
id_aviso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_cliente INT,
mensaje VARCHAR (300),
fecha DATETIME,
FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

DELIMITER //

CREATE TRIGGER tr_aviso_transf_int
AFTER INSERT ON servicio
FOR EACH ROW
BEGIN

IF NEW.tipo_servicio = 'Transferencia Internacional' THEN 
INSERT INTO aviso_cliente (id_cliente, mensaje, fecha)
VALUES (NEW.id_cliente, 'Se aplico un recargo del 20% por transferencia internacional', NOW ()
);

END IF;

END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER tr_control_descubierto
BEFORE UPDATE ON cuenta
FOR EACH ROW
BEGIN

IF NEW.saldo < 0 AND NEW.saldo >= -2000 THEN
	SET NEW.saldo = 0;
END IF;

END //

DELIMITER ;


-- PROCEDIMIENTOS

DELIMITER //

CREATE PROCEDURE aumento_cajero()
BEGIN

UPDATE empleado
	SET sueldo = sueldo * 1.10
WHERE cargo = 'Cajero';

END //

CREATE PROCEDURE clientes_por_sucursal (
IN sucursalID INT)
BEGIN

SELECT nombre, apellido, email
FROM cliente
WHERE id_sucursal = sucursalID;

END //

DELIMITER ;

CALL clientes_por_sucursal (); -- INGRESAR EL NUMERO DE SUCURSAL (VA DEL 1 AL 15)
CALL aumento_cajero (); -- APLICAR AUTOMATICAMENTE A TODOS LOS CAJEROS, LUEGO CORROBORAR CON LA TABLA EMPLEADOS

SELECT * FROM empleado
WHERE cargo LIKE 'Cajero';
