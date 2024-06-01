USE lesson_5;

SELECT name,
AVG(grade) OVER (PARTITION BY name) AS avg_grade,
MIN(grade) OVER (PARTITION BY name) AS min_grade,
MAX(grade) OVER (PARTITION BY name) AS max_grade,
SUM(grade) OVER (PARTITION BY name) AS sum_grade,
COUNT(grade) OVER (PARTITION BY name) AS count_grade
FROM academic_record;