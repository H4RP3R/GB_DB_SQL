USE lesson_4;

SELECT CONCAT(u.firstname, ' ', u.lastname) AS 'owner', m.filename,
(SELECT COUNT(*) from likes l WHERE l.media_id = m.id) AS likes
FROM users u
JOIN media m ON u.id = m.user_id
ORDER BY m.id;  


SELECT 
 m.id,
 m.filename AS 'медиа',
 CONCAT(u.firstname, ' ', u.lastname) AS 'владелец медиа',
 COUNT(l.id) AS 'кол-во лайков'
FROM media m
LEFT JOIN likes l ON l.media_id = m.id
JOIN users u ON u.id = m.user_id
GROUP BY m.id
ORDER BY m.id;