/*====================================================
FileName: Top 20 skills.sql
Programmer Name: Muhammed Uwais
Description: This file will be used to create a view for the top 20 chracters with the hghest skill.
=====================================================*/


USE The_Forgotten_GuardiansRPG
GO


IF EXISTS (SELECT Table_Name FROM Information_Schema.Views
	       WHERE Table_Name = 'vw_top_twenty')
BEGIN
	DROP VIEW vw_top_twenty
	PRINT 'vw_top_twenty have been deleted'
END
GO

CREATE VIEW vw_top_twenty
AS
    SELECT TOP 20 
        Game_Characters.CharacterName,
        Game_Characters.characterRole,
        Game_Characters.characterDescription,
        Character_Skillset.skillName,
        Character_Skillset.skillsetLevelID,
        Skillset_Level.skillsetLevel, 
        Account.accountName,
        Account.creationDate
    FROM Character_Skillset
    JOIN Game_Characters
    ON Character_Skillset.characterID = Game_Characters.characterID
    JOIN Account
    ON Game_Characters.accountID = Account.accountID
    JOIN Skillset_Level
    ON Character_Skillset.skillsetLevelID = Skillset_Level.skillsetLevelID  
    ORDER BY Character_Skillset.skillsetLevelID DESC
GO