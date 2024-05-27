USE lesson_4;

SELECT COUNT(*) FROM likes l
JOIN media m ON m.id = l.media_id 
AND m.user_id IN
(SELECT user_id  FROM profiles p WHERE p.gender = 'f');

