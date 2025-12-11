/*=================================================================
FileName:stored_procedure_add_time
Programmer Name: Muhammed Uwais 
Description: This file creates a stored procedure that addds a specified subscription time to a account.
=================================================================*/


----Because a player needs to have a subscription to have a account, We check first if the player has subscription. 

CREATE PROCEDURE spAddTime
    @accountName NVARCHAR(30),
    @daysToAdd INT
AS
BEGIN
    
    DECLARE @subscriptionID INT;
    DECLARE @expirationDate DATE;

    
    SELECT @subscriptionID = subscriptionID
    FROM Account
    WHERE accountName = @accountName;

    
    IF @subscriptionID IS NULL
    BEGIN
        PRINT 'Account was not found. Please provide another account name.'
        RETURN
    END

   
    SELECT @expirationDate = expirationDate
    FROM Monthly_Subscription
    WHERE subscriptionID = @subscriptionID;

    
    UPDATE Monthly_Subscription
    SET expirationDate = DATEADD(DAY, @daysToAdd, @expirationDate)
    WHERE subscriptionID = @subscriptionID;

    PRINT 'Subscription time added successfully.'
END
