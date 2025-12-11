/*=================================================================
FileName:stored_procedure_add_time
Programmer Name: Muhammed Uwais 
Description: This file creates a stored procedure that addds a specified subscription time to a account.
=================================================================*/

CREATE PROCEDURE spAddChar
    @accountID INT,            
    @characterName VARCHAR(30), 
    @characterRole VARCHAR(30),
	@characterDescription VARCHAR(250)
AS
BEGIN
    
    DECLARE @exists INT;

    
    SELECT @exists = COUNT(*)
    FROM Account
    WHERE accountID = @accountID;

    
    IF @exists = 0
    BEGIN
        PRINT 'Account not found. Please provide a valid account ID.'
        RETURN;
    END

    
    INSERT INTO Game_Characters(accountID, characterName, characterRole,characterDescription)
    VALUES (@accountID, @characterName, @characterRole,@characterDescription);

    PRINT 'Character added to the account successfully.'
END


EXEC spAddChar @accountID = 29, @characterName = 'Guardian', @characterRole = 'Healer/Support', @characterDescription = 'The Lightbringer is chosen by the Celestial Beings of Radiance.'
