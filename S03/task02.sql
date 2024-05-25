USE lesson_3;


-- 1
SELECT DISTINCT firstname FROM staff;

-- 2
SELECT * FROM  staff
ORDER BY id 
LIMIT 2;

-- 3
SELECT * FROM  staff
ORDER BY id 
LIMIT 4, 3;

-- 4
SELECT * FROM staff
ORDER BY id DESC 
LIMIT 2, 3;
