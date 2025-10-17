-- Crear la columna form_id en la tabla respuestas_formularios_ramos
ALTER TABLE respuestas_formularios_ramos
ADD COLUMN form_id VARCHAR;

-- Actualizar la columna form_id extrayendo el formId desde la columna formulario_url
UPDATE respuestas_formularios_ramos
SET form_id = regexp_replace(formulario_url, '^.*?/d/([a-zA-Z0-9_-]+).*$'::text, '\1'::text);



SELECT * FROM respuestas_formularios_ramos;