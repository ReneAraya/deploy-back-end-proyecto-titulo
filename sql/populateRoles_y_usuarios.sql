-- Inserta los roles en la tabla roles
INSERT INTO roles (id, nombre) VALUES
(1, 'administrador'),
(2, 'profesor');

-- Inserta los profesores en la tabla usuarios, generando una contraseña basada en el correo.
-- Se asume que el rol de 'profesor' tiene rol_id = 2

INSERT INTO usuarios (nombre, email, contrasena, rol_id)
SELECT 
    nombre,
    correo,
    CONCAT(SUBSTRING(correo FROM 1 FOR POSITION('@' IN correo) - 1), id::TEXT) AS contrasena,
    2 AS rol_id
FROM profesores;

-- Confirmar si el rol de profesor tiene rol_id = 2 o actualizar el valor según corresponda.


SELECT * FROM usuarios;