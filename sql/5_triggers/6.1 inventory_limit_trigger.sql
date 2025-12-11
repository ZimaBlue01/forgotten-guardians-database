
/*=================================================================
FileName: Create_Triggers1.sql
Programmer Name: Muhammed Uwais 
Description: This file creates a trigger that preventss more than 8 items to be in the inventory.
=================================================================*/

----Because I did not add a check under the inventory items table, I created a trigger for this instead,The trigger is triggered when a quantity in the Inventory Items tables exceeds 8.

USE The_Forgotten_GuardiansRPG
GO


CREATE TRIGGER trg_CheckItemQuantity1
ON Inventory_Items
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @inventoryID INT;
    DECLARE @itemQuantity INT;

    
    SELECT @inventoryID = inserted.inventoryID, @itemQuantity = inserted.quantity
    FROM inserted;

    -- Check if the quantity exceeds 8
    IF @itemQuantity > 8
    BEGIN
        -- Print a message if the quantity exceeds the limit
        PRINT 'Item quantity exceeds limit, Please drop some items';
    END
END;
GO

----Testing trigger

INSERT INTO Inventory_Items (quantity, inventoryID, itemID) 
VALUES
(9,40,4)
GO