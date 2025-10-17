DELETE FROM formularios
WHERE ramo_id IN (SELECT id FROM ramos WHERE sigla LIKE 'FIS%'); //cambiar FIS por la sigla del ramo que eliminar

DELETE FROM respuestas_formularios_ramos
WHERE ramo_id IN (SELECT id FROM ramos WHERE sigla LIKE 'FIS%'); //cambiar FIS por la sigla del ramo que eliminar

DELETE FROM estado_oferta
WHERE ramo_id IN (SELECT id FROM ramos WHERE sigla LIKE 'FIS%'); //cambiar FIS por la sigla del ramo que eliminar

DELETE FROM ramos
WHERE sigla LIKE 'FIS%'; //cambiar FIS por la sigla del ramo que eliminar


SELECT * FROM ramos;
/*SELECT * FROM respuestas_formularios_ramos;*/
/*SELECT * FROM estado_oferta;*/