USE lesson_5;

SELECT quartal, grade,
LEAD(grade, 1, 'не данных') OVER(ORDER BY quartal) AS next_grade,
LAG(grade, 1, 'нет данных') OVER(ORDER BY quartal) AS prev_grade
FROM academic_record
WHERE name = 'Петя' AND subject = 'физика';