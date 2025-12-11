/*=================================================================
FileName:Register_New_Account_Procedure
Programmer Name: Muhammed Uwais 
Description: This file creates a stored procedure to handle new account registrations.
=================================================================*/


USE The_Forgotten_GuardiansRPG
GO

CREATE PROCEDURE sp_Register2_Account

    @accountName VARCHAR(50),
	@creationDate DATE,
	@playerID INT,
	@sessionID INT = NULL,
	@subscriptionID INT 

AS
BEGIN

    IF EXISTS(SELECT 1 FROM Account WHERE accountName = @accountName)
	BEGIN
	    PRINT 'Account name already exists, Please try a new Account name.'
		RETURN
	END

	INSERT INTO Account(accountName,creationDate,playerID,sessionID,subscriptionID)
	VALUES
	(@accountName,@creationDate,@playerID,@sessionID,@subscriptionID)
END
GO