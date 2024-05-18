USE lesson_1;
-- 1
SELECT *
FROM students;
-- 2
SELECT *
FROM students
WHERE name_student = 'Антон';
-- 3
SELECT name_student,
    email
FROM students;
-- 4
SELECT *
FROM students
WHERE name_student LIKE 'А%';