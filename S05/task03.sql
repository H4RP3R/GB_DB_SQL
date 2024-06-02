USE lesson_4;

-- 1
CREATE OR REPLACE VIEW v_msg AS
SELECT id, body, created_at
FROM messages
WHERE from_user_id = 1 OR to_user_id = 1;

SELECT * FROM v_msg;

-- 2
CREATE OR REPLACE VIEW v_friends_friends AS
WITH friends AS (
	SELECT initiator_user_id AS id
	FROM lesson_4.friend_requests WHERE status = 'approved' AND target_user_id = 1
	UNION
	SELECT target_user_id AS id
	FROM lesson_4.friend_requests WHERE status = 'approved' AND initiator_user_id = 1
)
SELECT fr.initiator_user_id AS friend_id
FROM friends f JOIN lesson_4.friend_requests fr ON fr.target_user_id = f.id
WHERE fr.initiator_user_id != 1 AND fr.status = 'approved'
UNION
SELECT fr.target_user_id
FROM friends f JOIN lesson_4.friend_requests fr ON fr.initiator_user_id = f.id
WHERE fr.target_user_id != 1 AND status = 'approved';

-- 3
SELECT fr.initiator_user_id AS friend_id
FROM v_friends f
JOIN lesson_4.friend_requests fr ON fr.target_user_id = f.friend_id
WHERE fr.initiator_user_id != 1 AND f.user_id=1 AND fr.status =
'approved'
UNION
SELECT fr.target_user_id
FROM v_friends f
JOIN lesson_4.friend_requests fr ON fr.initiator_user_id = f.friend_id
WHERE fr.target_user_id != 1 AND f.user_id=1 AND status = 'approved';