USE lesson_4;

-- V1
SELECT
DENSE_RANK() OVER (ORDER BY msg_count DESC) AS 'rank_message',
firstname, lastname, IFNULL(msg_count, 0) AS 'cnt'
FROM
(SELECT from_user_id, COUNT(*) AS msg_count
FROM messages
GROUP BY from_user_id) AS mc
RIGHT JOIN users u ON u.id = mc.from_user_id;

-- V2
SELECT
DENSE_RANK() OVER (ORDER BY IFNULL(msg_count, 0) DESC) AS 'rank_message',
u.firstname, u.lastname, IFNULL(msg_count, 0) AS 'cnt'
FROM users u
LEFT JOIN
(SELECT from_user_id, COUNT(*) AS msg_count
FROM messages
GROUP BY from_user_id) AS mc ON u.id = mc.from_user_id
ORDER BY 'rank_message';