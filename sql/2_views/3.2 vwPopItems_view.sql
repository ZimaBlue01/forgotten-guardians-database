/*====================================================
FileName: Top 5 most popular items.sql
Programmer Name: Muhammed Uwais
Description: This file will be used to create a view for the top 5 most popular items.
=====================================================*/


IF EXISTS (SELECT Table_Name FROM Information_Schema.Views
	       WHERE Table_Name = 'vw_top_popItems')
BEGIN
	DROP VIEW vw_top_popItems
	PRINT 'vw_top_items_stacked have been deleted'
END
GO


CREATE VIEW vw_top_popItems
AS
    SELECT TOP 5
        Items.itemName,
        COUNT(DISTINCT Inventory.characterID) AS numberOfCharacters
    FROM Inventory_Items
    JOIN Inventory
    ON Inventory_Items.inventoryID = Inventory.inventoryID
    JOIN Items
    ON Inventory_Items.itemID = Items.itemID
    GROUP BY Items.itemName
    ORDER BY numberOfCharacters DESC
GO

