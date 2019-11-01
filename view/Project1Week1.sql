/*****************************************
*		Project Week 1
*Created By				Last Updated
*Kevin Powell			11/1/2019
*
*
*
****************************************/

Drop Database if exists visitorsdb_KP;
Go

Create Database visitorsdb_KP;
Go

Use visitorsdb_KP

Create Table visitors (
visitor_id			Int not null Identity Primary Key,
visitor_name		varchar(100) not null,
visitor_email		varchar(100) not null,
visitor_dob			date not null,
visitor_comments	varchar(255) null
);
Go
Drop Procedure InsertVisitor
Go
Create Procedure InsertVisitor
@visitor_name varchar(100),
@visitor_email varchar(100),
@visitor_dob date,
@visitor_comments varchar(255)
As
Insert Into [dbo].[visitors]
		([visitor_name],
		 [visitor_email],
		 [visitor_dob],
		 [visitor_comments])
	Values
		(@visitor_name,
		@visitor_email,
		@visitor_dob,
		@visitor_comments);
Go

Execute InsertVisitor "Test Tester", "tester@testing.com", "01/20/2019", "This is just a test";
Go
select * from visitors;
Go
Use master;
Go

If SUSER_ID('visitoruser') is null
Create Login [visitoruser] with password ='Pa$$w0rd',
Default_Database = [visitorsdb_KP];
Go

Use visitorsdb_KP;
Go

if user_id('visitoruser') is null
Create user [visitoruser] for Login[visitoruser] with Default_Schema=[dbo]
go

Grant Execute On [InsertVisitor] to [visitoruser];
go

