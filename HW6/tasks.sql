USE lesson_4;

-- 1
-- Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, с помощью которой можно
-- переместить любого (одного) пользователя из таблицы users в таблицу users_old. (использование 
-- транзакции с выбором commit или rollback – обязательно)

DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old LIKE users;

ALTER TABLE users_old
MODIFY COLUMN id BIGINT UNSIGNED NOT NULL UNIQUE;

DROP PROCEDURE IF EXISTS move_user_to_old;
DELIMITER //
CREATE PROCEDURE move_user_to_old(user_id BIGINT)
BEGIN
	DECLARE `_rollback` BIT DEFAULT b'0';
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
 		SET `_rollback` = b'1';
	END;
	
	START TRANSACTION;
	INSERT INTO users_old (id, firstname, lastname, email)
	SELECT id, firstname, lastname, email FROM users u
	WHERE u.id = user_id;
	
	DELETE FROM users u
	WHERE u.id = user_id;
	
	IF `_rollback` THEN
		SELECT 'ROLLBACK';
		ROLLBACK;
	ELSE
		SELECT 'COMMIT';
		COMMIT;
	END IF;	
END //
DELIMITER ;

CALL move_user_to_old(1);


-- 2
-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу
-- "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello(input_time TIME)
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
	DECLARE msg VARCHAR(20);
	
	CASE
		WHEN input_time BETWEEN '06:00:00' AND '11:59:59'
			THEN SET msg = 'Доброе утро';
		WHEN input_time BETWEEN '12:00:00' AND '17:59:59'
			THEN SET msg = 'Добрый день';
		WHEN input_time BETWEEN '18:00:00' AND '23:59:59'
			THEN SET msg = 'Добрый вечер';
		ELSE SET msg = 'Доброй ночи';
	END CASE;
	
	RETURN msg;
	
END //

DELIMITER ;

SELECT hello('06:00:00');
SELECT hello('12:00:00');
SELECT hello('17:59:59');
SELECT hello('18:00:00');
SELECT hello('23:59:59');
SELECT hello('00:00:00');
SELECT hello(CURTIME());






