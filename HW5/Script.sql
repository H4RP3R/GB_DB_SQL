USE lesson_4;

SELECT id, created_at,
LEAD(created_at) OVER w AS next_msg_time,
TIME_TO_SEC(TIMEDIFF(LEAD(created_at) OVER w, created_at))/60 AS diff_min
FROM messages
WINDOW w AS (ORDER BY created_at);