DELETE FROM carreras;

ALTER SEQUENCE carreras_id_seq RESTART WITH 1;

INSERT INTO carreras (nombre, codigo) VALUES ('Ingeniería Informática', 'INF');
INSERT INTO carreras (nombre, codigo) VALUES ('Ingeniería Civil Informática', 'ICI');
INSERT INTO carreras (nombre, codigo) VALUES ('Ingeniería Civil en Ciencia de Datos', 'ICD');

ALTER TABLE carreras ALTER COLUMN codigo TYPE varchar(5);

SELECT * FROM carreras;