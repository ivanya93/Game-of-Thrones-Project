-- 6. Stored Procedure. 
-- In your database, create a stored procedure and demonstrate how it runs ----------------------------------

-- GoT most important houses and their allegiances with, etc ------------------------------------------------
USE GOT;

DELIMITER //

CREATE PROCEDURE sp_Allegiances ()
BEGIN
		SELECT name, allegiances
		FROM got_characters 
		WHERE Allegiances = Allegiances
        ORDER BY name;
END // 

DELIMITER ;

CALL GOT.sp_Allegiances();

-- Please give me the contenders' houses to the Iron Throne ----------------------------------------------------
-- (AKA the war of the five/seven kings), with their allegiances ----------------------------------------------

-- Joffrey Baratheon house's Allegiances ----------------------------------------------------------------------
-- Joffrey Baratheon/Lannister, King of the Andals and the First Men, Lord of the Seven Kingdoms
DELIMITER //

CREATE PROCEDURE sp_JoffreyBaratheon_Allegiances()
BEGIN
		SELECT allegiances AS Joffrey_Baratheon_Allegiances
		FROM got_characters 
		WHERE name = 'Joffrey Baratheon';
END // 

DELIMITER ;

CALL GOT.sp_JoffreyBaratheon_Allegiances();

-- House Lannister's Allegiances:
DELIMITER //

CREATE PROCEDURE sp_Lannister_Allegiances()
BEGIN
		SELECT name, title, nobility, allegiances
		FROM got_characters 
		WHERE allegiances LIKE '%Lannister%'
        ORDER BY name;
END // 

DELIMITER ;

CALL GOT.sp_Lannister_Allegiances();


-- Please give me Robb Stark house's Allegiances -----------------------------------------------------------------
-- Robb Stark, The King in the North
DELIMITER //

CREATE PROCEDURE sp_RobbStark_Allegiances()
BEGIN
		SELECT allegiances AS Robb_Stark_Allegiances
		FROM got_characters 
		WHERE name LIKE '%Robb Stark%';
END // 

DELIMITER ;

CALL GOT.sp_RobbStark_Allegiances();

-- House Stark's Allegiances:
DELIMITER //

CREATE PROCEDURE sp_Stark_Allegiances()
BEGIN
		SELECT name, title, nobility, allegiances
		FROM got_characters 
		WHERE allegiances LIKE '%Stark%'
        ORDER BY name;
END // 

DELIMITER ;

CALL GOT.sp_Stark_Allegiances();

-- Please give me Daenerys Targaryen's house Allegiances -------------------------------------------------------
-- Daenerys Stormborn of House Targaryen, the First of Her Name, , the Unburnt, the Breaker of Chains, 
-- Queen of the Andals and the First Men, Protector of the Seven Kingdoms, the Mother of Dragons, 
-- the Khaleesi of the Great Grass Sea
DELIMITER //

CREATE PROCEDURE sp_DaenerysTargaryen_Allegiances()
BEGIN
		SELECT allegiances AS Daenerys_Targaryen_Allegiances
		FROM got_characters 
		WHERE name LIKE '%Daenerys Targaryen%';
END // 

DELIMITER ;

CALL GOT.sp_DaenerysTargaryen_Allegiances();


-- House Targaryen's Allegiances
DELIMITER //

CREATE PROCEDURE sp_Targaryen_Allegiances()
BEGIN
		SELECT name, title, nobility, allegiances
		FROM got_characters 
		WHERE allegiances LIKE '%Targaryen%'
        ORDER BY name;
END // 

DELIMITER ;

CALL GOT.sp_Targaryen_Allegiances();

--  Please give me Renly and Stannis Baratheon's Allegiances ----------------------------------------------------
-- Renly Baratheon, The King in Highgarden
DELIMITER //

CREATE PROCEDURE sp_RenlyBaratheon_Allegiances()
BEGIN
		SELECT allegiances AS Renly_Baratheon_Allegiances
		FROM got_characters 
		WHERE name LIKE '%Renly Baratheon%';
END // 

DELIMITER ;

CALL GOT.sp_RenlyBaratheon_Allegiances();

-- Stannis Baratheon, The King in the Narrow Sea
DELIMITER //

CREATE PROCEDURE sp_StannisBaratheon_Allegiances()
BEGIN
		SELECT allegiances AS Stannis_Baratheon_Allegiances
		FROM got_characters 
		WHERE name LIKE '%Stannis Baratheon%';
END // 

DELIMITER ;

CALL GOT.sp_StannisBaratheon_Allegiances();

-- House Baratheon's Allegiances:
DELIMITER //

CREATE PROCEDURE sp_Baratheon_Allegiances()
BEGIN
		SELECT name, title, nobility, allegiances
		FROM got_characters 
		WHERE allegiances LIKE '%Baratheon%'
        ORDER BY name;
END // 

DELIMITER ;

CALL GOT.sp_Baratheon_Allegiances();

-- Please give me Balon Greyjoy's house Allegiances -------------------------------------------------------------
-- Balon Greyjoy, King of the Iron Islands 
DELIMITER //

CREATE PROCEDURE sp_BalonGreyjoy_Allegiances()
BEGIN
		SELECT allegiances AS Balon_Greyjoy_Allegiances
		FROM got_characters 
		WHERE name LIKE '%Balon Greyjoy%';
END // 

DELIMITER ;

CALL GOT.sp_BalonGreyjoy_Allegiances();

-- House Greyjoy's Allegiances:
DELIMITER //

CREATE PROCEDURE sp_Greyjoy_Allegiances()
BEGIN
		SELECT name, title, nobility, allegiances
		FROM got_characters 
		WHERE allegiances LIKE '%Greyjoy%'
        ORDER BY name;
END // 

DELIMITER ;

CALL GOT.sp_Greyjoy_Allegiances();



