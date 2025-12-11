/*=================================================================================
FileName: inserting_sample_data.sql
Programmer: Muhammed Uwais
Description: This file will insert sample data into our tables we created.
======================================================================================*/

---The order in which we added data to the tables is the same as when we created the tables, this is so we avoid any FK constraint errors.

USE The_Forgotten_GuardiansRPG
GO
INSERT INTO ErrorTypeLog(errorTypeName,errorDescription)
VALUES
('Connection Error','The game was unable to establish a connection to the server'),
('Login Failure','Player login attempt failed due to invalid credentials.'),
('Data Corruption', 'Corrupted Data detected in player data.'),
('Timeout Error','Player session timed out due to inactivity')

PRINT 'Data inserted successfuly'

GO

INSERT INTO ErrorLog(errorMessage,errorTime,errorTypeID)
VALUES
('Connection Error', GETDATE(),'1'),
('Login Failure',GETDATE(),'2'),
('Data Corrupted',GETDATE(),'3')
GO

INSERT INTO Session_Details(loginTime,playerDevice,playerIPaddress,logoutTime,errorID)
VALUES
('10:32','DELL PC','192.168.02.30','13:45',NULL),
('11:30','PC','192.168.10.20','17:55',NULL),
('18:22','Xbox','192.168.5.6','20:22',NULL),
('14:08','PC','192.168.22.54','22:35',NULL),
('17:48:00', 'Laptop', '192.168.1.218', '19:47:00', 2),
('14:18:00', 'PC', '192.168.1.205', '15:50:00', NULL),
('11:38:00', 'Mobile', '192.168.1.36', '12:32:00', NULL),
('13:57:00', 'Tablet', '192.168.1.109', '15:40:00', NULL),
('09:45:00', 'PC', '192.168.1.141', '11:07:00', NULL),
('11:35:00', 'Laptop', '192.168.1.28', '13:00:00', NULL),
('15:04:00', 'PC', '192.168.1.174', '15:55:00', NULL),
('15:22:00', 'Tablet', '192.168.1.62', '16:57:00', 3),
('16:02:00', 'Mobile', '192.168.1.77', '17:51:00', NULL),
('10:48:00', 'Mobile', '192.168.1.7', '11:43:00', NULL),
('14:45:00', 'Mobile', '192.168.1.200', '15:57:00', NULL),
('11:53:00', 'Laptop', '192.168.1.186', '13:01:00', NULL),
('13:49:00', 'Laptop', '192.168.1.216', '15:20:00', NULL),
('14:35:00', 'Mobile', '192.168.1.250', '16:19:00', NULL),
('13:15:00', 'Tablet', '192.168.1.53', '15:05:00', NULL),
('14:00:00', 'Laptop', '192.168.1.156', '15:29:00', 3),
('16:36:00', 'Tablet', '192.168.1.66', '17:24:00', NULL),
('13:33:00', 'Tablet', '192.168.1.165', '14:22:00', NULL),
('11:51:00', 'Tablet', '192.168.1.163', '13:48:00', NULL),
('13:04:00', 'PC', '192.168.1.134', '13:57:00', NULL),
('10:30:00', 'PC', '192.168.1.107', '11:07:00', NULL),
('14:36:00', 'Mobile', '192.168.1.194', '15:14:00', NULL),
('10:42:00', 'PC', '192.168.1.159', '11:43:00', NULL),
('17:23:00', 'Tablet', '192.168.1.188', '18:47:00', 1),
('15:51:00', 'Tablet', '192.168.1.47', '16:32:00', NULL),
('09:45:00', 'Mobile', '192.168.1.111', '11:42:00', NULL),
('12:05:00', 'Tablet', '192.168.1.81', '13:35:00', NULL),
('17:07:00', 'PC', '192.168.1.17', '18:45:00', NULL),
('15:38:00', 'Laptop', '192.168.1.2', '17:22:00', NULL),
('16:17:00', 'Tablet', '192.168.1.225', '16:52:00', NULL),
('17:13:00', 'Laptop', '192.168.1.242', '18:14:00', NULL),
('09:23:00', 'Mobile', '192.168.1.174', '10:47:00', NULL),
('16:42:00', 'PC', '192.168.1.106', '17:37:00', NULL),
('17:25:00', 'Tablet', '192.168.1.36', '18:35:00', NULL),
('15:19:00', 'Laptop', '192.168.1.111', '17:17:00', NULL),
('12:29:00', 'PC', '192.168.1.67', '13:11:00', NULL),
('12:46:00', 'Tablet', '192.168.1.195', '13:43:00', NULL),
('10:50:00', 'Tablet', '192.168.1.120', '12:37:00', NULL),
('11:41:00', 'Tablet', '192.168.1.177', '13:33:00', NULL),
('12:28:00', 'PC', '192.168.1.74', '13:42:00', NULL),
('14:23:00', 'Laptop', '192.168.1.21', '15:16:00', NULL),
('16:24:00', 'PC', '192.168.1.125', '17:37:00', NULL),
('17:26:00', 'Tablet', '192.168.1.13', '18:52:00', NULL),
('15:20:00', 'Laptop', '192.168.1.216', '17:19:00', NULL),
('17:01:00', 'PC', '192.168.1.5', '18:04:00', NULL)
GO


INSERT INTO Players (playerName, playerEmail) 
VALUES
('John Smith', 'john.smith@example.com'),
('Jane Doe', 'jane.doe@example.com'),
('Michael Johnson', 'michael.johnson@example.com'),
('Emily Davis', 'emily.davis@example.com'),
('Robert Brown', 'robert.brown@example.com'),
('Jessica Wilson', 'jessica.wilson@example.com'),
('David Miller', 'david.miller@example.com'),
('Laura Moore', 'laura.moore@example.com'),
('Thomas Anderson', 'thomas.anderson@example.com'),
('Sarah Taylor', 'sarah.taylor@example.com'),
('James Clark', 'james.clark@example.com'),
('Anna Wright', 'anna.wright@example.com'),
('Matthew Turner', 'matthew.turner@example.com'),
('Olivia Evans', 'olivia.evans@example.com'),
('Daniel Harris', 'daniel.harris@example.com'),
('Sophia Lewis', 'sophia.lewis@example.com'),
('Christopher Walker', 'christopher.walker@example.com'),
('Chloe Robinson', 'chloe.robinson@example.com'),
('Brian Young', 'brian.young@example.com'),
('Isabella King', 'isabella.king@example.com'),
('Mark Hall', 'mark.hall@example.com'),
('Victoria Allen', 'victoria.allen@example.com'),
('Andrew Scott', 'andrew.scott@example.com'),
('Nicole Adams', 'nicole.adams@example.com'),
('Peter Baker', 'peter.baker@example.com'),
('Ethan Mitchell', 'ethan.mitchell@example.com'),
('Samantha Green', 'samantha.green@example.com'),
('Brandon Martinez', 'brandon.martinez@example.com'),
('Hannah Clark', 'hannah.clark@example.com'),
('Zoe Walker', 'zoe.walker@example.com')

GO

INSERT INTO Monthly_Subscription (paymentDate, expirationDate, amountPaid)
VALUES
('2023-01-01', '2024-01-01', 15.00), 
('2022-03-01', '2023-03-01', 15.00), 
('2024-04-01', '2025-04-01', 15.00), 
('2021-06-01', '2022-06-01', 15.00), 
('2024-07-01', '2025-07-01', 15.00),
('2024-05-31', '2025-05-31', 15.00),
('2023-01-01', '2024-01-01', 15.00),
('2023-12-16', '2024-12-15', 15.00),
('2023-09-24', '2024-09-23', 15.00),
('2023-01-10', '2024-01-10', 15.00),
('2024-10-04', '2025-10-04', 15.00),
('2023-02-16', '2024-02-16', 15.00),
('2023-01-16', '2024-01-16', 15.00),
('2023-04-23', '2024-04-22', 15.00),
('2022-07-07', '2023-07-07', 15.00),
('2023-02-09', '2024-02-09', 15.00),
('2023-06-17', '2024-06-16', 15.00),
('2021-03-28', '2022-03-28', 15.00),
('2022-02-21', '2023-02-21', 15.00),
('2023-07-02', '2024-07-01', 15.00),
('2023-05-26', '2024-05-25', 15.00),
('2021-07-02', '2022-07-02', 15.00),
('2021-07-27', '2022-07-27', 15.00),
('2021-05-19', '2022-05-19', 15.00),
('2021-07-29', '2022-07-29', 15.00),
('2022-01-01', '2023-01-01', 15.00),
('2022-02-04', '2023-02-04', 15.00),
('2022-02-08', '2023-02-08', 15.00),
('2023-09-28', '2024-09-27', 15.00),
('2021-08-18', '2022-08-18', 15.00),
('2022-12-30', '2023-12-30', 15.00),
('2023-05-16', '2024-05-15', 15.00),
('2022-05-03', '2023-05-03', 15.00),
('2021-02-18', '2022-02-18', 15.00)

GO

INSERT INTO Account(accountName,creationDate,playerID,sessionID,subscriptionID)
VALUES
('FireMage96','2021.06.23',2,6,2),
('TheDivergentXx','2023.05.23',3,7,3),
('FireChaser101','2024.06.24',4,8,4),
('ShadowAssassin', '2023-05-03', 5, 9, 5),
('GuardianOfLight', '2023-03-02', 6, 10, 6),
('IronFist', '2021-06-13', 7, 11, 7),
('BladeMaster', '2021-04-23', 8, 12, 8),
('PhoenixFlare', '2022-07-02', 9, 13, 9),
('DarkShadow', '2022-07-01', 10, 14, 10),
('CelestialGuardian', '2021-03-25', 11, 15, 11),
('Stormbreaker23', '2021-02-13', 12, 16, 12),
('InfernoRider', '2023-08-22', 13, 17, 13),
('VoidWraith', '2022-01-11', 14, 18, 14),
('SkyHunter', '2021-02-18', 15, 19, 15),
('ThunderGod', '2021-04-17', 16, 20, 16),
('FrostKnight', '2022-08-13', 17, 21, 17),
('RogueWarrior', '2023-09-21', 18, 22, 18),
('DragonSlayer88', '2023-04-05', 19, 23, 19),
('NightStalker', '2022-03-16', 20, 24, 20),
('WindRunner', '2021-06-03', 21, 25, 21),
('EarthShaker', '2021-02-15', 22, 26, 22),
('SilverArcher', '2021-03-06', 23, 27, 23),
('CrimsonBlade', '2022-08-14', 24, 28, 24)

GO


INSERT INTO Account_Status(accountStatus,accountID)
VALUES
('ACTIVE',5),
('ACTIVE',6),
('ACTIVE',7),
('BLOCKED',8),
('ACTIVE', 21),
('ACTIVE', 22),
('ACTIVE', 23),
('BLOCKED', 24),
('ACTIVE', 25),
('BLOCKED', 26),
('ACTIVE', 27),
('ACTIVE', 28),
('BLOCKED', 29),
('ACTIVE', 30)

GO

INSERT INTO Game_Characters (CharacterName, characterRole, characterDescription, accountID) 
VALUES
('The Lightbringer', 'Healer/Support', 'The Lightbringer is chosen by the Celestial Beings of Radiance.', 5),
('The Voidwalker', 'Assassin/Debuffer', 'The Voidwalker uses the power of shadows to dismantle enemies.', 6),
('The Earthshaper', 'Tank/Defender', 'The Earthshaper channels the natural life forces of the planet.', 7),
('The Flamewielder', 'DPS/Mage', 'The Flamewielder channels their fury into raw power.', 8),
('The Lightbringer', 'Healer/Support', 'The Lightbringer is chosen by the Celestial Beings of Radiance.', 21),
('The Voidwalker', 'Assassin/Debuffer', 'The Voidwalker uses the power of shadows to dismantle enemies.', 22),
('The Earthshaper', 'Tank/Defender', 'The Earthshaper channels the natural life forces of the planet.', 23),
('The Flamewielder', 'DPS/Mage', 'The Flamewielder channels their fury into raw power.', 24),
('The Lightbringer', 'Healer/Support', 'The Lightbringer is chosen by the Celestial Beings of Radiance.', 25),
('The Voidwalker', 'Assassin/Debuffer', 'The Voidwalker uses the power of shadows to dismantle enemies.', 26),
('The Earthshaper', 'Tank/Defender', 'The Earthshaper channels the natural life forces of the planet.', 27),
('The Flamewielder', 'DPS/Mage', 'The Flamewielder channels their fury into raw power.', 28),
('The Lightbringer', 'Healer/Support', 'The Lightbringer is chosen by the Celestial Beings of Radiance.', 29),
('The Voidwalker', 'Assassin/Debuffer', 'The Voidwalker uses the power of shadows to dismantle enemies.', 30)

GO

INSERT INTO Team (teamName, teamDescription, teamMoralStance, teamGoal) 
VALUES
('The Guardians of Hope', 'They work to rebuild Earth through unity and cooperation.', 'Pure good', 'Restore balance and protect humanity from demonic influence.'),
('The Covenant of Ashes', 'They seek to use chaos to seize control and reshape Earth under their rule.', 'Evil', 'Gain control over Earth by any means necessary.'),
('The Twilight Syndicate', 'A morally ambiguous group who balance both good and evil.', 'Neutral', 'Create a world where neither side dominates.')
GO

INSERT INTO Game_Character_Team(characterID,teamID)
VALUES
(1,2),
(2,1),
(3,2),
(4,3)

GO

INSERT INTO Skillset_Level(skillsetLevel)
VALUES
('Beginner'),
('Intermediate'),
('Advanced'),
('Hard'),
('God Mode')

GO

INSERT INTO Character_Skillset (skillName, skillEffect, skillType, characterID, skillsetLevelID) 
VALUES

('Healing Light', 'Heals allies over time', 'Healer', 1, 3),
('Blessing of Hope', 'Increases defense and attack power', 'Support', 1, 2),
('Sunfire Beam', 'Burns enemies, especially demonic creatures', 'Offensive', 1, 3),
('Guardian’s Shield', 'Protective barrier reducing damage', 'Defensive', 1, 2),
('Shadowstep', 'Teleport behind enemies and become invisible', 'Assassin', 2, 3),
('Dread Aura', 'Weakens enemies, reducing attack and defense', 'Debuff', 2, 2),
('Healing Light', 'Heals allies over time', 'Healer', 1, 5),
('Blessing of Hope', 'Increases defense and attack power', 'Support', 1, 1),
('Sunfire Beam', 'Burns enemies, especially demonic creatures', 'Offensive', 3, 1),
('Guardian’s Shield', 'Protective barrier reducing damage', 'Defensive', 3, 3),
('Shadowstep', 'Teleport behind enemies and become invisible', 'Assassin', 3, 3),
('Dread Aura', 'Weakens enemies, reducing attack and defense', 'Debuff', 3, 5),
('Healing Light', 'Heals allies over time', 'Healer', 1, 3),
('Blessing of Hope', 'Increases defense and attack power', 'Support', 2, 2),
('Sunfire Beam', 'Burns enemies, especially demonic creatures', 'Offensive', 1, 1),
('Guardian’s Shield', 'Protective barrier reducing damage', 'Defensive', 2, 4),
('Shadowstep', 'Teleport behind enemies and become invisible', 'Assassin', 4, 3),
('Dread Aura', 'Weakens enemies, reducing attack and defense', 'Debuff', 2, 4),
('Healing Light', 'Heals allies over time', 'Healer', 3, 5),
('Blessing of Hope', 'Increases defense and attack power', 'Support', 1, 5),
('Sunfire Beam', 'Burns enemies, especially demonic creatures', 'Offensive', 1, 1),
('Guardian’s Shield', 'Protective barrier reducing damage', 'Defensive', 1, 5),
('Shadowstep', 'Teleport behind enemies and become invisible', 'Assassin', 4, 5),
('Dread Aura', 'Weakens enemies, reducing attack and defense', 'Debuff', 2, 1),
('Healing Light', 'Heals allies over time', 'Healer', 4, 4),
('Blessing of Hope', 'Increases defense and attack power', 'Support', 3, 4),
('Sunfire Beam', 'Burns enemies, especially demonic creatures', 'Offensive', 3, 1),
('Guardian’s Shield', 'Protective barrier reducing damage', 'Defensive', 4, 3),
('Shadowstep', 'Teleport behind enemies and become invisible', 'Assassin', 1, 5)

GO

INSERT INTO Inventory (inventorySlotNumber, inventoryQuantity, characterID) 
VALUES
(1, 3, 1), 
(2, 5, 2), 
(3, 1, 3), 
(4, 2, 4), 
(5, 4, 4),
(1, 3, 1), 
(2, 5, 2), 
(3, 1, 3), 
(4, 2, 4), 
(5, 4, 1), 
(1, 3, 2), 
(2, 5, 3), 
(3, 1, 4), 
(4, 2, 1), 
(5, 4, 2), 
(1, 3, 3), 
(2, 5, 4), 
(3, 1, 1), 
(4, 2, 2), 
(5, 4, 3), 
(1, 3, 4), 
(2, 5, 1), 
(3, 1, 2), 
(4, 2, 3), 
(5, 4, 4), 
(1, 3, 1), 
(2, 5, 2), 
(3, 1, 3), 
(4, 2, 4), 
(5, 4, 1), 
(1, 3, 2), 
(2, 5, 3), 
(3, 1, 4), 
(4, 2, 1), 
(5, 4, 2)

GO

INSERT INTO Items (itemName, itemType) 
VALUES
('Celestial Fragment', 'Power Booster'),
('Hellfire Dagger', 'Weapon'),
('Phoenix Feather', 'Resurrection Tool'),
('Guardian’s Amulet', 'Protection Item'),
('Infernal Tome', 'Dark Magic Book')

GO


INSERT INTO Items_Functions (functionName, functionEffect, itemID) 
VALUES
('Boost Abilities by 25%', 'Enhances all abilities temporarily', 1),
('Increased Crit Damage', 'Grants critical hit boost and burn status', 2),
('Revives after death', 'Resurrects with half health and damage boost', 3),
('Absorbs Damage', 'Passive shield absorbing damage', 4),
('Dark Magic Access', 'Grants powerful dark magic but drains health', 5);

GO


INSERT INTO Inventory_Items (quantity, inventoryID, itemID) 
VALUES
(3, 6, 1), 
(5, 7, 2), 
(1, 8, 3), 
(2, 9, 4), 
(4, 10, 5),
(2, 11, 5),
(2, 12, 1),
(4, 13, 1),
(5, 14, 5),
(4, 15, 3),
(1, 16, 3),
(4, 17, 3),
(3, 18, 1),
(1, 19, 2),
(3, 20, 1),
(4, 21, 2),
(4, 22, 4),
(1, 23, 5),
(1, 24, 2),
(1, 25, 2),
(1, 26, 1),
(3, 27, 5),
(5, 28, 3),
(4, 29, 4),
(5, 30, 5),
(3, 31, 2),
(5, 32, 2),
(3, 33, 2),
(1, 34, 4),
(2, 35, 3)

GO


