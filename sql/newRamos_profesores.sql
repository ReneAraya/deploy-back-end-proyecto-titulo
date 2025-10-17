DROP TABLE IF EXISTS ramos_profesores;
CREATE TABLE ramos_profesores (
    id SERIAL PRIMARY KEY,
    ramo_id INT REFERENCES ramos(id) ON DELETE CASCADE,
    profesor_id INT REFERENCES profesores(id) ON DELETE CASCADE,
    carrera_id INT REFERENCES carreras(id) ON DELETE CASCADE
);
