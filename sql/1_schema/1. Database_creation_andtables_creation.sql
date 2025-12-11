/*=================================================================================
FileName: Create_Database_And_Tables.sql
Programmer: Muhammed Uwais
Description: This file will create the databse and tables with all the required constraints.
======================================================================================*/


Use Master
GO

----If this database exists, the code will delete it.


IF EXISTS(SELECT name FROM Master.dbo.sysdatabases WHERE name = 'The_Forgotten_GuardiansRPG')
BEGIN
    DROP DATABASE The_Forgotten_GuardiansRPG
	PRINT 'The Database has been deleted succesfully'
END

----Please create a folder in your C drive called : OnlineRolePlayingDB
-----Make sure you have created this folder before executing this script

CREATE DATABASE The_Forgotten_GuardiansRPG
ON PRIMARY
(
    NAME = 'The_Forgotten_GuardiansRPG_Data',
	FILENAME = 'C:\OnlineRolePlayingDB\The_Forgotten_GuardiansRPG_Data.mdf',
	SIZE = 10MB,
	FILEGROWTH = 10%
)
LOG ON

(
    NAME = 'The_Forgotten_GuardiansRPG_Log',
	FILENAME = 'C:\OnlineRolePlayingDB\The_Forgotten_GuardiansRPG_Log.ldf',
	SIZE = 10MB,
	FILEGROWTH = 10%
)
GO

USE The_Forgotten_GuardiansRPG
GO

----The order of the tables created is from Parent(PK tables) to Child(FK tables). 

CREATE TABLE ErrorTypeLog ----The most parent Table in the DB, with no FKs 
(
    errorTypeID INT IDENTITY NOT NULL,
	errorTypeName VARCHAR(50) NOT NULL,
	errorDescription VARCHAR(100) NOT NULL,
	CONSTRAINT errorTypeID_PK PRIMARY KEY (errorTypeID)
)
GO

CREATE TABLE ErrorLog
(
    errorID INT IDENTITY NOT NULL,
	errorMessage VARCHAR(50) NOT NULL,
	errorTime DATETIME NOT NULL DEFAULT GETDATE(),
	errorTypeID INT NOT NULL,
	CONSTRAINT errorID_PK PRIMARY KEY (errorID),
	CONSTRAINT FK_errorTypeID FOREIGN KEY (errorTypeID) REFERENCES errorTypeLog(errorTypeID) ON DELETE CASCADE 
)
GO

CREATE TABLE Session_Details
(
    sessionID INT IDENTITY NOT NULL,
	loginTime TIME(0) NOT NULL,
	playerDevice VARCHAR(30) NOT NULL,
	playerIPaddress VARCHAR(20) NOT NULL,
	logoutTime TIME(0) NOT NULL,
	errorID INT NULL,
	CONSTRAINT sessionID_PK PRIMARY KEY (sessionID),
	CONSTRAINT FK_errorID FOREIGN KEY (errorID) REFERENCES ErrorLog(errorID) ON DELETE CASCADE 
)
GO

CREATE TABLE Players
(
    playerID INT IDENTITY NOT NULL,
	playerName VARCHAR(30) NOT NULL,
	playerEmail VARCHAR(50) NOT NULL,
	CONSTRAINT playerID_PK PRIMARY KEY (playerID)
)
GO

CREATE TABLE Monthly_Subscription
(
    subscriptionID INT IDENTITY NOT NULL,
	paymentDate DATE NOT NULL,
	expirationDate DATE NOT NULL,
	amountPaid DECIMAL(6,2) NOT NULL,
	CONSTRAINT subscriptionID_PK PRIMARY KEY (subscriptionID)
)
GO



CREATE TABLE Account
(
    accountID INT IDENTITY NOT NULL,
	accountName VARCHAR(30) NOT NULL,
	creationDate DATE NOT NULL,
	playerID INT NOT NULL,
	sessionID INT NULL,
	subscriptionID INT NOT NULL,
	CONSTRAINT account_Name_UNQ UNIQUE(accountName),
	CONSTRAINT accountID_PK PRIMARY KEY (accountID),
	CONSTRAINT FK_playerID FOREIGN KEY (playerID) REFERENCES Players(playerID) ON DELETE CASCADE,
	CONSTRAINT FK_sessionID FOREIGN KEY(sessionID) REFERENCES Session_Details(sessionID) ON DELETE CASCADE,
	CONSTRAINT FK_subscriptionID FOREIGN KEY(subscriptionID) REFERENCES Monthly_Subscription(subscriptionID) ON DELETE CASCADE
)
GO

CREATE TABLE Account_Status
(
    accountStatusID INT IDENTITY NOT NULL,
	accountStatus VARCHAR(20) NOT NULL,
	accountID INT NOT NULL,
	CONSTRAINT accountStatusID_PK PRIMARY KEY(accountStatusID),
	CONSTRAINT FK_accountStatus_accountID FOREIGN KEY(accountID) REFERENCES Account(accountID) ON DELETE CASCADE
)
GO

CREATE TABLE Game_Characters
(
    characterID INT IDENTITY NOT NULL,
	CharacterName VARCHAR(40) NOT NULL,
	characterRole VARCHAR(20) NOT NULL,
	characterDescription VARCHAR(500) NOT NULL,
	accountID INT NOT NULL,
	CONSTRAINT characterID_PK PRIMARY KEY (characterID),
	CONSTRAINT FK_accountID_GameChar FOREIGN KEY (accountID) REFERENCES Account(accountID) ON DELETE CASCADE
)
GO

CREATE TABLE Team
(
    teamID INT IDENTITY NOT NULL,
	teamName VARCHAR(50) NOT NULL,
	teamDescription VARCHAR(250) NOT NULL,
	teamMoralStance VARCHAR(40) NOT NULL,
	teamGoal VARCHAR(250) NOT NULL,
	CONSTRAINT teamID_PK PRIMARY KEY(teamID)
)
GO


CREATE TABLE Game_Character_Team
(
    gameTeamID INT IDENTITY NOT NULL,
	teamID INT NOT NULL,
	characterID INT NOT NULL,
	CONSTRAINT gameTeam_PK PRIMARY KEY (gameTeamID),
	CONSTRAINT FK_teamID FOREIGN KEY(teamID) REFERENCES Team(teamID) ON DELETE CASCADE,
	CONSTRAINT FK_characterID FOREIGN KEY(characterID) REFERENCES Game_Characters(characterID) ON DELETE CASCADE
)
GO


CREATE TABLE Skillset_Level 
(
    skillsetLevelID INT IDENTITY NOT NULL,
	skillsetLevel VARCHAR(100),
	CONSTRAINT skillsetLevelID_PK PRIMARY KEY (skillsetLevelID)
)
GO

CREATE TABLE Character_Skillset
(
    characterSkillsetID INT IDENTITY NOT NULL,
	skillName VARCHAR(50) NOT NULL,
	skillEffect VARCHAR(50) NOT NULL,
	skillType VARCHAR(50) NOT NULL,
	characterID INT NOT NULL,
	skillsetLevelID INT NOT NULL,
	CONSTRAINT characterSkillsetID_PK PRIMARY KEY(characterSkillsetID),
	CONSTRAINT FK_characterID_Skillset FOREIGN KEY(characterID) REFERENCES Game_Characters(characterID) ON DELETE CASCADE,
	CONSTRAINT FK_skillsetLevelID FOREIGN KEY(skillsetLevelID) REFERENCES Skillset_Level(skillsetLevelID) ON DELETE CASCADE
)
GO

CREATE TABLE Inventory 
(
    inventoryID INT IDENTITY NOT NULL,
	inventorySlotNumber INT NOT NULL,
	inventoryQuantity INT NOT NULL,
	characterID INT NOT NULL,
	CONSTRAINT inventoryID_PK PRIMARY KEY(inventoryID),
	CONSTRAINT FK_characterID_Inventory FOREIGN KEY(characterID) REFERENCES Game_Characters(characterID) ON DELETE CASCADE
)
GO
CREATE TABLE Items
(
    itemID INT IDENTITY NOT NULL,
	itemName VARCHAR(30) NOT NULL,
	itemType VARCHAR(30) NOT NULL,
	CONSTRAINT itemID_PK PRIMARY KEY(itemID)
)
GO

CREATE TABLE Items_Functions
(
    functionID INT IDENTITY NOT NULL,
	functionName VARCHAR(50) NOT NULL,
	functionEffect VARCHAR(250) NOT NULL,
	itemID INT NOT NULL,
	CONSTRAINT functionID_PK PRIMARY KEY (functionID),
	CONSTRAINT FK_itemID_item FOREIGN KEY(itemID) REFERENCES Items(itemID) ON DELETE CASCADE
)
GO

CREATE TABLE Inventory_Items
(
    inventoryItemID INT IDENTITY NOT NULL,
	quantity INT NOT NULL,
	inventoryID INT NOT NULL,
	itemID INT NOT NULL,
	CONSTRAINT inventoryItemID_PK PRIMARY KEY(inventoryItemID),
	CONSTRAINT FK_inventoryID FOREIGN KEY(inventoryID) REFERENCES Inventory(inventoryID) ON DELETE CASCADE,
	CONSTRAINT FK_itemID FOREIGN KEY(itemID) REFERENCES Items(itemID) ON DELETE CASCADE
)
GO


