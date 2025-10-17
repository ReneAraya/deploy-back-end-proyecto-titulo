CREATE TABLE carreras (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE ramos (
  id SERIAL PRIMARY KEY,
  sigla VARCHAR(20) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  carrera_id INTEGER REFERENCES carreras(id),
  semestre VARCHAR(50) NOT NULL
);

CREATE TABLE profesores (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE ramos_profesores (
  id SERIAL PRIMARY KEY,
  ramo_id INTEGER REFERENCES ramos(id),
  profesor_id INTEGER REFERENCES profesores(id)
);

CREATE TABLE formularios (
  id SERIAL PRIMARY KEY,
  ramo_id INTEGER REFERENCES ramos(id),
  link VARCHAR(255) NOT NULL
);

CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  rol VARCHAR(50) NOT NULL CHECK (rol IN ('admin', 'profesor'))
);
SELECT * FROM usuarios;

-- Tabla para gestionar los roles de usuario
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);
SELECT * FROM roles;

