-- 7. Trigger

-- - In your database, create a trigger and demonstrate how it runs

USE GOT;

SELECT name, age
FROM got_characters
WHERE age IS NOT NULL
	AND age < 0;

UPDATE 
	got_characters
SET 
	age = -298001
WHERE 
	name = 'Rhaego';
    
UPDATE 
	got_characters
SET 
	age = -277980
WHERE 
	name = 'Doreah';
-- 
-- Create trigger to set -0 age, in 0.

DELIMITER //

CREATE TRIGGER age_check
	BEFORE UPDATE ON got_characters 
    FOR EACH ROW
    BEGIN 
		IF NEW.age < 0 
		THEN SET new.age = 0; 
		END IF;

END //
DELIMITER ;

SHOW TRIGGERS;
    
SELECT name, age
FROM got_characters
WHERE NAME IN ('Doreah', 'Rhaego');

DROP TRIGGER age_check;