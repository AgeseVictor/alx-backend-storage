-- creates a stored procedure ComputeAverageScoreForUser 
-- that computes and store the average score for a student
DROP PROCEDURE IF EXISTS  ComputeAverageScoreForUser;

delimiter //
CREATE PROCEDURE  ComputeAverageScoreForUser (IN user_id INT)
BEGIN DECLARE avg_score FLOAT;

SET avg_score = (
SELECT AVG(score)
FROM corrections AS Corr
WHERE Corr.user_id=user_id); UPDATE users

SET average_score = avg_score
WHERE id=user_id;
END //
delimiter ;

