USE lesson_4;

DROP FUNCTION IF EXISTS popularity_coefficient;
DELIMITER //
CREATE FUNCTION popularity_coefficient(check_user_id BIGINT)
RETURNS FLOAT READS SQL DATA
BEGIN
	DECLARE requests_to_user INT;
	DECLARE requests_from_user INT;
	
	SET requests_to_user = (
	SELECT COUNT(*) FROM friend_requests
	WHERE target_user_id = check_user_id
	);

	SET requests_from_user = (
	SELECT COUNT(*) FROM friend_requests
	WHERE initiator_user_id = check_user_id
	);

	RETURN requests_to_user / requests_from_user;

END //

DELIMITER ;

SELECT ROUND(popularity_coefficient(1), 2) AS user_popularity_coef;