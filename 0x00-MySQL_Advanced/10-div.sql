-- a SQL script that creates a function SafeDiv that divides (and returns)
DROP FUNCTION IF EXISTS SafeDiv;
delimiter //
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
    IF (b = 0)
    THEN
        RETURN (0);
    ELSE
        RETURN (a / b);
    END IF;
END //
delimiter ;
