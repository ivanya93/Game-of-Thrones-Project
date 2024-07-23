-- Data types conversion and casting

-- ------------ UPDATE ---------------------------------------------------------------------------------
UPDATE 
	got_characters
SET 
	title = 'Claimant to the Iron Throne'
WHERE 
	name = 'Joffrey Baratheon';

SELECT * FROM got_characters
WHERE name = 'Joffrey Baratheon';


UPDATE 
	got_characters
SET 
	title = 'Claimant to the Iron Throne'
WHERE 
	name = 'Tommen Baratheon';

SELECT * FROM got_characters
WHERE name = 'Tommen Baratheon';

-- ------ 
UPDATE 
	got_characters
SET 
	title = 'Claimant to the Iron Throne'
WHERE 
	name = 'Tommen Baratheon';

SELECT * FROM got_characters
WHERE name = 'Tommen Baratheon';

-- ---
UPDATE 
	got_characters
SET 
	title = 'Claimant to the Iron Throne'
WHERE 
	name = 'Stannis Baratheon';

SELECT * FROM got_characters
WHERE name = 'Stannis Baratheon';

-- ---
UPDATE 
	got_characters
SET 
	title = 'Claimant to the Iron Throne'
WHERE 
	name = 'Renly Baratheon';

SELECT * FROM got_characters
WHERE name = 'Renly Baratheon';


-- ---
UPDATE 
	got_characters
SET 
	title = 'Claimant to the Iron Throne'
WHERE 
	name = 'Robb Stark';

SELECT * FROM got_characters
WHERE name = 'Robb Stark';

-- ----
UPDATE 
	got_characters
SET 
	title = 'Claimant to the Iron Throne'
WHERE 
	name = 'Balon Greyjoy';

SELECT * FROM got_characters
WHERE name = 'Balon Greyjoy';

-- ---
UPDATE 
	got_characters
SET 
	title = 'Claimant to the Iron Throne'
WHERE 
	name = 'Daenerys Targaryen';

SELECT * FROM got_characters
WHERE name = 'Daenerys Targaryen';

-- ---
UPDATE 
	got_characters
SET 
	title = 'Claimant to the Iron Throne'
WHERE 
	name = 'Aegon Targaryen (son of Rhaegar)';

SELECT * FROM got_characters
WHERE name = 'Aegon Targaryen (son of Rhaegar)';

-- Change datatypes
-- age
UPDATE 
	got_characters
SET 
	age = (NULL)
WHERE 
	age = '';

ALTER TABLE got_characters
MODIFY COLUMN age INT;

-- birth_date
UPDATE 
	got_characters
SET 
	birth_date = (NULL)
WHERE 
	birth_date = '';

ALTER TABLE got_characters
MODIFY COLUMN birth_date INT;

-- death_date
UPDATE 
	got_characters
SET 
	death_date = (NULL)
WHERE 
	death_date = '';

ALTER TABLE got_characters
MODIFY COLUMN death_date INT;

-- is_married
UPDATE 
	got_characters
SET 
	is_married = (NULL)
WHERE 
	is_married = '';

ALTER TABLE got_characters
MODIFY COLUMN is_married BOOLEAN;

-- title
UPDATE 
	got_characters
SET 
	title = (NULL)
WHERE 
	title = '';
    
-- culture
UPDATE 
	got_characters
SET 
	culture = (NULL)
WHERE 
	culture = '';
    
-- mother
UPDATE 
	got_characters
SET 
	mother = (NULL)
WHERE 
	mother = '';
    
-- father
UPDATE 
	got_characters
SET 
	father = (NULL)
WHERE 
	father = '';

-- spouse
UPDATE 
	got_characters
SET 
	spouse = (NULL)
WHERE 
	spouse = '';
    
-- heir
UPDATE 
	got_characters
SET 
	heir = (NULL)
WHERE 
	heir = '';
    
-- houses
UPDATE 
	houses
SET 
	house_name = (NULL)
WHERE 
	house_name = '';


SELECT * FROM character_lifetime;
    
-- death_year
UPDATE 
	character_lifetime
SET 
	death_year = (NULL)
WHERE 
	death_year = '';
    
ALTER TABLE character_lifetime
MODIFY COLUMN death_year INT;

-- book_intro_chapter
UPDATE 
	character_lifetime
SET 
	book_intro_chapter = (NULL)
WHERE 
	book_intro_chapter = '';
    
ALTER TABLE character_lifetime
MODIFY COLUMN book_intro_chapter INT;

-- death_chapter 
UPDATE 
	character_lifetime
SET 
	death_chapter = (NULL)
WHERE 
	death_chapter = '';
    
ALTER TABLE character_lifetime
MODIFY COLUMN death_chapter INT;

-- book_of_death
UPDATE 
	character_lifetime
SET 
	book_of_death = (NULL)
WHERE 
	book_of_death = '';
    
ALTER TABLE character_lifetime
MODIFY COLUMN book_of_death INT;


-- 
SELECT * FROM battle_attackers;

UPDATE 
	battle_attackers
SET 
	attacker_king = (NULL)
WHERE 
	attacker_king = '';
    
UPDATE 
	battle_attackers
SET 
	attacker_commander = (NULL)
WHERE 
	attacker_commander = '';
    
UPDATE 
	battle_attackers
SET 
	attacker_1 = (NULL)
WHERE 
	attacker_1 = '';
    
UPDATE 
	battle_attackers
SET 
	attacker_2 = (NULL)
WHERE 
	attacker_2 = '';
    
UPDATE 
	battle_attackers
SET 
	attacker_3 = (NULL)
WHERE 
	attacker_3 = '';
    
UPDATE 
	battle_attackers
SET 
	attacker_4 = (NULL)
WHERE 
	attacker_4 = '';
  
  --
SELECT * FROM battle_defenders;
UPDATE 
	battle_defenders
SET 
	defender_king = (NULL)
WHERE 
	defender_king = '';

UPDATE 
	battle_defenders
SET 
	defender_commander = (NULL)
WHERE 
	defender_commander = '';

UPDATE 
	battle_defenders
SET 
	defender_1 = (NULL)
WHERE 
	defender_1 = '';
    
UPDATE 
	battle_defenders
SET 
	defender_2 = (NULL)
WHERE 
	defender_2 = '';
    
UPDATE 
	battle_defenders
SET 
	defender_3 = (NULL)
WHERE 
	defender_3 = '';
    
UPDATE 
	battle_defenders
SET 
	defender_4 = (NULL)
WHERE 
	defender_4 = '';

-- AGE
UPDATE 
	got_characters
SET 
	age = -27
WHERE 
	name = 'Aegon I Targaryen';
    
UPDATE 
	got_characters
SET 
	age = 64
WHERE 
	name = 'Aegon I Targaryen';
    
