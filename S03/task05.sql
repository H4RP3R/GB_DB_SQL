USE lesson_3;

SELECT SUM(salary),
CASE 
	WHEN age < 20 THEN "group 1"
	WHEN age BETWEEN 20 AND 40 THEN "group 2"
	WHEN age > 40 THEN "group 3"
	ELSE 'not set'
END AS name_age
FROM staff
GROUP BY name_age;