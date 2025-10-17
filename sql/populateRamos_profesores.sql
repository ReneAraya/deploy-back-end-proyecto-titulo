-- Poblar la tabla ramos_profesores

INSERT INTO ramos_profesores (profesor_id, ramo_id)
VALUES
(1, 36), -- Broderick Crawford Labrín - ICI1241
(1, 54), -- Broderick Crawford Labrín - ICI3240
(1, 62), -- Broderick Crawford Labrín - ICI3246
(2, 15), -- Iván Mercado Bermúdez - INF2237
(2, 23), -- Iván Mercado Bermúdez - INF3136
(2, 24), -- Iván Mercado Bermúdez - INF3245
(3, 41), -- Wenceslao Palma Muñoz - ICI1242
(3, 50), -- Wenceslao Palma Muñoz - ICI2241
(3, 67), -- Wenceslao Palma Muñoz - ICI4244
(4, 37), -- Guillermo Cabrera Guerrero - ICI1243
(4, 67), -- Guillermo Cabrera Guerrero - ICI4244
(5, 63), -- Nibaldo Rodríguez Agurto - ICI3343
(5, 57), -- Nibaldo Rodríguez Agurto - ICI3344
(5, 78), -- Nibaldo Rodríguez Agurto - ICI5475
(6, 110), -- Cristian Rusu - ICD3153
(6, 111), -- Cristian Rusu - ICD3255
(7, 19), -- Silvana Roncagliolo De La Horra - INF3233
(7, 55), -- Silvana Roncagliolo De La Horra - ICI3244
(8, 73), -- Claudio Cubillos Figueroa - ICI4370
(8, 74), -- Claudio Cubillos Figueroa - ICI4541
(9, 62), -- Pamela Hermosilla Monckton - ICI3246
(9, 45), -- Pamela Hermosilla Monckton - ICI2145
(10, 41), -- Héctor Allende Cid - ICI1242
(11, 46), -- Ignacio Araya Zamorano - ICI2240
(12, 72), -- Daniela Quiñones Otey - ICI4248
(12, 76), -- Daniela Quiñones Otey - ICI5441
(13, 131), -- Leslie Pérez Cáceres - ICD5570
(14, 60), -- Rodrigo Alfaro Arancibia - ICI3150
(14, 66), -- Rodrigo Alfaro Arancibia - ICI4151
(15, 15), -- Sandra Cano Mazuera - INF2237
(15, 16), -- Sandra Cano Mazuera - INF2324
(16, 87), -- Emanuel Enrique Vega Mena - ICD1401
(18, 117), -- Aldo Migliaro Osorio - ICD4258
(18, 118), -- Aldo Migliaro Osorio - ICD4359
(19, 33), -- Ricardo Soto De Giorgis - INF4458
(19, 35); -- Ricardo Soto De Giorgis - INF4560

SELECT * FROM ramos_profesores

DROP TABLE IF EXISTS ramos_profesores;

//Nueva tabla de relacion profesores y ramos, añadiendo el tipo de usuario
-- Relación entre profesores y ramos por carrera
CREATE TABLE profesores_ramos (
    id SERIAL PRIMARY KEY,
    profesor_id INTEGER NOT NULL,
    ramo_id INTEGER NOT NULL,
    carrera_id INTEGER NOT NULL,
    FOREIGN KEY (profesor_id) REFERENCES usuarios(id),
    FOREIGN KEY (ramo_id) REFERENCES ramos(id),
    FOREIGN KEY (carrera_id) REFERENCES carreras(id),
    UNIQUE (profesor_id, ramo_id, carrera_id)
);
SELECT * FROM profesores_ramos;

/* Verificar la relacion entre los profesores y los ramos que imparten
SELECT rp.profesor_id, p.nombre AS profesor_nombre, p.correo, rp.ramo_id, r.sigla, r.nombre AS ramo_nombre
FROM ramos_profesores rp
JOIN profesores p ON rp.profesor_id = p.id
JOIN ramos r ON rp.ramo_id = r.id;

*/