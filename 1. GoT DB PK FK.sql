-- ------------------------------ Game Of Thrones (GOT) --------------------------------
-- ------------------------------ By George R.R Martin's books -------------------------
-- -- DB by: https://www.kaggle.com/datasets/mylesoneill/game-of-thrones?select=battles.csv 

-- -- 1. Create a DB and set Primary and Foreign Key constraints to 
-- create relations between the tables

CREATE DATABASE GOT;
USE GOT;

SET SQL_SAFE_UPDATES = 0;

-- Create tables from CSV: battles, characterdeaths and characterpredictions
-- Import Data 
-- Create Primary Keys and Foreign Keys 

-- ------ Table: got_characters -----------------------------------------------------------------------------------
CREATE TABLE got_characters (
	character_ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    title VARCHAR(128),
    gender BOOLEAN,
    age TEXT,
	birth_date TEXT,
    death_date TEXT,
    culture VARCHAR(128),
    nobility BOOLEAN,
    allegiances VARCHAR(128),
    mother VARCHAR(128),
    father VARCHAR(128),
	is_married BOOLEAN,
    spouse VARCHAR(128),
    heir VARCHAR(128),
    PRIMARY KEY(character_ID)
);

-- ------ Insert Information ---
INSERT INTO got_characters 
	(name, title, gender, age, birth_date, death_date, nobility, 
    culture, mother, father, is_married, spouse, heir)
SELECT
	name, title, male, age, dateOfBirth, DateoFdeath, isNoble,
    culture, mother, father, isMarried, spouse, heir
FROM characterpredictions;

SELECT name
FROM characterdeaths
WHERE name NOT IN 
	(SELECT name FROM got_characters);

INSERT INTO got_characters
	(name)
SELECT 
	name
FROM characterdeaths
WHERE name NOT IN 
	(SELECT name FROM got_characters);

-- --------- Update ----- 
UPDATE got_characters, characterdeaths
SET
    got_characters.death_date = characterdeaths.DeathYear,
    got_characters.nobility = characterdeaths.Nobility,
    got_characters.gender = characterdeaths.Gender,
    got_characters.allegiances = characterdeaths.Allegiances
WHERE
    got_characters.name = characterdeaths.Name;

SELECT * 
FROM got_characters;


-- --------------------- Table: houses ------------------------------------------------------------
CREATE TABLE houses (
	house_ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(128),
    house_name VARCHAR (128),
    character_ID INT,
    PRIMARY KEY(house_ID)
);

-- ---- Insert Information --------
INSERT INTO houses 
	(name, house_name)
SELECT
	Name, house
FROM characterpredictions;

-- Update table --- 
UPDATE houses, got_characters
SET
    houses.character_ID = got_characters.character_ID
WHERE
    got_characters.name = houses.name;

-- Add Foreign Key
ALTER TABLE houses ADD CONSTRAINT fk_character_ID_from_houses 
FOREIGN KEY (character_ID) REFERENCES got_characters(character_ID);

-- Drop column Name 
ALTER TABLE houses
DROP COLUMN name;

-- ------ Table: charater_status -----------------------------------------------------------------
CREATE TABLE character_status (
	status_ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(128),
    status_actual BOOLEAN NOT NULL,
    is_alive BOOLEAN NOT NULL,
    character_ID INT,
    PRIMARY KEY(status_ID)
);

-- ------ Insert Information --------
INSERT INTO character_status
	(name, status_actual, is_alive)
SELECT
	name, actual, isAlive
FROM characterpredictions;

-- Update table --- 
UPDATE character_status, got_characters
SET
    character_status.character_ID = got_characters.character_ID
WHERE
    got_characters.name = character_status.name;

-- Add Foreign Key
ALTER TABLE character_status ADD CONSTRAINT fk_character_ID_from_status
FOREIGN KEY (character_ID) REFERENCES got_characters(character_ID);

-- DROP column name 
ALTER TABLE character_status
DROP COLUMN name;

SELECT * FROM character_status;

-- ------ Table: charater_prediction -----------------------------------------------------------------
CREATE TABLE character_prediction (
	character_prediction_ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(128),
    prediction BOOLEAN NOT NULL,
    alive_prob INT NOT NULL,
    dead_prob INT NOT NULL,
    book_1_prob BOOLEAN,
    book_2_prob BOOLEAN,
    book_3_prob BOOLEAN,
    book_4_prob BOOLEAN,
    book_5_prob BOOLEAN,
    character_ID INT,
    PRIMARY KEY(character_prediction_ID)
);

-- ------ Insert Information -------
INSERT INTO character_prediction
	(name, prediction, alive_prob, dead_prob, book_1_prob, 
    book_2_prob, book_3_prob, book_4_prob, book_5_prob)
SELECT
	Name, pred, alive, plod, book1, book2, book3, book4, book5
FROM characterpredictions;

-- Update table --- 
UPDATE character_prediction, got_characters
SET
    character_prediction.character_ID = got_characters.character_ID
WHERE
    got_characters.name = character_prediction.name;

-- Add Foreign Key
ALTER TABLE character_prediction ADD CONSTRAINT fk_character_ID_from_prediction
FOREIGN KEY (character_ID) REFERENCES got_characters(character_ID);

-- DROP column name 
ALTER TABLE character_prediction
DROP COLUMN name;

SELECT * FROM character_prediction;

-- ------ Table: charater_popularity -----------------------------------------------------------------
CREATE TABLE character_popularity (
	popularity_ID INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(128),
    is_popular BOOLEAN,
    popularity FLOAT,
    death_relations INT,
    character_ID INT,
    PRIMARY KEY(popularity_ID)
);

-- ------ Insert Information --------
INSERT INTO character_popularity
	(name, is_popular, popularity, death_relations)
SELECT
	Name, isPopular, popularity, numDeadRelations
FROM characterpredictions;

-- Update table --- 
UPDATE character_popularity, got_characters
SET
    character_popularity.character_ID = got_characters.character_ID
WHERE
    got_characters.name = character_popularity.name;

-- Add Foreign Key
ALTER TABLE character_popularity ADD CONSTRAINT fk_character_ID_from_popularity
FOREIGN KEY (character_ID) REFERENCES got_characters(character_ID);

-- DROP column name 
ALTER TABLE character_popularity
DROP COLUMN name;

SELECT * FROM character_popularity;

-- ------ Table: character_lifetime -----------------------------------------------------------------------------------
CREATE TABLE character_lifetime( 
	lifetime_ID INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(128),
    death_year TEXT,
    book_intro_chapter TEXT,
    death_chapter TEXT,
    book_of_death TEXT,
    character_ID INT,
    PRIMARY KEY (lifetime_ID)
);

-- ------ Insert Information --------
INSERT INTO character_lifetime 
	(name, death_year, book_intro_chapter, death_chapter, book_of_death)
SELECT
	Name, DeathYear, BookIntroChapter, DeathChapter, BookofDeath
FROM characterdeaths;

-- Update table --- 
UPDATE character_lifetime, got_characters
SET
    character_lifetime.character_ID = got_characters.character_ID
WHERE
    got_characters.name = character_lifetime.name;

-- Add Foreign Key
ALTER TABLE character_lifetime ADD CONSTRAINT fk_character_ID_from_lifetime
FOREIGN KEY (character_ID) REFERENCES got_characters(character_ID);

-- DROP column name 
ALTER TABLE character_lifetime
DROP COLUMN name;

SELECT * FROM character_lifetime;

-- ------ Table: charater_in_narrative -----------------------------------------------------------------------------------
CREATE TABLE characters_in_narrative (
	narrative_ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(128),
    GoT BOOLEAN,
    CoK BOOLEAN,
    SoS BOOLEAN,
    FfC BOOLEAN,
    DwD BOOLEAN,
	character_ID INT,
    PRIMARY KEY (narrative_ID)
);

-- ------ Insert Information --------
INSERT INTO characters_in_narrative 
	(name, GoT, CoK, SoS, FfC, DwD)
SELECT
	Name, GoT, CoK, SoS, FfC, DwD
FROM characterdeaths;

-- Update table --- 
UPDATE characters_in_narrative, got_characters
SET
    characters_in_narrative.character_ID = got_characters.character_ID
WHERE
    got_characters.name = characters_in_narrative.name;

-- Add Foreign Key
ALTER TABLE characters_in_narrative ADD CONSTRAINT fk_character_ID_from_narrative
FOREIGN KEY (character_ID) REFERENCES got_characters(character_ID);

-- DROP column name 
ALTER TABLE characters_in_narrative
DROP COLUMN name;

SELECT * FROM characters_in_narrative;

-- -------- Change Datatypes ----

	
-- ------ ------------------------ CSV 2: Battles -----------------------------------------------------------------------

-- ------------------ Table: battles ------------------------------------------------------------------------------------
CREATE TABLE got_battles (
	battle_ID INT NOT NULL AUTO_INCREMENT,
    battle_name VARCHAR(128) NOT NULL,
    battle_year INT NOT NULL,
    battle_location VARCHAR(128),
	battle_region VARCHAR(128),
    PRIMARY KEY(battle_ID)
);

-- ------------ Insert Information ----------
INSERT INTO got_battles
	(battle_name, battle_year, battle_location, battle_region)
SELECT
	name, year, location, region
FROM battles;

SELECT * FROM got_battles;

-- -- -- Add Foreign Key
ALTER TABLE got_battles
ADD COLUMN character_ID INT;

ALTER TABLE got_battles ADD CONSTRAINT fk_character_ID_from_battles
FOREIGN KEY (character_ID) REFERENCES got_characters(character_ID);


-- ------------------ battle_attackers ---------------------------------------------------------------------------------
CREATE TABLE battle_attackers (
	attacker_ID INT NOT NULL AUTO_INCREMENT,
    battle_name VARCHAR(128),
    attacker_king VARCHAR(128),
    attacker_commander VARCHAR(256),
    attacker_size INT,
    attacker_1 VARCHAR(128),
    attacker_2 VARCHAR(128),
    attacker_3 VARCHAR(128),
    attacker_4 VARCHAR(128),
    battle_ID INT,
    PRIMARY KEY(attacker_ID)
);

-- -------- Insert Information --------
INSERT INTO battle_attackers
	(battle_name, attacker_king, attacker_commander, attacker_size, 
    attacker_1, attacker_2, attacker_3, attacker_4)
SELECT
	Name, attacker_king, attacker_commander, attacker_size,
    attacker_1, attacker_2, attacker_3, attacker_4
FROM battles;

-- Update table --- 
UPDATE battle_attackers, got_battles
SET
    battle_attackers.battle_ID = got_battles.battle_ID
WHERE
    got_battles.battle_name = battle_attackers.battle_name;

-- Add Foreign Key
ALTER TABLE battle_attackers ADD CONSTRAINT fk_battle_ID 
FOREIGN KEY (battle_ID) REFERENCES got_battles(battle_ID);

-- DROP column name 
ALTER TABLE battle_attackers
DROP COLUMN battle_name;

SELECT * FROM battle_attackers;

-- ------------------ Table: battle_defenders --------------------------------------------------------------------------
CREATE TABLE battle_defenders (
	defender_ID INT NOT NULL AUTO_INCREMENT,
    battle_name VARCHAR(128),
    defender_king VARCHAR(128),
    defender_commander VARCHAR(256),
    defender_size INT,
    defender_1 VARCHAR(128),
    defender_2 VARCHAR(128),
    defender_3 VARCHAR(128),
    defender_4 VARCHAR(128),
    battle_ID INT,
    PRIMARY KEY(defender_ID)
);

-- -------------- Insert Information ----
INSERT INTO battle_defenders
	(battle_name, defender_king, defender_commander, defender_size,
    defender_1, defender_2, defender_3, defender_4)
SELECT
	name, defender_king, defender_commander, defender_size,
    defender_1, defender_2, defender_3, defender_4
FROM battles;

-- Update table --- 
UPDATE battle_defenders, got_battles
SET
    battle_defenders.battle_ID = got_battles.battle_ID
WHERE
    got_battles.battle_name = battle_defenders.battle_name;

-- Add Foreign Key
ALTER TABLE battle_defenders ADD CONSTRAINT fk_battle_ID_defenders
FOREIGN KEY (battle_ID) REFERENCES got_battles(battle_ID);

-- DROP column name 
ALTER TABLE battle_defenders
DROP COLUMN battle_name;

SELECT * FROM battle_defenders;

-- ------------------ Table: battle_attacker_outcome --------------------------------------------------------------------
CREATE TABLE battle_attacker_outcome (
	 attacker_outcome_ID INT NOT NULL AUTO_INCREMENT,
     battle_name VARCHAR(128),
     major_death BOOLEAN,
     major_capture BOOLEAN,
     summer BOOLEAN,
     battle_type VARCHAR (128),
     attacker_outcome VARCHAR(128),
     battle_ID INT,
     PRIMARY KEY (attacker_outcome_ID)
);

-- ---------------- Insert Information ---------
INSERT INTO battle_attacker_outcome
	(battle_name, major_death, major_capture, summer, battle_type, attacker_outcome)
SELECT
	name, major_death, major_capture, summer, battle_type, attacker_outcome
FROM battles;

-- Update table --- 
UPDATE battle_attacker_outcome, got_battles
SET
    battle_attacker_outcome.battle_ID = got_battles.battle_ID
WHERE
    got_battles.battle_name = battle_attacker_outcome.battle_name;

-- Add Foreign Key
ALTER TABLE battle_attacker_outcome ADD CONSTRAINT fk_battle_ID_attackers_outcome
FOREIGN KEY (battle_ID) REFERENCES got_battles(battle_ID);

-- DROP column name 
ALTER TABLE battle_attacker_outcome
DROP COLUMN battle_name;

SELECT * FROM battle_attacker_outcome;

-- --------------------------------------------------------------------------------------------------------------------

SELECT * FROM got_characters;
SELECT * FROM houses;
SELECT * FROM character_status;
SELECT * FROM character_prediction;
SELECT * FROM character_popularity;
SELECT * FROM character_lifetime;
SELECT * FROM characters_in_narrative;
SELECT * FROM got_battles;
SELECT * FROM battle_attackers;
SELECT * FROM battle_defenders;
SELECT * FROM battle_attacker_outcome;

