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
Phone VARCHAR(35),
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
						('Jeremy','Cline', 'client', '204-230-1234', 'jCline@robertsoncollege.net', '12345', 0),
						('laine','North', 'client', '204-345-4567', 'lnorth@robertsoncollege.net', '12345', 0),
						('Paul','Clark', 'client', '204-575-3284', 'pclark@robertsoncollege.net', '12345', 0),
						('Linda','Babe', 'client', '204-222-8763', 'lbabe@robertsoncollege.net', '12345', 0),
						('Belinda','Cook', 'client', '204-232-9876', 'bcook@robertsoncollege.net', '12345', 0),
					    ('Wendy','Ross', 'client', '204-898-2121', 'wross@robertsoncollege.net', '12345', 0),						
						('Helen','Thomas', 'client', '204-212-3432', 'hthomas@robertsoncollege.net', '12345', 0),
						('Selena','Clark', 'client', '204-243-2222', 'sclark@robertsoncollege.net', '12345', 0),
						('Ralph','Black', 'client', '204-212-3245', 'rblack@robertsoncollege.net', '12345', 0),
						('Ellen','Esteban', 'client', '204-230-3131', 'eesteban@robertsoncollege.net', '12345', 0),
						('Emily','Mask', 'client', '204-989-0833', 'emask@robertsoncollege.net', '12345', 0),
						('Ernest','Wolf', 'client', '204-962-3244', 'ewolf@robertsoncollege.net', '12345', 0),
						('Trello','Works', 'client', '204-453-2736', 'tworks@robertsoncollege.net', '12345', 0),
						('Robert','Son', 'client', '204-312-3232', 'rson@robertsoncollege.net', '12345', 0),
						('Johanee','Paul', 'assignee', '204-345-4567', 'jpaul@robertsoncollege.net', '12345', 2),
						('Ronald','Moris', 'assignee', '204-345-4567', 'rmoris@robertsoncollege.net', '12345', 2),
						('Walter','Mckay','assignee','204-414-3123','wmckay@robertsoncollege.net','12345',2),
						('Brian','Mcleod','assignee','204-583-8766','bmcleod@robertsoncollege.net','12345',2),
						('Stacy','Ross','assignee','204-423-8765','sross@robertsoncollege.net','12345',2),
						('Winston','Katch','assignee','204-676-2222','wkatch@robertsoncollege.net','12345',2),
						('Quinton','Frost','assignee','204-898-2134','qfrost@robertsoncollege.net','12345',2),
						('Trent','Spice','assignee','204-222-2345','tSpice@robertsoncollege.net','12345',2),
						('Carl','Draft','assignee','204-211-2133','cdraft@robertsoncollege.net','12345',2),
						('Alex','Blacksmith','assignee','204-222-3131','ablacksmith@robertsoncollege.net','12345',2),
						('Erin','Mcintosh','assignee','204-414-2311','emcintosh@robertsoncollege.net','12345',2),
						('Veverly','Wormly','assignee','204-989-4653','vwormly@robertsoncollege.net','12345',2),
						('Tim','Smith','assignee','204-323-8764','tsmith@robertsoncollege.net','12345',2),
						('Mark','Abigail','assignee','204-234-0983','mAbigail@robertsoncollege.net','12345',2),
						('Fred','West','assignee','204-978-2133','fwest@robertsoncollege.net','12345',2),
						('Tilly','Graham','assignee','204-898-2134','tgraham@robertsoncollege.net','12345',2),
						('Disney','North','assignee','204-453-3261','dnorth@robertsoncollege.net','12345',2),
						('Dugald','Drive','assignee','204-978-2133','ddrive@robertsoncollege.net','12345',2),
						('Felix','Spence','assignee','204-414-3131','fspence@robertsoncollege.net','12345',2),
						('Stacy','Traverse','assignee','204-898-3535','straverse@robertsoncollege.net','12345',2),
						('Dinah','Michaels','assignee','204-999-2334','dmichaels@robertsoncollege.net','12345',2),
						('Dredge','Reaper','assignee','204-241-3245','dreaper@robertsoncollege.net','12345',2),
						('Tara','Young','assignee','204-898-2344','tyoung@robertsoncollege.net','12345',2)				
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
							('Internet not working', 'Problem with the internet', GETDATE(), '','open', 3, 8, 9),
							('Computer will not start', 'Used laptop will not start', GETDATE(), '','open', 4, 15, 9),
							('Computer is running slow', 'All the computers in my class is slow', GETDATE(), '','open', 4, 15, 9),
							('student e-mail issue', 'I am unable to send or receive email?', GETDATE(), '','Assigned', 1, 19, 3),
							('Email conflict', 'I can not receive any email attachments?', GETDATE(), '','open', 1, 22, 10),
							('email contact issue', 'Are spaces allowed in email addresses?', GETDATE(), '','open', 1, 18, 10),
							('Network reject user', 'I can not connect to my network drive anymore?', GETDATE(), '','open', 4, 15, 9),
							('Computer will not start', 'Used laptop will not start', GETDATE(), '','open', 4, 15, 9)																										
GO
CREATE TABLE tbTicketComment
(
TicketCommentID INT IDENTITY (1,1) PRIMARY KEY,
Comments VARCHAR(MAX),HGCX 
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
ImagePath VARCHAR(MAX),69

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
INSERT INTO tbDevice(DeviceName) VALUES ('MOBILE PROJECTORS'),('COMPUTER ON WHEELS'),('SPEAKERS'),('TV MOVES')
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
