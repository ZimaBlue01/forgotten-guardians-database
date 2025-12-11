/*====================================================
FileName: Blocked_Accounts_View.sql
Programmer Name: Muhammed Uwais
Description: This file will be used to create a view for all blocked accounts in the database.
=====================================================*/

USE The_Forgotten_GuardiansRPG
GO

IF EXISTS (SELECT Table_Name FROM Information_Schema.Views
	       WHERE Table_Name = 'vw_blocked_accounts')
BEGIN
	DROP VIEW vw_blocked_accounts
	PRINT 'vw_blocked_accounts have been deleted'
END
GO


CREATE VIEW vw_blocked_accounts
AS
    SELECT Account_Status.accountStatus, Account.accountName, Players.playerName
    FROM Account_Status
    JOIN Account
    ON Account_Status.accountID = Account.accountID
    JOIN Players
    ON Account.playerID = Players.playerID
    WHERE Account_Status.accountStatus = 'BLOCKED'
GO


----To view this view we run
----To avoid any duplication errors, Please run this vioew in new script.

SELECT * FROM vw_blocked_accounts