USE lesson_3;

-- 1
SELECT staff_id FROM activity_staff
GROUP BY staff_id
HAVING SUM(count_pages) > 500;

-- 2
SELECT date_activity, COUNT(staff_id) AS cnt FROM activity_staff
GROUP BY date_activity
HAVING COUNT(*) > 3;

-- 3
SELECT post FROM staff
GROUP BY post
HAVING AVG(salary) > 30000;