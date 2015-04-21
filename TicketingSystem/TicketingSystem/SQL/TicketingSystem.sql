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

INSERT INTO tbUser VALUES ('Unasigned','Unasigned', 'Unasigned', 'Unasigned', 'Unasigned@robertsoncollege.net', 'Unasigned', 2),
						('Elena','Nagberi', 'admin', '(204) 345-4567', 'elena.nagberi@robertsoncollege.net', 'elena', 1),
						('Kulwinder','Brar', 'admin', '(204) 345-4567', 'kulwinder.brar@robertsoncollege.net', 'brar', 1),
						('Justine','Dela Cruz', 'admin', '(204) 345-4567', 'justine.dela_cruz@robertsoncollege.net', '12345', 1),
						('Scott','Wachal', 'admin', '(204) 345-4567', 'scott.wachal@robertsoncollege.net', 'scott', 1),
						('Mark','Remoto', 'admin', '(204) 345-4567', 'mark.remoto@robertsoncollege.net', '12345', 1),
						('Rick','Monias', 'admin', '(204) 345-4567', 'rick.monias@robertsoncollege.net', '12345', 1),
						('John','Smith', 'client', '(204) 345-4567', 'jsmith@robertsoncollege.net', '12345', 0),
						('Martin','Johnson', 'client', '(204) 345-4567', 'mjohnson@robertsoncollege.net', '12345', 0),
						('Jeremy','Cline', 'client', '(204) 345-1234', 'jCline@robertsoncollege.net', '12345', 0),
						('laine','North', 'client', '(204) 345-1234', 'lnorth@robertsoncollege.net', '12345', 0),
						('Paul','Clark', 'client', '(204) 345-1234', 'pclark@robertsoncollege.net', '12345', 0),
						('Linda','Babe', 'client', '(204) 345-1234', 'lbabe@robertsoncollege.net', '12345', 0),
						('Belinda','Cook', 'client', '(204) 345-1234', 'bcook@robertsoncollege.net', '12345', 0),
					    ('Wendy','Ross', 'client', '(204) 345-2211', 'wross@robertsoncollege.net', '12345', 0),						
						('Helen','Thomas', 'client', '(204) 345-2211', 'hthomas@robertsoncollege.net', '12345', 0),
						('Selena','Clark', 'client', '(204) 345-2211', 'sclark@robertsoncollege.net', '12345', 0),
						('Ralph','Black', 'client', '(204) 345-2211', 'rblack@robertsoncollege.net', '12345', 0),
						('Ellen','Esteban', 'client', '(204) 345-2211', 'eesteban@robertsoncollege.net', '12345', 0),
						('Emily','Mask', 'client', '(204) 345-2324', 'emask@robertsoncollege.net', '12345', 0),
						('Ernest','Wolf', 'client', '(204) 345-2324', 'ewolf@robertsoncollege.net', '12345', 0),
						('Trello','Works', 'client', '(204) 345-2324', 'tworks@robertsoncollege.net', '12345', 0),
						('Robert','Son', 'client', '(204) 345-2324', 'rson@robertsoncollege.net', '12345', 0),
						('Johanee','Paul', 'assignee', '(204) 345-2324', 'jpaul@robertsoncollege.net', '12345', 2),
						('Ronald','Moris', 'assignee', '(204) 345-2324', 'rmoris@robertsoncollege.net', '12345', 2),
						('Walter','Mckay','assignee','(204) 345-8765','wmckay@robertsoncollege.net','12345',2),
						('Brian','Mcleod','assignee','(204) 345-8765','bmcleod@robertsoncollege.net','12345',2),
						('Stacy','Ross','assignee','(204) 345-8765','sross@robertsoncollege.net','12345',2),
						('Winston','Katch','assignee','(204) 345-8765','wkatch@robertsoncollege.net','12345',2),
						('Quinton','Frost','assignee','(204) 345-4876','qfrost@robertsoncollege.net','12345',2),
						('Trent','Spice','assignee','(204) 345-4876','tSpice@robertsoncollege.net','12345',2),
						('Carl','Draft','assignee','(204) 345-4876','cdraft@robertsoncollege.net','12345',2),
						('Alex','Blacksmith','assignee','(204) 345-4876','ablacksmith@robertsoncollege.net','12345',2),
						('Erin','Mcintosh','assignee','(204) 345-4876','emcintosh@robertsoncollege.net','12345',2),
						('Veverly','Wormly','assignee','(204) 345-4876','vwormly@robertsoncollege.net','12345',2),
						('Tim','Smith','assignee','(204) 345-4876','tsmith@robertsoncollege.net','12345',2),
						('Mark','Abigail','assignee','(204) 345-4876','mAbigail@robertsoncollege.net','12345',2),
						('Fred','West','assignee','(204) 345-4876','fwest@robertsoncollege.net','12345',2),
						('Tilly','Graham','assignee','(204) 345-2134','tgraham@robertsoncollege.net','12345',2),
						('Disney','North','assignee','(204) 345-2134','dnorth@robertsoncollege.net','12345',2),
						('Dugald','Drive','assignee','(204) 345-2134','ddrive@robertsoncollege.net','12345',2),
						('Felix','Spence','assignee','(204) 345-2134','fspence@robertsoncollege.net','12345',2),
						('Stacy','Traverse','assignee','(204) 345-2134','straverse@robertsoncollege.net','12345',2),
						('Dinah','Michaels','assignee','(204) 345-8978','dmichaels@robertsoncollege.net','12345',2),
						('Dredge','Reaper','assignee','(204) 345-8978','dreaper@robertsoncollege.net','12345',2),
						('Tara','Young','assignee','(204) 345-8978','tyoung@robertsoncollege.net','12345',2)			

GO
CREATE TABLE tbTicketCategory
(
TicketCategoryID  INT IDENTITY (1,1) PRIMARY KEY,
CategoryName VARCHAR(50)NOT NULL
)
GO
INSERT INTO  tbTicketCategory(CategoryName) VALUES ('E-MAIL ISSUE'),('PASSWORD RESET'),('NETWORK RELATED'),('COMPUTER RELATED')

-----------------------------tbTicketStatus
GO
CREATE TABLE tbTicketStatus
(
TicketStatusID INT IDENTITY(1,1) PRIMARY KEY,
TicketStatusName VARCHAR(35)
)
INSERT INTO  tbTicketStatus Values('Open Tickets'),('Unassigned Tickets'),('Closed Tickets')
-------------------------------
CREATE TABLE tbTicketPriority
(
TicketPriorityID INT IDENTITY(1,1) PRIMARY KEY,
TicketPriorityName VARCHAR(35)
)
INSERT INTO  tbTicketPriority Values('High'),('Medium'),('Low')
--------------------


GO

CREATE TABLE tbTicket
(
TicketID INT IDENTITY (1,1) PRIMARY KEY,
Summary VARCHAR(250) NOT NULL,
Description VARCHAR(MAX),
DateCreated DATETIME NOT NULL,
TicketPriorityID INT FOREIGN KEY REFERENCES tbTicketPriority(TicketPriorityID),
TicketStatusID INT FOREIGN KEY REFERENCES tbTicketStatus(TicketStatusID),
TicketCategoryID INT FOREIGN KEY REFERENCES tbTicketCategory(TicketCategoryID),
ClientID INT FOREIGN KEY REFERENCES tbUser(UserID),
AssigneeID INT FOREIGN KEY REFERENCES tbUser(UserID)
)
GO
INSERT INTO tbTicket VALUES ('Computer crashed', 'One of my students computer chrashed', GETDATE(), 2,2, 4, 7, 26),
							('Password not working', 'One of my students password is not working', GETDATE(), 1,1, 2, 8, 27),
							('E-mail not working', 'One of my students e-mail is not working', GETDATE(), 3,3, 1, 7, 27),
							('Internet not working', 'Problem with the internet', GETDATE(), 1,1, 3, 8, 26),
							('Computer will not start', 'Used laptop will not start', GETDATE(), 3,1, 4, 15, 26),
							('Computer is running slow', 'All the computers in my class is slow', GETDATE(), 2,2, 4, 15, 26),
							('student e-mail issue', 'I am unable to send or receive email?', GETDATE(), 3,2, 1, 19, 3),
							('Email conflict', 'I can not receive any email attachments?', GETDATE(), 1,1, 1, 22, 27),
							('email contact issue', 'Are spaces allowed in email addresses?', GETDATE(), 2,1, 1, 18, 27),
							('Network reject user', 'I can not connect to my network drive anymore?', GETDATE(), 3,2, 4, 15, 26),
							('Computer will not start', 'Used laptop will not start', GETDATE(), 3,1, 4, 15, 26)
-----------------------------------
GO 
CREATE PROCEDURE spGetAssignee
AS
BEGIN
 SELECT UserID, FirstName FROM tbUser WHERE AccessLevelID = 1 or AccessLevelID = 2
END

------------------
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
DateOfAttachment DATETIME
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





-- Select from User Access Level table

GO
CREATE PROCEDURE spGetUserAccessLevel
AS
BEGIN
	SELECT * FROM tbUserAccessLevel
END

GO
EXEC spGetUserAccessLevel

-- Insert information into User Access Level table
GO
CREATE PROCEDURE spInsertUserAccessLevel
(
	@AccessLevelName VARCHAR(5)
)
AS
BEGIN
	INSERT INTO tbUserAccessLevel (AccessLevelName) VALUES (@AccessLevelName)
END
GO
EXEC spInsertUserAccessLevel @AccessLevelName = 'admin'


-- Update information from User Access Level table

GO
CREATE PROCEDURE spUpdateUserAccessLevel
(
	@AccessLevelID INT,
	@AccessLevelName VARCHAR(5)
)
AS
BEGIN
	UPDATE tbUserAccessLevel SET AccessLevelName=@AccessLevelName WHERE AccessLevelID=@AccessLevelID
END
GO
EXEC spUpdateUserAccessLevel @AccessLevelName = 'admin', @AccessLevelID=2


-- Delere record from the User Access Level table

GO
CREATE PROCEDURE spDeleteUserAccessLevel
(
	@AccessLevelID INT
)
AS
BEGIN
	DELETE FROM tbUserAccessLevel WHERE AccessLevelID=@AccessLevelID
END
--GO
--EXEC spDeleteUserAccessLevel @AccessLevelID = 1


--Store procedure for Login

GO
CREATE PROCEDURE spLogin
(
	@Email VARCHAR(100),
	@Password VARCHAR(20) 
)
AS
BEGIN
	SELECT * FROM tbUser c

	JOIN tbUserAccessLevel u ON c.AccessLevelID = u.AccessLevelID

	WHERE Email = @Email AND Password = @Password
END


GO
--EXEC spLogin @Email=maria, @Password=mi88new






---------------------------------tbUser-------------------------------------------------------------------------------------------

-- Show the User information

GO
CREATE PROCEDURE spGetUser
(
	@UserID INT = NULL
)
AS
BEGIN
	SELECT * FROM tbUser
			WHERE UserID = ISNULL(@UserID,UserID)
END
GO
EXEC spGetUser



GO
CREATE PROCEDURE spInsertUser
(
	@FirstName VARCHAR(35),
	@LastName VARCHAR(35),
	@Title VARCHAR(35),
	@Phone VARCHAR(35),
	@Email VARCHAR(100),
	@Password VARCHAR(20),
	@AccessLevelID INT 
)
AS
BEGIN
		INSERT INTO tbUser (FirstName, LastName,Title, Phone,Email,Password,AccessLevelID) VALUES
		(@FirstName,@LastName,@Title, @Phone, @Email, @Password,@AccessLevelID)
		--SELECT @@IDENTITY AS [Newest UserID]
END
--GO
--EXEC spInsertUser @FirstName='John', @LastName='Donlop',@Title='teacher', @Phone='(204)-344-9870', @Email='jdonlop@yahoo.com', @Password='john99', @AccessLevelID = 0


--Update customer information

GO
CREATE PROCEDURE spUpdateUser

(
	@UserID INT,
	@FirstName VARCHAR(35),
	@LastName VARCHAR(35),
	@Title VARCHAR(35),
	@Phone VARCHAR(35),
	@Email VARCHAR(100),
	@Password VARCHAR(20),
	@AccessLevelID INT 
)
AS
BEGIN
	UPDATE tbUser SET FirstName=@FirstName, LastName=@LastName, Title=@Title, Phone=@Phone, Email=@Email,
	 Password=@Password, AccessLevelID=@AccessLevelID
	WHERE UserID=@UserID
END
--GO
--EXEC spUpdateUser @FirstName='Dimitar', @LastName='Dimitrov', @Phone='(349)-212-8798', @Title = 'assignee',
--					@Email='idimitrov@gmail.com', @Password='ivan95', @AccessLevelID=2, @UserID=9



--Delete user

GO
CREATE PROCEDURE spDeleteUser
(
	@UserID INT
)
AS
BEGIN
	DELETE FROM tbUser WHERE UserID=@UserID
END
--GO
--EXEC spDeleteUser @UserID=10


-------------------------------------tbTicketCategory---------------------------------------------------------------------

--Show Ticket category

GO
CREATE PROCEDURE spGetTicketCategory
(
	@TicketCategoryID INT = NULL
)
AS
BEGIN
SELECT * FROM tbTicketCategory
	WHERE TicketCategoryID = ISNULL(@TicketCategoryID,TicketCategoryID)
END
--GO
--EXEC spGetTicketCategory


--Insert information into Ticket category table

GO
CREATE PROCEDURE spInsertTicketCategory
(
	@CategoryName VARCHAR(50)
)
AS
BEGIN
	INSERT INTO tbTicketCategory VALUES (@CategoryName)
END
--GO
--EXEC spInsertTicketCategory @CategoryName='TV issue'


--Update Ticket category

GO
CREATE PROCEDURE spUpdateTicketCategory
(
	@TicketCategoryID INT,
	@CategoryName VARCHAR(50)
)
AS
BEGIN
		UPDATE tbTicketCategory
		SET CategoryName=@CategoryName
		WHERE TicketCategoryID=@TicketCategoryID
END
--GO
--EXEC spUpdateTicketCategory @CategoryName='E-mail issues', @TicketCategoryID=3


--Delete Ticket category

GO
CREATE PROCEDURE spDeleteTicketCategory
(
	@TicketCategoryID INT
)
AS
BEGIN
	DELETE FROM tbTicketCategory WHERE TicketCategoryID=@TicketCategoryID
END
--GO
--EXEC spDeleteTicketCategory @TicketCategoryID=3





-----------------------------tbTicket---------------------------------------------------------------------


--Get Ticket/s from the table tbTicket
GO
CREATE PROCEDURE spGetTicket
(
	@TicketID INT = NULL
)
AS
BEGIN
	SELECT * FROM tbTicket
	WHERE TicketID = ISNULL(@TicketID,TicketID)
END
GO
EXEC spGetTicket


--Insert ticket into Ticket table
GO
CREATE PROCEDURE spInsertTicket
(
	@Summary VARCHAR(250),
	@Description VARCHAR(MAX),
	@DateCreated DATETIME,
	@TicketPriorityID INT = 2,
	@TicketStatusID INT = 2,
	@TicketCategoryID INT = NULL,
	@ClientID INT = NULL,
	@AssigneeID INT = 1
)
AS
BEGIN
	INSERT INTO tbTicket VALUES (@Summary,@Description,@DateCreated,@TicketPriorityID,@TicketStatusID,@TicketCategoryID,@ClientID,@AssigneeID)
	SELECT @@IDENTITY AS [Newest TicketID]
END
--GO
--EXEC spInsertTicket @Summary='Computer issues', @Description='The Big Problem with computer',@DateCreated='4/4/15',
--	@TicketStatusID=2,@TicketCategoryID=1,@ClientID=10




--Update Ticket

GO
CREATE PROCEDURE spUpdateTicket
(
	@TicketID INT,
	@Summary VARCHAR(250),
	@Description VARCHAR(MAX),
	@DateCreated DATETIME ,
	@TicketPriorityID INT,
	@TicketStatusID INT,
	@TicketCategoryID INT ,
	@ClientID INT ,
	@AssigneeID INT
)
AS
BEGIN
		UPDATE tbTicket
		SET Summary=@Summary, Description=@Description, DateCreated=@DateCreated,
		TicketPriorityID=@TicketPriorityID,TicketStatusID=@TicketStatusID,TicketCategoryID=@TicketCategoryID,ClientID=@ClientID,AssigneeID=@AssigneeID
		WHERE TicketID=@TicketID
END
--GO
--EXEC spUpdateTicket @Summary='broken screen', @Description='student laptop screen broke',@DateCreated='3/23/15',@TicketPriorityID=2,
--	@TicketStatusID=2, @TicketCategoryID=3,@ClientID=9,@AssigneeID=7,@TicketID=3


GO
CREATE PROCEDURE spEditTicket
(
	@TicketID INT,
	@Summary VARCHAR(250),
	@Description VARCHAR(MAX),
	@TicketPriorityID INT,
	@TicketStatusID INT,
	@TicketCategoryID INT ,
	@AssigneeID INT
)
AS
BEGIN
		UPDATE tbTicket
		SET Summary=@Summary, Description=@Description,
		TicketPriorityID=@TicketPriorityID,TicketStatusID=@TicketStatusID,TicketCategoryID=@TicketCategoryID,AssigneeID=@AssigneeID
		WHERE TicketID=@TicketID
END
--GO
--EXEC spEditTicket @Summary='broken screen', @Description='student laptop screen broke',@TicketPriorityID=2,
--	@TicketStatusID=2, @TicketCategoryID=3,@AssigneeID=7,@TicketID=3

　
--Delete from tbTicket

GO
CREATE PROCEDURE spDeleteTicket
(
	@TicketID INT
)
AS
BEGIN
	DELETE FROM tbTicket WHERE TicketID=@TicketID
END
--GO
--EXEC spDeleteTicket @TicketID=3


--Search for product

GO
CREATE PROCEDURE spSearchTicket
(
	@Description VARCHAR(MAX)
)
AS
BEGIN
	SELECT * FROM tbTicket WHERE Description LIKE '%' + @Description + '%'
END
GO
EXEC spSearchTicket @Description='com'


-----------------------------tbTicketComment---------------------------------------------------------------------


--Get TicketComment/s from the table tbTicket
GO
CREATE PROCEDURE spGetTicketComment
(
	@TicketID  INT = NULL
)
AS
BEGIN
	SELECT * FROM tbTicketComment tc
		JOIN tbTicket t ON tc.TicketID = t.TicketID
		JOIN tbUser tu ON tu.UserID = tc.AssigneeID
		WHERE t.TicketID = @TicketID
END
GO
EXEC spGetTicketComment 


--Insert ticket into TicketComment table
GO
CREATE PROCEDURE spInsertTicketComment
(
	@Comments VARCHAR(MAX),
	@DateOfComments DATETIME ,
	@AssigneeID INT,
	@TicketID INT
)
AS
BEGIN
	INSERT INTO tbTicketComment VALUES (@Comments,@DateOfComments,	@AssigneeID,@TicketID)
END
--GO
--EXEC  spInsertTicketComment @Comments='Computer issues', @DateOfComments='5/4/15',@AssigneeID=8,@TicketID= 14


--Update TicketComment


GO
CREATE PROCEDURE spUpdateTicketComment
(
		@TicketCommentID INT ,
		@Comments VARCHAR(MAX),
		@DateOfComments DATETIME ,
		@AssigneeID INT ,
		@TicketID INT

)
AS
BEGIN
		UPDATE tbTicketComment
		SET Comments=@Comments, DateOfComments=@DateOfComments,
	TicketID=@TicketID,AssigneeID=@AssigneeID
		WHERE TicketCommentID=@TicketCommentID
END
--GO
--EXEC spUpdateTicketComment @Comments ='broken screen', @DateOfComments='3/23/15',
--	 @TicketCommentID=3,@AssigneeID=7,@TicketID=3



--Delete from tbTicket

GO
CREATE PROCEDURE spDeleteTicketComment
(
	@TicketCommentID INT
)
AS
BEGIN
	DELETE FROM tbTicketComment WHERE @TicketCommentID=@TicketCommentID
END
--GO
--EXEC spDeleteTicket @TicketID=3



------------------------------tbTimeSpentOnTicket---------------------------------------------------------------------

--Get time spent from table tbTimeSpentOnTicket

GO
CREATE PROCEDURE spGetTimeSpentOnTicket
(
	@TicketID INT,
	@AssigneeID INT
	
)
AS
BEGIN
	SELECT * FROM tbTimeSpentOnTicket
	WHERE TicketID = @TicketID AND AssigneeID = @AssigneeID
END
--GO
--EXEC spGetTimeSpentOnTicket @TicketID=4, @AssigneeID=9

--Insert Time Spent On Ticket
GO
CREATE PROCEDURE spInsertTimeSpentOnTicket
(
	@TimeSpentOnTicket INT,
	@AssigneeID INT,
	@TicketID INT
)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM tbTimeSpentOnTicket WHERE AssigneeID = @AssigneeID AND TicketID = @TicketID)
		BEGIN 
			INSERT INTO tbTimeSpentOnTicket(TimeSpentOnTicket,DateWorkedOnTicket,AssigneeID,TicketID) VALUES 
						(DATEADD(MINUTE, @TimeSpentOnTicket ,0),GETDATE(),@AssigneeID,@TicketID)
END
	ELSE 
		BEGIN 
			UPDATE tbTimeSpentOnTicket SET TimeSpentOnTicket = DATEADD(MINUTE, @TimeSpentOnTicket ,TimeSpentOnTicket) WHERE AssigneeID = @AssigneeID AND TicketID = @TicketID
		END
END
GO
--EXEC spInsertTimeSpentOnTicket @TimeSpentOnTicket = 23, @AssigneeID = 2, @TicketID = 1
--Update Time Spent On Ticket SELECT * FROM tbTimeSpentOnTicket
GO
CREATE PROCEDURE spUpdateTimeSpentOnTicket
(
	@TimeSpentOnTicketID INT,
	@TimeSpentOnTicket TIME,
	@DateWorkedOnTicket DATE,
	@AssigneeID INT,
	@TicketID INT
)
AS
BEGIN
	UPDATE tbTimeSpentOnTicket
	SET TimeSpentOnTicket=@TimeSpentOnTicket, DateWorkedOnTicket=@DateWorkedOnTicket, AssigneeID=@AssigneeID,
	TicketID=@TicketID
	WHERE TimeSpentOnTicketID=@TimeSpentOnTicketID
END
--GO
--EXEC spUpdateTimeSpentOnTicket @TimeSpentOnTicket='20:40', @DateWorkedOnTicket='8/26/15',@AssigneeID='8', @TicketID = 3, @TimeSpentOnTicketID = 1


--Delete from tbTimeSpentOnTicket
GO
CREATE PROCEDURE spTimeSpentOnTicket
(
	@TimeSpentOnTicketID INT
)
AS
BEGIN
DELETE FROM tbTimeSpentOnTicket WHERE TimeSpentOnTicketID=@TimeSpentOnTicketID
END
--GO
--EXEC spTimeSpentOnTicket @TimeSpentOnTicketID=1

　-----------------------------tbDevice---------------------------------------------------------------------



--Get Device/s from the table tbTicket
GO
CREATE PROCEDURE spGetDevice
(
	@DeviceID INT = NULL
)
AS
BEGIN
	SELECT * FROM tbDevice
	WHERE DeviceID = ISNULL(@DeviceID ,DeviceID)
END
GO
EXEC spGetDevice


--Insert Devices into Device table
GO
CREATE PROCEDURE spInsertDevice
	(
	@DeviceName VARCHAR(50)
	)
AS
BEGIN
	INSERT INTO tbDevice VALUES (@DeviceName)
END
--GO
--EXEC spInsertDevice @DeviceName='Computer'

　

--Update Ticket

GO
CREATE PROCEDURE spUpdateDevice
(
		@DeviceID INT ,
		@DeviceName VARCHAR(50)
)
AS
BEGIN
		UPDATE tbDevice
		SET DeviceName=@DeviceName 
		WHERE DeviceID =@DeviceID 
END
--GO
--EXEC spUpdateDevice @DeviceName='Laptop', @DeviceID ='5'
　

--Delete from tbTicket

GO
CREATE PROCEDURE spDeleteDevice
(
	@DeviceID INT
)
AS
BEGIN
	DELETE FROM tbDevice WHERE DeviceID=@DeviceID
END
--GO
--EXEC spDeleteDevice @DeviceID=3
　


-----------------------------tbDeviceBooking---------------------------------------------------------------------
--DeviceBookingID INT IDENTITY (1,1) PRIMARY KEY,
--DateStart DATETIME NOT NULL,
--DateEnd DATETIME NOT NULL,
--DeviceID INT FOREIGN KEY REFERENCES tbDevice(DeviceID),
--ClientID INT 


--Get DeviceBooking/s from the table tbDeviceBooking
GO
CREATE PROCEDURE spGetDeviceBooking
(
	@DeviceBookingID INT = NULL
)
AS
BEGIN
	SELECT * FROM tbDeviceBooking
	WHERE DeviceBookingID = ISNULL(@DeviceBookingID ,DeviceBookingID)
END
GO
--EXEC spGetDeviceBooking


--Insert DevicesBooking into Device table
GO
CREATE PROCEDURE spInsertDeviceBooking
	(
		@DateStart DATETIME ,
		@DateEnd DATETIME,
		@DeviceID INT ,
		@ClientID INT 

	)
AS
BEGIN
	INSERT INTO tbDeviceBooking VALUES (@DateStart,@DateEnd,@DeviceID,@ClientID)
END
--GO
--EXEC spInsertDeviceBooking @DateStart='3/4/15',@DateEnd='4/4/15',@DeviceID=4,@ClientID=10

　

--Update DevicesBooking

GO
CREATE PROCEDURE spUpdateDeviceBooking
(
		@DeviceBookingID INT,
		@DateStart DATETIME ,
		@DateEnd DATETIME,
		@DeviceID INT ,
		@ClientID INT 

)
AS
BEGIN
		UPDATE tbDeviceBooking
		SET DateStart=@DateStart,DateEnd=@DateEnd,DeviceID=@DeviceID,ClientID =@ClientID 
		WHERE DeviceBookingID =@DeviceBookingID
END
--GO
--EXEC spUpdateDeviceBooking  @DateStart='3/4/15',@DateEnd='4/4/15',@DeviceID=4,@ClientID=10,@DeviceBookingID=3

　

--Delete from tbDeviceBooking

GO
CREATE PROCEDURE spDeleteDeviceBooking
(
	@DeviceBookingID INT
)
AS
BEGIN
	DELETE FROM tbDeviceBooking WHERE DeviceBookingID =@DeviceBookingID 
END
GO
EXEC spDeleteDeviceBooking @DeviceBookingID=3
　

---------------------------------tbTicketAttachment-------------------------------------------------------------------------------------------

-- Show the Ticket Attachment information
GO
CREATE PROCEDURE spGetTicketAttachment
(
	@TicketAttachmentID INT = NULL
)
AS
BEGIN
	SELECT * FROM tbTicketAttachment
	WHERE TicketAttachmentID = ISNULL(@TicketAttachmentID,TicketAttachmentID)
END
--GO
--EXEC spGetTicketAttachment
　

--Insert new Ticket Attachment into the table
GO
CREATE PROCEDURE spInsertTicketAttachment
(
	@ImagePath VARCHAR(MAX),
	@ClientID INT,
	@TicketID INT,
	@DateOfAttachment DATETIME
)
AS
BEGIN
INSERT INTO tbTicketAttachment VALUES (@ImagePath, @ClientID, @TicketID, @DateOfAttachment)
END
--GO
--EXEC spInsertTicketAttachment @ImagePath='\attachment\', @ClientID=8, @TicketID=3, @DateOfAttachment='9/24/15'
　

--Update Ticket Attachment
GO
CREATE PROCEDURE spUpdateTicketAttachment
(
	@TicketAttachmentID INT,
	@ImagePath VARCHAR(MAX),
	@ClientID INT,
	@TicketID INT,
	@DateOfAttachment DATETIME
)
AS
BEGIN
	UPDATE tbTicketAttachment SET ImagePath=@ImagePath, ClientID=@ClientID, TicketID=@TicketID,DateOfAttachment=@DateOfAttachment
	WHERE TicketAttachmentID=@TicketAttachmentID
END
GO
--EXEC spUpdateTicketAttachment @ImagePath='\attachment\', @ClientID=9,@TicketID = 4, @DateOfAttachment='6/23/15', @TicketAttachmentID=1
　

--Delete Ticket Attachment
GO
CREATE PROCEDURE spDeleteTicketAttachment
(
	@TicketAttachmentID INT
)
AS
BEGIN
	DELETE FROM tbTicketAttachment WHERE TicketAttachmentID=@TicketAttachmentID
END
--GO
--EXEC spDeleteTicketAttachment @TicketAttachmentID=3



------------------------------------tbTicketPriority-----------------------------------------

GO
CREATE PROCEDURE spGetProirity
(
	@TicketPriorityID INT = NULL
)
AS
BEGIN
	SELECT * FROM tbTicketPriority
			WHERE TicketPriorityID = ISNULL(@TicketPriorityID,TicketPriorityID)
END
GO
EXEC spGetProirity


--Insert new Proirity into the table
GO
CREATE PROCEDURE spInsertProirity
(
	@TicketPriorityName VARCHAR(35)
)
AS
BEGIN
		INSERT INTO tbTicketPriority (TicketPriorityName) VALUES (@TicketPriorityName)
END
--GO
--EXEC spInsertProirity @TicketPriorityName='Urgent'


--Update Proirity 
GO
CREATE PROCEDURE spUpdateProirity

(
	@TicketPriorityID INT,
	@TicketPriorityName VARCHAR(35)
)
AS
BEGIN
	UPDATE tbTicketPriority SET TicketPriorityName=@TicketPriorityName WHERE TicketPriorityID=@TicketPriorityID
END
--GO
--EXEC spUpdateProirity @TicketPriorityName='Urgent', @TicketPriorityID=3


--Delete Proirity
GO
CREATE PROCEDURE spDeleteProirity
(
	@TicketPriorityID INT
)
AS
BEGIN
	DELETE FROM tbTicketPriority WHERE TicketPriorityID=@TicketPriorityID
END
--GO
--EXEC spDeleteProirity @TicketPriorityID=2


-----------------------------------tbTicketStatus-----------------------------------------

-- Get ticket status
GO
CREATE PROCEDURE spGetStatus
(
	@TicketStatusID INT = NULL
)
AS
BEGIN
	SELECT * FROM tbTicketStatus
			WHERE TicketStatusID = ISNULL(@TicketStatusID,TicketStatusID)
END
GO
EXEC spGetStatus


--Insert new Status into the table
GO
CREATE PROCEDURE spInsertStatus
(
	@TicketStatusName VARCHAR(35)
)
AS
BEGIN
		INSERT INTO tbTicketStatus (TicketStatusName) VALUES (@TicketStatusName)
END
--GO
--EXEC spInsertStatus @TicketStatusName='NotOpen'


--Update Status 
GO
CREATE PROCEDURE spUpdateStatus

(
	@TicketStatusID INT,
	@TicketStatusName VARCHAR(35)
)
AS
BEGIN
	UPDATE tbTicketStatus SET TicketStatusName=@TicketStatusName WHERE TicketStatusID=@TicketStatusID
END
--GO
--EXEC spUpdateStatus @TicketStatusName='NotOpen', @TicketStatusID=3


--Delete Status
GO
CREATE PROCEDURE spDeleteStatus
(
	@TicketStatusID INT
)
AS
BEGIN
	DELETE FROM tbTicketStatus WHERE TicketStatusID=@TicketStatusID
END
--GO
--EXEC spDeleteStatus @TicketStatusID=2


--------------------------------------------------------------------------------------------
GO
CREATE PROCEDURE spGetTicketInfo
AS
BEGIN
	SELECT t.TicketID,t.Summary,ts.TicketStatusName, u.Email, tp.TicketPriorityName,t.DateCreated 
	FROM tbTicket t JOIN tbTicketStatus ts ON ts.TicketStatusID = t.TicketStatusID
	JOIN tbTicketPriority tp ON tp.TicketPriorityID = t.TicketPriorityID
	JOIN tbUser u ON u.UserID = t.ClientID
END
GO
EXEC spGetTicketInfo

--------------------------------------------

GO
CREATE PROCEDURE spGetTicketByStatusName
(
 @TicketStatusName VARCHAR(35) = NULL
)
AS
BEGIN
	SELECT t.TicketID,t.Summary,ts.TicketStatusName, u.Email, tp.TicketPriorityName,t.DateCreated 
	FROM tbTicket t JOIN tbTicketStatus ts ON ts.TicketStatusID = t.TicketStatusID
	JOIN tbTicketPriority tp ON tp.TicketPriorityID = t.TicketPriorityID
	JOIN tbUser u ON u.UserID = t.ClientID
	WHERE TicketStatusName = ISNULL(@TicketStatusName,TicketStatusName)
END
--GO
--EXEC spGetTicketByStatusName @TicketStatusName='Open Tickets'


GO
CREATE PROCEDURE spTicketIdAndSummary
(
	@TicketID INT
)
AS
BEGIN
	SELECT t.TicketID, t.Summary, ts.TimeSpentOnTicket, ts.AssigneeID FROM tbTicket t 
		LEFT OUTER JOIN tbTimeSpentOnTicket ts ON t.TicketID = ts.TicketID AND t.AssigneeID = ts.AssigneeID
		WHERE t.TicketID = @TicketID
END
--GO 
--EXEC spTicketIdAndSummary @TicketID=4
GO
SELECT * FROM tbTicket
SELECT * FROM tbTimeSpentOnTicket

--Ticket Sorting
Go
Create Procedure spSortedTicket
(
	@SortColumn Varchar(20),
	@SortDirection Varchar(4)
)
As
Begin
If @SortColumn = 'TicketID' And @SortDirection = 'ASC'
	SELECT t.TicketID,t.Summary,ts.TicketStatusName, u.Email, tp.TicketPriorityName,t.DateCreated 
	FROM tbTicket t JOIN tbTicketStatus ts ON ts.TicketStatusID = t.TicketStatusID
	JOIN tbTicketPriority tp ON tp.TicketPriorityID = t.TicketPriorityID
	JOIN tbUser u ON u.UserID = t.ClientID Order By t.TicketID ASC
Else If @SortColumn = 'TicketID' And @SortDirection = 'DESC'
	SELECT t.TicketID,t.Summary,ts.TicketStatusName, u.Email, tp.TicketPriorityName,t.DateCreated 
	FROM tbTicket t JOIN tbTicketStatus ts ON ts.TicketStatusID = t.TicketStatusID
	JOIN tbTicketPriority tp ON tp.TicketPriorityID = t.TicketPriorityID
	JOIN tbUser u ON u.UserID = t.ClientID Order By t.TicketID DESC
Else If @SortColumn = 'DateCreated' And @SortDirection = 'ASC'
	SELECT t.TicketID,t.Summary,ts.TicketStatusName, u.Email, tp.TicketPriorityName,t.DateCreated 
	FROM tbTicket t JOIN tbTicketStatus ts ON ts.TicketStatusID = t.TicketStatusID
	JOIN tbTicketPriority tp ON tp.TicketPriorityID = t.TicketPriorityID
	JOIN tbUser u ON u.UserID = t.ClientID Order By t.DateCreated ASC
Else If @SortColumn = 'DateCreated' And @SortDirection = 'DESC'
	SELECT t.TicketID,t.Summary,ts.TicketStatusName, u.Email, tp.TicketPriorityName,t.DateCreated 
	FROM tbTicket t JOIN tbTicketStatus ts ON ts.TicketStatusID = t.TicketStatusID
	JOIN tbTicketPriority tp ON tp.TicketPriorityID = t.TicketPriorityID
	JOIN tbUser u ON u.UserID = t.ClientID Order By t.DateCreated DESC
Else If @SortColumn = 'Email' And @SortDirection = 'ASC'
	SELECT t.TicketID,t.Summary,ts.TicketStatusName, u.Email, tp.TicketPriorityName,t.DateCreated 
	FROM tbTicket t JOIN tbTicketStatus ts ON ts.TicketStatusID = t.TicketStatusID
	JOIN tbTicketPriority tp ON tp.TicketPriorityID = t.TicketPriorityID
	JOIN tbUser u ON u.UserID = t.ClientID Order By u.Email ASC
Else If @SortColumn = 'Email' And @SortDirection = 'DESC'
	SELECT t.TicketID,t.Summary,ts.TicketStatusName, u.Email, tp.TicketPriorityName,t.DateCreated 
	FROM tbTicket t JOIN tbTicketStatus ts ON ts.TicketStatusID = t.TicketStatusID
	JOIN tbTicketPriority tp ON tp.TicketPriorityID = t.TicketPriorityID
	JOIN tbUser u ON u.UserID = t.ClientID Order By u.Email DESC
Else
	SELECT t.TicketID,t.Summary,ts.TicketStatusName, u.Email, tp.TicketPriorityName,t.DateCreated 
	FROM tbTicket t JOIN tbTicketStatus ts ON ts.TicketStatusID = t.TicketStatusID
	JOIN tbTicketPriority tp ON tp.TicketPriorityID = t.TicketPriorityID
	JOIN tbUser u ON u.UserID = t.ClientID
End
GO

--Get the attached info
GO
CREATE PROCEDURE spGetAttachment
(
	@TicketID INT = NULL
)
AS
BEGIN
	SELECT ImagePath FROM tbTicketAttachment ta
		JOIN tbTicket t ON ta.TicketID = t.TicketID
		WHERE t.TicketID = @TicketID
END
--GO
--EXEC spGetAttachment @TicketID = 13


--Get the image attachments
GO
CREATE PROCEDURE spGetImageAttachments
(
	@TicketID INT = NULL
)
AS
BEGIN
	SELECT ImagePath FROM tbTicketAttachment ta
		JOIN tbTicket t ON ta.TicketID = t.TicketID
		WHERE t.TicketID = @TicketID
			AND	   ta.ImagePath like '%.jpg' OR ta.ImagePath like '%.png' 
				OR ta.ImagePath like '%.bmp' OR ta.ImagePath like '%.jpeg'
				OR ta.ImagePath like '%.gif'
END
--GO
--EXEC spGetImageAttachments @TicketID=13


--Get the attachments with no Image
GO
CREATE PROCEDURE spGetNonImageAttachments
(
	@TicketID INT = NULL
)
AS
BEGIN
	SELECT ImagePath FROM tbTicketAttachment ta
		JOIN tbTicket t ON ta.TicketID = t.TicketID
		WHERE t.TicketID = @TicketID
			AND	   ta.ImagePath NOT like '%.jpg' AND ta.ImagePath NOT like '%.png' 
				AND ta.ImagePath NOT like '%.bmp' AND ta.ImagePath NOT like '%.jpeg'
				AND ta.ImagePath NOT like '%.gif'
END
--GO
--EXEC spGetNonImageAttachments @TicketID=13

GO
CREATE PROCEDURE spTicketAssignee
(
	@TicketID INT
)
AS
BEGIN
	SELECT AssigneeID, FirstName  FROM tbTicket t
	JOIN tbUser u ON t.AssigneeID = u.UserID 
	WHERE TicketID=@TicketID
END
GO


SELECT * FROM tbUser
--Update ticket assignee
GO
CREATE PROCEDURE spUpdateTicketAssignee
(
	@TicketID INT,
	@AssigneeID INT
)
AS
BEGIN
	UPDATE tbTicket SET AssigneeID = @AssigneeID WHERE TicketID=@TicketID
END
GO
EXEC spUpdateTicketAssignee @TicketID = 3, @AssigneeID = 2


--Print ticket info
GO
CREATE PROCEDURE spGetPrintInfo
(
	@TicketID INT
)
AS
BEGIN
	SELECT t.TicketID, t.Summary, t.Description, tp.TicketPriorityName, ts.TicketStatusName, 
						tc.CategoryName, (u2.FirstName + ' ' + u2.LastName) AS [Assignee], (u.FirstName + ' ' + u.LastName) AS [Client], u.Email AS [Client Email], t.DateCreated FROM tbTicket t 
	JOIN tbTicketPriority tp ON tp.TicketPriorityID = t.TicketPriorityID
	JOIN tbTicketStatus ts ON t.TicketStatusID = ts.TicketStatusID
	JOIN tbTicketCategory tc ON t.TicketCategoryID = tc.TicketCategoryID
	JOIN tbUser u ON t.ClientID = u.UserID
	JOIN tbUser u2 ON u2.UserID = t.AssigneeID
	WHERE TicketID = @TicketID
	
END
GO
EXEC spGetPrintInfo @TicketID=7


--Close ticket
GO
CREATE PROCEDURE spCloseTicket
(
	@TicketID INT,
	@TicketStatusID INT = 3
)
AS
BEGIN
	UPDATE tbTicket SET TicketStatusID = @TicketStatusID WHERE TicketID = @TicketID
END 
--GO
--EXEC spCloseTicket @TicketID = 2


--Sorting user procedure---
GO
CREATE PROCEDURE spSortUser
(
	@Sort VARCHAR (20) = 'UserID',
	@SortDirection VARCHAR (4) = 'ASC'
)
AS
BEGIN
	IF @SortDirection = 'ASC'
		BEGIN
			IF @Sort = 'UserID' 
				SELECT * FROM tbUser ORDER BY UserID ASC
			ELSE IF @Sort = 'FirstName' 
				SELECT * FROM tbUser ORDER BY FirstName ASC
			ELSE IF @Sort = 'LastName'
				SELECT * FROM tbUser ORDER BY LastName ASC
		END
	ELSE 
		BEGIN
			IF @Sort = 'UserID' 
				SELECT * FROM tbUser ORDER BY UserID DESC
			ELSE IF @Sort = 'FirstName' 
				SELECT * FROM tbUser ORDER BY FirstName DESC
			ELSE IF @Sort = 'LastName'
				SELECT * FROM tbUser ORDER BY LastName DESC
		END
END
--GO
--EXEC spSortUser @Sort = 'FirstName', @SortDirection = 'DESC'
--EXEC spSortUser @Sort = 'LastName', @SortDirection = 'DESC'
--EXEC spSortUser @Sort = 'UserID', @SortDirection = 'ASC'

SELECT * FROM tbTicket

GO
CREATE PROCEDURE spGetPersonFromTicket
(
	@TicketID INT
)
AS
BEGIN
	SELECT * FROM tbTicket t
		JOIN tbUser u ON t.ClientID = u.UserID 
		WHERE t.TicketID = @TicketID
END
GO
