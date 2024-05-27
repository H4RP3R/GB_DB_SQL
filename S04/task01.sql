USE lesson_4;

SELECT id, CONCAT(firstname, ' ', lastname) AS 'пользователь',
(SELECT hometown FROM profiles
WHERE user_id = users.id) AS 'город',
(SELECT filename FROM media WHERE id =
(SELECT photo_id FROM profiles
WHERE user_id = users.id)) AS 'аватар'
FROM users;
