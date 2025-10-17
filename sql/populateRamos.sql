-- Poblar la tabla de ramos para

-- Ingeniería Informática
INSERT INTO ramos (sigla, nombre, carrera_id, semestre)
VALUES 
('INF1211', 'FUNDAMENTOS DE ALGORITMOS', 1, 'primer semestre'),
('INF1212', 'INTRODUCCION A LA INGENIERIA INFORMATICA', 1, 'primer semestre'),
('INF1413', 'BIENESTAR Y APRENDIZAJE UNIVERSITARIO', 1, 'primer semestre'),
('MAT1001', 'FUNDAMENTOS DE MATEMATICAS PARA INGENIERIA', 1, 'primer semestre'),
('FIN100-14', 'DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA', 1, 'primer semestre'),
('INF1214', 'FUNDAMENTOS DE PROGRAMACION', 1, 'primer semestre'),
('MAT1002', 'CALCULO DIFERENCIAL E INTEGRAL', 1, 'primer semestre'),
('MAT1004', 'ALGEBRA LINEAL', 1, 'primer semestre'),
('FIS1002', 'FISICA PARA INGENIERIA', 1, 'primer semestre'),
('INF2121', 'ESTADISTICA COMPUTACIONAL', 1, 'segundo semestre'),
('INF2223', 'ESTRUCTURA DE DATOS', 1, 'segundo semestre'),
('INF2322', 'HARDWARE Y SISTEMAS OPERATIVOS', 1, 'segundo semestre'),
('INF2235', 'BASE DE DATOS', 1, 'segundo semestre'),
('INF2236', 'PROGRAMACION AVANZADA', 1, 'segundo semestre'),
('INF2237', 'INGENIERIA DE SOFTWARE', 1, 'segundo semestre'),
('INF2324', 'REDES DE COMPUTADORES', 1, 'tercer semestre'),
('ING9001', 'INGLES 1', 1, 'tercer semestre'),
('INF3132', 'ECONOMIA Y FINANZAS', 1, 'tercer semestre'),
('INF3233', 'INTELIGENCIA ARTIFICIAL', 1, 'cuarto semestre'),
('INF3234', 'MODELAMIENTO DE SOFTWARE', 1, 'cuarto semestre'),
('INF3235', 'INGENIERIA DE REQUERIMIENTOS', 1, 'cuarto semestre'),
('ING9002', 'INGLES 2', 1, 'cuarto semestre'),
('INF3136', 'OPTIMIZACION', 1, 'quinto semestre'),
('INF3245', 'INGENIERIA WEB Y MOVIL', 1, 'quinto semestre'),
('INF3246', 'EXPERIENCIA DEL USUARIO', 1, 'quinto semestre'),
('INF3541', 'TALLER DE BASE DE DATOS', 1, 'quinto semestre'),
('ING9003', 'INGLES 3', 1, 'sexto semestre'),
('INF4353', 'CIBERSEGURIDAD', 1, 'sexto semestre'),
('INF4457', 'TECNOLOGIAS EMERGENTES', 1, 'sexto semestre'),
('INF4552', 'TALLER DE INGENIERIA DE SOFTWARE', 1, 'sexto semestre'),
('INF4556', 'SEMINARIO DE TITULO', 1, 'séptimo semestre'),
('ING9004', 'INGLES 4', 1, 'séptimo semestre'),
('INF4458', 'NEGOCIOS, INNOVACION Y EMPRENDIMIENTO', 1, 'séptimo semestre'),
('INF4459', 'LEGISLACION, ETICA Y TECNOLOGIA', 1, 'séptimo semestre'),
('INF4560', 'PROYECTO DE TITULO', 1, 'octavo semestre');

-- Ramos Ingenieria civil informatica
INSERT INTO ramos (sigla, nombre, carrera_id, semestre)
VALUES 
('ICI1241', 'Fundamentos de algoritmos', 2, 'primer semestre'),
('ICI1243', 'Introducción a la ingeniería informática', 2, 'primer semestre'),
('ICI1458', 'Bienestar y aprendizaje universitario', 2, 'primer semestre'),
('MAT1001', 'Fundamentos de matemáticas para ingeniería', 2, 'primer semestre'),
('FIN100-14', 'Desarrollo integral y comunicación para ingeniería', 2, 'primer semestre'),
('ICI1242', 'Fundamentos de programación', 2, 'primer semestre'),
('MAT1002', 'Cálculo diferencial e integral', 2, 'primer semestre'),
('MAT1004', 'Álgebra lineal', 2, 'primer semestre'),
('FIS1002', 'Física para ingeniería', 2, 'primer semestre'),
('ICI2145', 'Análisis inteligente de datos', 2, 'segundo semestre'),
('ICI2240', 'Estructura de datos', 2, 'segundo semestre'),
('MAT1003', 'Cálculo en varias variables', 2, 'segundo semestre'),
('FIS2120', 'Física electromagnetismo', 2, 'segundo semestre'),
('ICI2141', 'Métodos numéricos', 2, 'segundo semestre'),
('ICI2241', 'Programación avanzada', 2, 'primer semestre'),
('ICI2242', 'Análisis y diseño de algoritmos', 2, 'primer semestre'),
('ING9001', 'Inglés 1', 2, 'primer semestre'),
('FIS3149', 'Física moderna', 2, 'primer semestre'),
('ICI3240', 'Base de datos', 2, 'primer semestre'),
('ICI3244', 'Inteligencia artificial', 2, 'segundo semestre'),
('ICI3245', 'Autómatas y compiladores', 2, 'segundo semestre'),
('ICI3344', 'Hardware y sistemas operativos', 2, 'segundo semestre'),
('ING9002', 'Inglés 2', 2, 'segundo semestre'),
('ICA4121', 'Administración de empresas', 2, 'segundo semestre'),
('ICI3150', 'Ciencia y tecnología', 2, 'segundo semestre'),
('ICI3170', 'Estadística computacional', 2, 'segundo semestre'),
('ICI3246', 'Modelamiento de software', 2, 'primer semestre'),
('ICI3343', 'Redes de computadores', 2, 'primer semestre'),
('ING9003', 'Inglés 3', 2, 'primer semestre'),
('ICI4150', 'Robótica y sistemas autónomos', 2, 'segundo semestre'),
('ICI4151', 'Optimización', 2, 'segundo semestre'),
('ICI4244', 'Ingeniería de software', 2, 'segundo semestre'),
('ICI4247', 'Ingeniería web y móvil', 2, 'primer semestre'),
('ICI4344', 'Computación paralela y distribuida', 2, 'primer semestre'),
('ING9004', 'Inglés 4', 2, 'segundo semestre'),
('ICA4161', 'Economía y finanzas', 2, 'primer semestre'),
('ICI4248', 'Ingeniería de requerimientos', 2, 'segundo semestre'),
('ICI4370', 'Ciberseguridad', 2, 'segundo semestre'),
('ICI4541', 'Taller de base de datos', 2, 'segundo semestre'),
('ICI5247', 'Experiencia de usuario', 2, 'segundo semestre'),
('ICI5441', 'Administración de proyectos informáticos', 2, 'segundo semestre'),
('ICI5442', 'Tecnologías emergentes', 2, 'segundo semestre'),
('ICI5475', 'Negocios, innovación y emprendimiento', 2, 'segundo semestre'),
('ICI5545', 'Taller de ingeniería de software', 2, 'segundo semestre'),
('ICI5345', 'Legislación ética y tecnológica', 2, 'segundo semestre'),
('ICI5444', 'Taller de formulación de proyectos informáticos', 2, 'segundo semestre'),
('ICI5476', 'Taller de liderazgo y trabajo en equipo', 2, 'segundo semestre'),
('ICI5541', 'Seminario de título', 2, 'segundo semestre'),
('ICI6541', 'Proyecto de título', 2, 'segundo semestre');

-- Ramos Ingeniería Civil en Ciencia de Datos 
INSERT INTO ramos (sigla, nombre, carrera_id, semestre)
VALUES 
('ICD1140', 'INTRODUCCION A LA INGENIERIA EN CIENCIA DE DATOS', 3, 'primer semestre'),
('ICD1341', 'FUNDAMENTOS DE ALGORITMOS', 3, 'primer semestre'),
('ICD1401', 'BIENESTAR Y APRENDIZAJE UNIVERSITARIO', 3, 'primer semestre'),
('MAT1001', 'FUNDAMENTOS DE MATEMATICAS PARA INGENIERIA', 3, 'primer semestre'),
('FIN100-14', 'DESARROLLO INTEGRAL Y COMUNICACION PARA INGENIERIA', 3, 'primer semestre'),
('ICD1342', 'FUNDAMENTOS DE PROGRAMACION', 3, 'primer semestre'),
('MAT1002', 'CALCULO DIFERENCIAL E INTEGRAL', 3, 'primer semestre'),
('MAT1004', 'ALGEBRA LINEAL', 3, 'primer semestre'),
('FIS1002', 'FISICA PARA INGENIERIA', 3, 'primer semestre'),
('ICD2243', 'INTRODUCCION AL ANALISIS DE DATOS', 3, 'segundo semestre'),
('ICD2344', 'ESTRUCTURA DE DATOS', 3, 'segundo semestre'),
('MAT1003', 'CALCULO EN VARIAS VARIABLES', 3, 'segundo semestre'),
('FIS2120', 'FISICA ELECTROMAGNETISMO', 3, 'segundo semestre'),
('ICD2145', 'CIENCIA Y TECNOLOGIA', 3, 'segundo semestre'),
('ICD2346', 'PARADIGMAS DE PROGRAMACION', 3, 'primer semestre'),
('ICD2347', 'ANALISIS Y DISEÑO DE ALGORITMOS', 3, 'primer semestre'),
('ING9001', 'INGLES 1', 3, 'primer semestre'),
('MAT3105', 'ECUACIONES DIFERENCIALES', 3, 'primer semestre'),
('FIS3149', 'FISICA MODERNA', 3, 'primer semestre'),
('ICD3148', 'ESTADISTICA COMPUTACIONAL', 3, 'segundo semestre'),
('ICD3149', 'TEORIA DE SISTEMAS', 3, 'segundo semestre'),
('ICD3350', 'BASE DE DATOS', 3, 'segundo semestre'),
('ING9002', 'INGLES 2', 3, 'segundo semestre'),
('ICD3151', 'METODOS NUMERICOS', 3, 'primer semestre'),
('ICD3152', 'ESTADISTICA AVANZADA', 3, 'primer semestre'),
('ICD3153', 'INTELIGENCIA ARTIFICIAL', 3, 'primer semestre'),
('ICD3255', 'ANALISIS INTELIGENTE DE DATOS', 3, 'primer semestre'),
('ICD3354', 'HARDWARE Y SISTEMAS OPERATIVOS', 3, 'primer semestre'),
('ING9003', 'INGLES 3', 3, 'primer semestre'),
('ICA2121', 'ADMINISTRACION DE EMPRESAS', 3, 'segundo semestre'),
('ICD4156', 'OPTIMIZACION 1', 3, 'segundo semestre'),
('ICD4157', 'ANALISIS DE SERIES DE TIEMPO', 3, 'segundo semestre'),
('ICD4258', 'APRENDIZAJE AUTOMATICO 1', 3, 'primer semestre'),
('ICD4359', 'ALMACENAMIENTO Y RECUPERACION DE DATOS', 3, 'primer semestre'),
('ING9004', 'INGLES 4', 3, 'primer semestre'),
('ICD4160', 'OPTIMIZACION 2', 3, 'primer semestre'),
('ICD4262', 'APRENDIZAJE AUTOMATICO 2', 3, 'segundo semestre'),
('ICD4363', 'REDES DE COMPUTADORES', 3, 'segundo semestre'),
('ICD4461', 'METODOLOGIA DE DESARROLLO DE SOFTWARE', 3, 'segundo semestre'),
('ICA5164', 'ECONOMIA Y FINANZAS', 3, 'segundo semestre'),
('ICD5167', 'CIENCIA DE REDES', 3, 'primer semestre'),
('ICD5366', 'COMPUTACION PARALELA Y DISTRIBUIDA', 3, 'primer semestre'),
('ICD5465', 'VISUALIZACION DE DATOS', 3, 'primer semestre'),
('ICD5468', 'TALLER DE LIDERAZGO Y TRABAJO EN EQUIPO', 3, 'primer semestre'),
('ICD5369', 'BIG DATA', 3, 'segundo semestre'),
('ICD5471', 'NEGOCIOS, INNOVACION Y EMPRENDIMIENTO', 3, 'segundo semestre'),
('ICD5570', 'SEMINARIO DE TITULO', 3, 'segundo semestre'),
('ICD6473', 'PRIVACIDAD, ETICA Y SEGURIDAD', 3, 'segundo semestre'),
('ICD6572', 'PROYECTO DE TITULO', 3, 'segundo semestre');



SELECT * FROM ramos;

-- Para actualizar nombres, arreglar la sintaxis
UPDATE ramos
SET nombre = INITCAP(LOWER(nombre))
WHERE nombre = UPPER(nombre);

SELECT * FROM ramos;

-- Se eliminaron los ramos que no son de carrera y se agruparon los ramos por semestre par en impar
UPDATE ramos
SET semestre = CASE
    WHEN semestre ILIKE '%primer%' OR semestre ILIKE '%tercer%' OR semestre ILIKE '%quinto%' OR semestre ILIKE '%séptimo%' THEN 'primer semestre'
    WHEN semestre ILIKE '%segundo%' OR semestre ILIKE '%cuarto%' OR semestre ILIKE '%sexto%' OR semestre ILIKE '%octavo%' THEN 'segundo semestre'
    ELSE semestre -- Mantener los valores que no coinciden, si existieran (opcional)
END;


SELECT * FROM ramos;