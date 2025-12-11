/*=================================================================
FileName:stored_procedure_add_inventoryItem
Programmer Name: Muhammed Uwais 
Description: This file creates a stored procedure that addds a items to a character inventory.
=================================================================*/

USE The_Forgotten_GuardiansRPG
GO

CREATE PROCEDURE spAddItem
    @characterID INT,
    @itemID INT,
    @quantity INT
AS
BEGIN
   
    DECLARE @inventoryID INT;
    DECLARE @usedSlots INT;
    DECLARE @maxSlots INT = 8;  

    
    SELECT @inventoryID = InventoryID
    FROM Inventory
    WHERE characterID = @characterID;

  
    IF @inventoryID IS NULL
    BEGIN
        PRINT 'Please provide a valid character ID.'
        RETURN;
    END

   
    SELECT @usedSlots = COUNT(*)
    FROM Inventory_Items
    WHERE inventoryID = @inventoryID;

    
    IF @usedSlots >= @maxSlots
    BEGIN
        PRINT 'There is no space in inventory. Please free up inventory slots.'
        RETURN;
    END

    
    INSERT INTO Inventory_Items (inventoryID, itemID, quantity)
    VALUES (@inventoryID, @itemID, @quantity);

    PRINT 'Item added to the characters inventory successfully.'
END
