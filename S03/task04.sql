USE lesson_3;

-- 1
SELECT staff_id, SUM(count_pages) FROM activity_staff
GROUP BY staff_id;

-- 2
SELECT date_activity, SUM(count_pages) FROM activity_staff
GROUP BY date_activity;

-- 3
SELECT date_activity, AVG(count_pages) FROM activity_staff
GROUP BY date_activity;
