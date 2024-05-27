USE lesson_4;

SELECT filename FROM media
WHERE user_id = 
(SELECT id FROM users WHERE email = 'arlo50@example.org')
AND media_type_id = 
(SELECT id FROM media_types WHERE name_type = 'Photo');