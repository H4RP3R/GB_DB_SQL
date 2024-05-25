USE lesson_3;

-- 1
SELECT COUNT(*) FROM staff
WHERE post = 'Рабочий';

-- 2
SELECT SUM(salary) FROM staff
WHERE post = 'Начальник';

-- 3
SELECT AVG(age) FROM staff
WHERE salary > 30000;

-- 4
SELECT MAX(salary), MIN(salary) FROM staff;