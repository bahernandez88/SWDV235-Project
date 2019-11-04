/*
Author: Brian A. Hernandez
--------------------------
Date:11/4/2019
Comment: initial deployment of SQL oceanside_db Database
-created DB, user for executing stored procedure, and
stored procedure;

*/

use master;
go


drop database if exists oceanside_db;
create database oceanside_db;
go

use oceanside_db;
go

drop user if exists ocVisitor;
CREATE USER ocVisitor FOR LOGIN ocVisitor WITH DEFAULT_SCHEMA=[dbo]

CREATE TABLE [dbo].[employees](
	[employeeID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL);
	
GO

CREATE TABLE [dbo].[newsletter](
	[newsID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[emailAddress] [nvarchar](255) NOT NULL,
	[heardFrom] [nvarchar](255) NULL);

	
GO

CREATE TABLE [dbo].[oceanside_contact](
	[visitorID] [int] IDENTITY(1,1) NOT NULL,
	[contactReason] [nvarchar](20) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[emailAddress] [nvarchar](255) NOT NULL,
	[phoneNumber] [nvarchar](15) NULL,
	[comment] [nvarchar](500) NULL);
GO

create procedure [dbo].[InsertVisitor]
@why nchar(50),
@first nchar(50),
@last nchar(200),
@email nchar(200),
@phone nchar(200),
@comment nchar(200)
as
INSERT INTO  [oceanside_db].[dbo].[oceanside_contact]
				([contactReason]
				,[firstName]
				,[lastName]
				,[emailAddress]
				,[phoneNumber]
				,[comment])
     VALUES
           (@why
           ,@first
           ,@last
		   ,@email
		   ,@phone
		   ,@comment)
GO

grant execute on InsertVisitor
to ocVisitor
go


