USE lesson_5;

-- Ранжирование
-- Вывести всех сотрудников и указать место в рейтинге по зарплате
SELECT DENSE_RANK() OVER(ORDER BY salary DESC) AS rank_salary,
CONCAT(firstname, ' ', lastname), post, salary 
FROM staff;

-- место в рейтинге по зарплатам по каждой должности
SELECT DENSE_RANK() OVER(PARTITION BY post ORDER BY salary DESC) AS rank_salary,
CONCAT(firstname, ' ', lastname), post, salary 
FROM staff;

-- самые высокооплачиваемые сотрудники по каждой должности
SELECT name, post, salary FROM
(SELECT DENSE_RANK() OVER(PARTITION BY post ORDER BY salary DESC) AS rank_salary,
CONCAT(firstname, ' ', lastname) AS name, post, salary 
FROM staff) AS list
WHERE rank_salary = 1
ORDER BY salary DESC;

-- все сотрудники с сортировкой по зарплате в порядке убывания + на сколько процентов
-- зарплата меньше чем у сотрудника со следующей ЗП
SELECT id, CONCAT(firstname, ' ', lastname) AS staff, post, salary,
LEAD(salary, 1, 0) OVER(ORDER BY salary DESC) AS last_sarary,
ROUND((salary-LEAD(salary, 1, 0) OVER(ORDER BY salary DESC))*100/salary)
AS diff_percent
FROM staff;

-- Вывести всех сотрудников, сгруппировав по должностям и рассчитать:
-- общую сумму зарплат для каждой должности
-- процентное соотношение каждой зарплаты от общей суммы по должности
-- среднюю зарплату по каждой должности
-- процентное соотношение каждой зарплаты к средней зарплате по должности
-- Вывести список всех сотрудников и указать место в рейтинге по зарплатам, но по
-- каждой должности
SELECT id, CONCAT(firstname, ' ', lastname) AS staff, post, salary,
SUM(salary) OVER w AS sum_salary,
ROUND(salary*100/SUM(salary) OVER w) AS percent_sum,
AVG(salary) OVER w AS avg_salary,
ROUND(salary*100/AVG(salary) OVER w) AS percent_avg
FROM staff
WINDOW w AS (PARTITION BY post);

-- получение друзей пользователя с id=1 из базы lesson_4
-- ID заявку которых подтвердили
SELECT initiator_user_id AS friend_id FROM lesson_4.friend_requests
WHERE target_user_id = 1 AND status = 'approved'
UNION
-- ID друзей подтвердивших заявку
SELECT target_user_id FROM lesson_4.friend_requests
WHERE initiator_user_id = 1 AND status = 'approved';

-- временная таблица
DROP TABLE IF EXISTS tmp_friends;
CREATE TEMPORARY TABLE tmp_friends
SELECT initiator_user_id AS user_id , target_user_id AS friend_id FROM lesson_4.friend_requests
WHERE status = 'approved'
UNION 
SELECT target_user_id, initiator_user_id FROM lesson_4.friend_requests
WHERE status = 'approved';

SELECT * FROM tmp_friends;

-- общее табличное выражение
WITH friends AS
(SELECT initiator_user_id AS user_id, target_user_id AS friend_id
FROM lesson_4.friend_requests
WHERE status = 'approved'
UNION
SELECT target_user_id, initiator_user_id from lesson_4.friend_requests
WHERE status = 'approved')
SELECT friend_id FROM friends
WHERE user_id=1;

-- представления
 CREATE OR REPLACE VIEW v_friends AS
 (SELECT initiator_user_id AS user_id, target_user_id AS friend_id
 FROM lesson_4.friend_requests
 WHERE status = 'approved'
 UNION
 SELECT target_user_id, initiator_user_id FROM lesson_4.friend_requests
 WHERE status = 'approved');

SELECT friend_id FROM v_friends WHERE user_id = 1;
