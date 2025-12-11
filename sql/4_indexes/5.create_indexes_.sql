/*=================================================================
FileName: Create_Indexes.sql
Programmer Name: Muhammed Uwais
Description: This file creates two indexes for The Forgotten Guardians Database 
=================================================================*/

----I choose to index these two tables as they are intersection tables and indexing them will provide better speeds for retrieving data. 


USE The_Forgotten_GuardiansRPG
GO

CREATE INDEX idx_items_functions
ON Items_Functions
 ( 
     functionName
 )

GO


 CREATE INDEX idx_character_skillset
 ON Character_Skillset
  (
      skillName
  )

GO