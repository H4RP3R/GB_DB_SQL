USE lesson_2;

UPDATE cinema SET count_min = 88 WHERE id=2;
UPDATE cinema SET count_min = NULL WHERE id=3;
UPDATE cinema SET count_min = 34 WHERE id=4;

SELECT id AS 'Номер', title AS 'Название', count_min AS 'Продолжительность',
CASE
	WHEN count_min < 50
		THEN 'Короткометражный фильм'
	WHEN count_min BETWEEN 50 AND 100
		THEN 'Среднеметражный фильм'
	WHEN count_min > 100
		THEN 'Полнометражный фильм'
	ELSE 'Не определено'
END AS 'Тип'
FROM cinema;