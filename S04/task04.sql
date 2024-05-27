USE lesson_4;

SELECT u.id, CONCAT(u.firstname, ' ', u.lastname) AS 'пользователь', 
p.hometown AS 'город', m.filename AS 'аватар' 
FROM users u
JOIN profiles p ON p.user_id = u.id
LEFT JOIN media m ON m.id = p.photo_id;