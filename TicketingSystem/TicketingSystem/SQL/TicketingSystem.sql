GO
USE MASTER
GO
DROP DATABASE dbTicketingSystem
GO
CREATE DATABASE dbTicketingSystem
GO
USE dbTicketingSystem
GO
CREATE TABLE tbUserAccessLevel
(
AccessLevelID INT IDENTITY (0,1) PRIMARY KEY,
AccessLevelName VARCHAR(10) NOT NULL
)
GO
INSERT INTO tbUserAccessLevel (AccessLevelName) VALUES ('client'),('admin'),('assignee')
GO
CREATE TABLE tbUser
(
UserID INT IDENTITY (1,1) PRIMARY KEY,
FirstName VARCHAR(35) NOT NULL,
LastName VARCHAR(35) NOT NULL,
Title VARCHAR(35) NOT NULL,
Phone VARCHAR(35) ,
Email VARCHAR(100) NOT NULL,
Password VARCHAR(20) NOT NULL,
AccessLevelID INT FOREIGN KEY REFERENCES tbUserAccessLevel(AccessLevelID)
)
GO
INSERT INTO tbUser VALUES('Elena','Nagberi', 'admin', '204-345-4567', 'elena.nagberi@robertsoncollege.net', 'elena', 1),
						('Kulwinder','Brar', 'admin', '204-999-4789', 'kulwinder.brar@robertsoncollege.net', 'brar', 1),
						('Justine','Dela Cruz', 'admin', '204-345-4567', 'justine.dela_cruz@robertsoncollege.net', '12345', 1),
						('Scott','Wachal', 'admin', '204-345-4567', 'scott.wachal@robertsoncollege.net', 'scott', 1),
						('Mark','Remoto', 'admin', '204-345-4567', 'mark.remoto@robertsoncollege.net', '12345', 1),
						('Rick','Monias', 'admin', '204-345-4567', 'rick.monias@robertsoncollege.net', '12345', 1),
						('John','Smith', 'client', '204-345-4567', 'jsmith@robertsoncollege.net', '12345', 0),
						('Martin','Johnson', 'client', '204-345-4567', 'mjohnson@robertsoncollege.net', '12345', 0),
						('Johanee','Paul', 'assignee', '204-345-4567', 'jpaul@robertsoncollege.net', '12345', 2),
						('Ronald','Moris', 'assignee', '204-345-4567', 'rmoris@robertsoncollege.net', '12345', 2)

GO
CREATE TABLE tbTicketCategory
(
TicketCategoryID  INT IDENTITY (1,1) PRIMARY KEY,
CategoryName Varchar(50)NOT NULL
)
GO
INSERT INTO  tbTicketCategory(CategoryName) VALUES ('E-MAIL ISSUE'),('PASSWORD RESET'),('NETWORK RELATED'),('COMPUTER RELATED')
GO
CREATE TABLE tbTicket
(
TicketID INT IDENTITY (1,1) PRIMARY KEY,
Summary VARCHAR(250) NOT NULL,
Description VARCHAR(MAX),
DateCreated DATETIME NOT NULL,
Priority VARCHAR(15),
Status VARCHAR(25),
TicketCategoryID INT FOREIGN KEY REFERENCES tbTicketCategory(TicketCategoryID),
ClientID INT FOREIGN KEY REFERENCES tbUser(UserID),
AssigneeID INT FOREIGN KEY REFERENCES tbUser(UserID)
)
GO
INSERT INTO tbTicket VALUES ('Computer crashed', 'One of my students computer chrashed', GETDATE(), '','unassigned', 4, 7, 9),
							('Password not working', 'One of my students password is not working', GETDATE(), '','open', 2, 8, 10),
							('E-mail not working', 'One of my students e-mail is not working', GETDATE(), '','unassigned', 1, 7, 10),
							('Internet not working', 'Problem with the internet', GETDATE(), '','open', 3, 8, 9)
GO
CREATE TABLE tbTicketComment
(
TicketCommentID INT IDENTITY (1,1) PRIMARY KEY,
Comments VARCHAR(MAX),
DateOfComments DATETIME NOT NULL,
AssigneeID INT FOREIGN KEY REFERENCES tbUser(UserID),
TicketID INT FOREIGN KEY REFERENCES tbTicket(TicketID)
)
GO
INSERT INTO tbTicketComment VALUES ('I started working on reset of the password.', GETDATE(), 10, 2)

GO
CREATE TABLE tbTimeSpentOnTicket
(
TimeSpentOnTicketID INT IDENTITY (1,1) PRIMARY KEY,
TimeSpentOnTicket TIME NOT NULL,
DateWorkedOnTicket DATE NOT NULL,
AssigneeID INT FOREIGN KEY REFERENCES tbUser(UserID),
TicketID INT FOREIGN KEY REFERENCES tbTicket(TicketID)
)
GO
CREATE TABLE tbTicketAttachment
(
TicketAttachmentID INT IDENTITY (1,1) PRIMARY KEY,
ImagePath VARCHAR(MAX),
ClientID INT FOREIGN KEY REFERENCES tbUser(UserID),
TicketID INT FOREIGN KEY REFERENCES tbTicket(TicketID),
DateOfAttachment DATE
)
GO
CREATE TABLE tbDevice
(
DeviceID INT IDENTITY (1,1) PRIMARY KEY,
DeviceName VARCHAR(50) NOT NULL
)
GO
INSERT INTO tbDevice(DeviceName) VALUES ('MOBILE PROJECTORS'),('COMPUTER ON WHEELS'),('SPEEKERS'),('TV MOVES')
GO
CREATE TABLE tbDeviceBooking
(
DeviceBookingID INT IDENTITY (1,1) PRIMARY KEY,
DateStart DATETIME NOT NULL,
DateEnd DATETIME NOT NULL,
DeviceID INT FOREIGN KEY REFERENCES tbDevice(DeviceID),
ClientID INT FOREIGN KEY REFERENCES tbUser(UserID)
)
GO

SELECT * FROM tbUserAccessLevel
SELECT * FROM tbUser
SELECT * FROM tbDevice
SELECT * FROM tbTicketCategory
SELECT * FROM tbTicketComment
