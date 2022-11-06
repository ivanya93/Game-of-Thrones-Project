-- 2. Views and Joins

-- Using any type of the joins, create a view that combines multiple tables in a logical way
-- Create a view that uses at least 3-4 base tables; prepare and demonstrate a
-- query that uses the view to produce a logically arranged result set for analysis


-- Create view with the king's attacker/defender outcome
USE GOT;

CREATE VIEW battles_outcome_winners AS
	SELECT a.attacker_king,
    COUNT(bat.attacker_outcome) AS Wins_Battles
FROM battle_attackers AS a
	LEFT JOIN battle_defenders AS d
		ON a.attacker_ID = d.defender_ID
	LEFT JOIN battle_attacker_outcome AS bat
		ON a.attacker_ID = bat.attacker_outcome_ID
	WHERE attacker_outcome = 'win'
	GROUP BY a.attacker_king
	ORDER BY Wins_Battles DESC;
    
SELECT * FROM battles_outcome_winners;

-- ----------
CREATE VIEW battles_outcome_losers AS
	SELECT a.attacker_king,
    COUNT(bat.attacker_outcome) AS Losses_Battles
FROM battle_attackers AS a
	LEFT JOIN battle_defenders AS d
		ON a.attacker_ID = d.defender_ID
	LEFT JOIN battle_attacker_outcome AS bat
		ON a.attacker_ID = bat.attacker_outcome_ID
	WHERE attacker_outcome = 'loss'
	GROUP BY a.attacker_king
	ORDER BY Losses_Battles DESC;

SELECT * FROM battles_outcome_losers;

-- Views with views of all the claimants
CREATE OR REPLACE VIEW battles_outcome
	AS
    SELECT
		w.attacker_king AS King,
        w.Wins_Battles,
        l.Losses_Battles
	FROM battles_outcome_winners AS w
    INNER JOIN battles_outcome_losers AS l
		ON w.attacker_king = l.attacker_king
    ORDER BY w.attacker_king;

SELECT * FROM battles_outcome;








    