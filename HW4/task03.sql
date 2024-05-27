USE lesson_4;

SELECT u.id from users u
EXCEPT
SELECT u.id FROM users u
JOIN messages m ON m.from_user_id = u.id;