/*====================================================
FileName: Top 20 stacked items.sql
Programmer Name: Muhammed Uwais
Description: This file will be used to create a view for the top 20 Items that are stacked most.
=====================================================*/


IF EXISTS (SELECT Table_Name FROM Information_Schema.Views
	       WHERE Table_Name = 'vw_top_items_stacked')
BEGIN
	DROP VIEW vw_top_items_stacked
	PRINT 'vw_top_items_stacked have been deleted'
END
GO

CREATE VIEW vw_top_items_stacked
AS
    SELECT TOP 20 
        Items.itemName,
        SUM(Inventory_Items.quantity) AS totalQuantity,
        Game_Characters.CharacterName,
        Game_Characters.characterRole,
        Game_Characters.characterDescription
    FROM Inventory_Items
    JOIN Inventory
    ON Inventory_Items.inventoryID = Inventory.inventoryID
    JOIN Items
    ON Inventory_Items.itemID = Items.itemID
    JOIN Game_Characters
    ON Inventory.characterID = Game_Characters.characterID
    GROUP BY Items.itemName, Game_Characters.CharacterName, Game_Characters.characterRole, Game_Characters.characterDescription
    ORDER BY totalQuantity DESC
GO

----To view this view, we can run

SELECT * FROM vw_top_items_stacked

----I suggest running this view in a new script. 