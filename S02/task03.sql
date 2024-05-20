ALTER TABLE cinema
ADD COLUMN age_category CHAR(1);

UPDATE cinema SET age_category='П' WHERE id=1;
UPDATE cinema SET age_category='Д' WHERE id=4;
UPDATE cinema SET age_category='В' WHERE id=5;

SELECT  id AS 'Номер', title AS 'Название',
CASE
	WHEN age_category = 'Д'
		THEN 'Детская'
	WHEN age_category = 'П'
		THEN 'Подростковая'
	WHEN age_category = 'В'
		THEN 'Взрослая'
	ELSE 'Не указана'
END AS 'Категория'
FROM cinema;
