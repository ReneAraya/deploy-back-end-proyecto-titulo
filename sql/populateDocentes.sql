INSERT INTO profesores (nombre, correo)
VALUES
('Broderick Crawford Labrín', 'broderick.crawford@pucv.cl'),
('Iván Mercado Bermúdez', 'ivan.mercado@pucv.cl'),
('Wenceslao Palma Muñoz', 'wenceslao.palma@pucv.cl'),
('Guillermo Cabrera Guerrero', 'guillermo.cabrera@pucv.cl'),
('Nibaldo Rodríguez Agurto', 'nibaldo.rodriguez@pucv.cl'),
('Cristian Rusu', 'cristian.rusu@pucv.cl'),
('Silvana Roncagliolo De La Horra', 'silvana.roncagliolo@pucv.cl'),
('Claudio Cubillos Figueroa', 'claudio.cubillos@pucv.cl'),
('Pamela Hermosilla Monckton', 'pamela.hermosilla@pucv.cl'),
('Héctor Allende Cid', 'hector.allende@pucv.cl'),
('Ignacio Araya Zamorano', 'ignacio.araya@pucv.cl'),
('Daniela Quiñones Otey', 'daniela.quinones@pucv.cl'),
('Leslie Pérez Cáceres', 'leslie.perez@pucv.cl'),
('Rodrigo Alfaro Arancibia', 'rodrigo.alfaro@pucv.cl'),
('Sandra Cano Mazuera', 'sandra.cano@pucv.cl'),
('Emanuel Enrique Vega Mena', 'emanuel.vega@pucv.cl'),
('Christoffer Löffler', 'christoffer.loffler@pucv.cl'),
('Aldo Migliaro Osorio', 'amigliar@inf.ucv.cl'),
('Ricardo Soto De Giorgis', 'ricardo.soto@pucv.cl');

/*ALTER SEQUENCE profesores_id_seq RESTART WITH 1;*/ /*para reiniciar el conteo de ID,
recuerda que debes borrar los datos de la tabla para realizar esta operacion correctamente*/


SELECT * FROM profesores;