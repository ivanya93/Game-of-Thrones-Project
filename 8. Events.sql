-- 8. Event

-- - In your database, create an event and demonstrate how it runs
SET GLOBAL event_scheduler = ON;

USE GOT;

SELECT NOW();

CREATE TABLE monitoring_deaths
	(name VARCHAR(128),
    death_year INT,
    book_of_death INT);

--
DELIMITER //

CREATE EVENT one_time_you_sucks_Jon_Snow
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 Minute
DO BEGIN 
	INSERT INTO monitoring_deaths VALUES 
		('Daenerys Targaryen', 300, 5);
    
    END //

DELIMITER ;

SELECT * FROM monitoring_deaths;
--
DROP EVENT one_time_you_sucks_Jon_Snow;
DROP TABLE monitoring_deaths;
SET GLOBAL event_scheduler = OFF;  
    