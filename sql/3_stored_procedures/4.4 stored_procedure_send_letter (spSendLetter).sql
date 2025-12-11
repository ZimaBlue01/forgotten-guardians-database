/*=================================================================
FileName:stored_procedure_send_letter
Programmer Name: Muhammed Uwais 
Description: This file creates a stored procedure that sends a letter to players accounts indicating subscription time left and additonal news.
=================================================================*/


CREATE PROCEDURE spSendLetter3
    @includeNews NVARCHAR(MAX) = NULL  
AS
BEGIN
    
    DECLARE @accountID INT;
    DECLARE @accountName NVARCHAR(30);
    DECLARE @expirationDate DATE;
    DECLARE @daysLeft INT;

    
    DECLARE account_cursor CURSOR FOR
    SELECT a.accountID, a.accountName, s.expirationDate
    FROM Account a
    INNER JOIN Monthly_Subscription s ON a.subscriptionID = s.subscriptionID;

    
    OPEN account_cursor;

    
    FETCH NEXT FROM account_cursor INTO @accountID, @accountName, @expirationDate;

    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        
        SET @daysLeft = DATEDIFF(DAY, GETDATE(), @expirationDate);

        
        PRINT '======================================================================================';
        PRINT 'Dear ' + @accountName + ',';
        PRINT 'You have ' + CAST(@daysLeft AS NVARCHAR) + ' days left in your subscription.';

        
        IF @includeNews IS NOT NULL
        BEGIN
            PRINT 'Latest News: ' + @includeNews;
        END

        PRINT 'Thank you for being with us!';
        PRINT '=======================================================================================';

        
        FETCH NEXT FROM account_cursor INTO @accountID, @accountName, @expirationDate;
    END

    
    CLOSE account_cursor;
    DEALLOCATE account_cursor;
END


EXEC spSendLetter3 @includeNews = 'Planned maintanance expected ahead! Stay tuned for more details';