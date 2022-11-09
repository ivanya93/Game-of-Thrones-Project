-- 5. Stored Functions 

-- In your database, create a stored function that can be applied to a query in your DB

USE GOT;

-- Check if a contendent to the Iron Throne is alegiable to win the crown
-- And say 'Yes' or 'Not'

-- -- Who was the older character in GOT?
SELECT 
    name, 
    age
FROM got_characters
WHERE age >= 100
ORDER BY name ASC; 

-- Create Function that specified the demography by age in GOT
DELIMITER //

CREATE FUNCTION sf_GoT_demography(age INT)
RETURNS VARCHAR(64)
DETERMINISTIC
BEGIN
	DECLARE sf_GoT_demography VARCHAR(64);
    IF age >= 100 THEN
		SET sf_GoT_demography = 'Diamond: The Oldest';
	ELSEIF (age <= 99 AND
				age >= 70) THEN
		SET sf_GoT_demography = 'Platinum';
	ELSEIF (age <= 69 AND
				age >= 40) THEN 
		SET sf_GoT_demography = 'Gold';
	ELSEIF (age <= 39 AND
				age >= 20) THEN
		SET sf_GoT_demography = 'Silver';
	ELSEIF (age <= 19 AND
				age >= 0) THEN
		SET sf_GoT_demography = 'Bronze';
	END IF;
    RETURN (sf_GoT_demography);
    
END //
DELIMITER ;

-- Please give me the age of GOT by demography
SELECT gc.name, GOT.sf_GoT_demography(gc.age) AS age
FROM got_characters AS gc
WHERE GOT.sf_GoT_demography(gc.age) IS NOT NULL
ORDER BY gc.name ASC;

-- Please give me how many 'Diamond' characters by age are in GOT
SELECT COUNT(GOT.sf_GoT_demography(gc.age)) AS Diamond_characters
FROM got_characters AS gc
WHERE GOT.sf_GoT_demography(gc.age) IS NOT NULL
	AND GOT.sf_GoT_demography(gc.age) = 'Diamond: The Oldest'
ORDER BY gc.name ASC;

-- Please give me how many 'Platinum' characters by age are in GOT
SELECT COUNT(GOT.sf_GoT_demography(gc.age)) AS Platinum_characters
FROM got_characters AS gc
WHERE GOT.sf_GoT_demography(gc.age) IS NOT NULL
	AND GOT.sf_GoT_demography(gc.age) = 'Platinum'
ORDER BY gc.name ASC;

-- Please give me how many 'Gold' characters by age are in GOT
SELECT COUNT(GOT.sf_GoT_demography(gc.age)) AS Gold_characters
FROM got_characters AS gc
WHERE GOT.sf_GoT_demography(gc.age) IS NOT NULL
	AND GOT.sf_GoT_demography(gc.age) = 'Gold'
ORDER BY gc.name ASC;

-- Please give me how many 'Silver' characters by age are in GOT
SELECT COUNT(GOT.sf_GoT_demography(gc.age)) AS Silver_characters
FROM got_characters AS gc
WHERE GOT.sf_GoT_demography(gc.age) IS NOT NULL
	AND GOT.sf_GoT_demography(gc.age) = 'Silver'
ORDER BY gc.name ASC;

-- Please give me how many 'Bronze' characters by age are in GOT
SELECT COUNT(GOT.sf_GoT_demography(gc.age)) AS Bronze_characters
FROM got_characters AS gc
WHERE GOT.sf_GoT_demography(gc.age) IS NOT NULL
	AND GOT.sf_GoT_demography(gc.age) = 'Bronze'
ORDER BY gc.name ASC;

