/*=================================================================
FileName: Create_Triggers1.sql
Programmer Name: Muhammed Uwais 
Description: This file creates a trigger that prevents anyone from inserting data into the Game_Characters table.
=================================================================*/


USE The_Forgotten_GuardiansRPG
GO

CREATE TRIGGER block_insert
ON Game_Characters --Creates Trigger on the Game_Character Table
INSTEAD OF INSERT
AS 
PRINT 'Inserting has been disabled for this table, please contact your DBA for assistance.'
GO

--Testing the trigger.

INSERT INTO Game_Characters
VALUES
('Guardian','Healer/Support','The Lightbringer is chosen by the Celestial Beings of Radiance.',29)
GO

