USE lesson_2;

SELECT id AS 'Номер', title AS 'Название фильма', count_min AS 'Продолжительность',
IF (count_min < 50, 'Короткометражный фильм',
	IF (count_min BETWEEN 50 AND 100, 'Среднеметражный фильм',
		IF (count_min > 100, 'Полнометражный фильм', 'Не определено')
	)
) AS 'Тип'
FROM cinema;
