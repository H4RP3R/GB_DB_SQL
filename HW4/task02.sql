USE lesson_4;

SELECT
CASE
	WHEN p.gender = 'f' THEN 'женский'
	WHEN p.gender = 'm' THEN 'мужской'
END,
COUNT(*) AS likes FROM likes l
JOIN profiles p ON p.user_id = l.user_id
GROUP BY p.gender
ORDER BY likes DESC ;