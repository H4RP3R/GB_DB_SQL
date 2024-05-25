USE lesson_3;

-- 1
SELECT * FROM staff
ORDER BY AGE;

-- 2
SELECT * FROM staff
ORDER BY firstname;

-- 3
SELECT id, firstname, lastname, age  FROM staff
ORDER BY firstname DESC;

-- 4
SELECT * FROM staff
ORDER BY firstname DESC, age DESC;