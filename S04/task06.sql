USE lesson_4;

SELECT m.id, m.filename  AS 'media', mt.name_type as 'type'
FROM media m
LEFT JOIN media_types mt ON mt.id = m.media_type_id ;