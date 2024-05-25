SELECT post, SUM(salary) AS total_salary
FROM staff
GROUP BY post;
