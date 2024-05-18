USE lesson_1;
-- 1
SELECT *
FROM workers
WHERE salary > 6000;
-- 2
SELECT *
FROM workers
WHERE dept = 'IT';
-- 3
SELECT *
FROM workers
WHERE NOT dept = 'IT';