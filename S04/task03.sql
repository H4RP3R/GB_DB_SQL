USE lesson_4;

-- ID друзей, заявку которых я подтвердил
SELECT initiator_user_id AS id FROM friend_requests 
WHERE target_user_id = 1 AND status='approved' 
UNION
-- ID друзей, подтвердивших мою заявку
SELECT target_user_id FROM friend_requests 
WHERE initiator_user_id = 1 AND status='approved';