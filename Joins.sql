-- Joins

-- Does King Viserys, causes any deceases in "A Song of Ice and Fire"? How many? Is his character popular?
SELECT 
	gc.name,
    cp.death_relations,
    ROUND(AVG(cp.popularity), 2) AS Viserys_popularity
FROM character_popularity AS cp
LEFT JOIN got_characters AS gc
	ON gc.character_ID = cp.popularity_ID
WHERE gc.name LIKE '%Viserys I Targaryen%'
GROUP BY gc.name, cp.death_relations;
	
-- What type of battle have more deceases in the "War of the five Kings" ?
SELECT
	battles.battle_name,
    bat.battle_type,
    bat.major_death,
    a.attacker_size,
    d.defender_size
FROM battle_attackers AS a
LEFT JOIN battle_defenders AS d
 ON a.attacker_ID = d.defender_ID
LEFT JOIN battle_attacker_outcome AS bat
 ON a.attacker_ID = bat.attacker_outcome_ID
LEFT JOIN got_battles AS battles
 ON a.attacker_ID = battles.battle_ID
WHERE bat.major_death = 1;


-- Which contender for the Iron Throne is most likely to win the Seven Kindomgs?
-- INNER JOIN
SELECT 
	g.name,
    g.title,
    a.prediction,
    a.alive_prob,
    a.dead_prob
FROM got_characters AS g
INNER JOIN character_prediction AS a
 ON g.character_ID = a.character_prediction_ID
WHERE g.title IN ('Claimant to the Iron Throne')
 ORDER BY a.alive_prob DESC;
 
-- Which Eddard/Ned' Stark sons will be alive in the sixth book? (AKA WINDS OF WINTER)
SELECT 
	gc.name, 
    cp.alive_prob, 
    cp.dead_prob
FROM got_characters AS gc
LEFT JOIN character_prediction AS cp
	ON gc.character_ID = cp.character_prediction_ID 
WHERE father = 'Eddard Stark'
AND cp.alive_prob > cp.dead_prob
ORDER BY cp.alive_prob ASC;

-- Who was the heir of Aegon I, The Conqueror?
SELECT * FROM houses;

SELECT 
	name, 
    heir 
FROM got_characters AS gc
LEFT JOIN houses AS c
	ON gc.character_ID = c.house_ID
WHERE name like '%Aegon I Targaryen%';

-- What houses are in the Seven Kingdoms?
SELECT DISTINCT 
	house_name
FROM houses
WHERE house_name IS NOT NULL
ORDER BY house_name ASC;

SELECT DISTINCT COUNT(house_name)
FROM houses;
