USE lesson_4;

SELECT u.id, u.firstname, u.lastname, COUNT(fr.target_user_id) AS 'cnt'
FROM users u
LEFT JOIN friend_requests fr ON (u.id = fr.initiator_user_id OR u.id = fr.target_user_id)
AND  fr.status = 'approved'
GROUP BY u.id
ORDER BY u.id;