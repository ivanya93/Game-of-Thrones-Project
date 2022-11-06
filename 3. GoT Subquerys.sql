-- 3. Subquerys

-- Prepare an example query with a subquery to demonstrate how to 
-- extract data from your DB for analysis

USE GOT;
-- ----  What Targaryen's kings have had The Seven Kingdoms since The Conquest?
SELECT * FROM got_characters;

SELECT 
	name AS Targaryen_Kings,
    title
FROM got_characters
WHERE name LIKE '%Targaryen%' 
	AND title IN
		(SELECT title
		FROM got_characters
		WHERE title LIKE '%Lord of the seven kingdoms%')
ORDER BY name;

-- -- How many Targaryen's kings have had The Seven Kingdoms since The Conquest?
SELECT 
    COUNT(title) AS Targaryen_Kings
FROM got_characters
WHERE name LIKE '%Targaryen%' 
	AND title IN
		(SELECT title
		FROM got_characters
		WHERE title LIKE '%Lord of the seven kingdoms%')
ORDER BY name;