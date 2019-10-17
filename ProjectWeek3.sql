/********************************************
*			Week 3 Project					
*
*  Created by			Last Updated
* Kevin Powell			10/9/2019
*						10/10/2019
*						10/11/2019
********************************************/
--remove database if exists
DROP DATABASE IF EXISTS disk_inventoryKP;
go
--recreate database after drop or if not exists
CREATE DATABASE disk_inventoryKP;
go

Use master;
go
if SUSER_ID('diskUserKP') is null
Create Login diskUserKP with password = 'Pa$$w0rd',
DEFAULT_DATABASE = disk_inventoryKP;
go

use disk_inventoryKP;
go
if user_id('diskUserKP') is null
Create user diskUserKP;
go

Alter Role [db_datareader] Add Member diskUserKP;
go

--drop table if Artist table exists and create
Drop Table If EXISTS Artist;
go
Create Table Artist (
artist_id			Int not null Identity Primary Key,
artist_first_name	varchar(20) not null,
artist_last_name	varchar(20) null,
);
Insert Into Artist
(artist_first_name, artist_last_name)
Values
('ACDC', null),
('Busta', 'Rhymes'),
('Carrie', 'Underwood'),
('Dirks', 'Bentley'),
('Eminem', null),
('Frank', 'Sinatra'),
('Gnarls', 'Barkley'),
('Harvey', 'Danger'),
('Ice', 'Cube'),
('Jason', 'Mraz'),
('Kiss', null),
('Led Zeppelin', null),
('William', 'Beckett'),
('Set It Off', null),
('Michael', 'Jackson'),
('New Found Glory', null),
('They Might Be Giants', null),
('Bright Eyes', null),
('Montley Crew', null),
('Blake', 'Shelton'),
('Miranda', 'Lambert')
;
Go

--drop table if Borrower table exists and create
Drop Table if EXISTS Borrower;
go
Create Table Borrower(
borrower_id			Int not null Identity Primary Key,
borrower_first_name	varchar(20) not null,
borrower_last_name	varchar(20) not null,
phone_number		varchar(20) not null
);
go

Insert into Borrower
(borrower_first_name, borrower_last_name, phone_number)
Values
('Bart', 'Simpson', '208-345-9876'),
('Josh', 'Jonson', '208-712-9821'),
('Sam', 'Elinger', '208-490-4457'),
('Jake', 'Stanton', '208-909-0023'),
('Mary', 'Monroe', '208-221-3245'),
('Jen', 'Aklers', '208-438-7732'),
('Dee', 'Ford', '208-643-9912'),
('Barry', 'Austin','208-478-3356'),
('Ken', 'Barbie','208-555-4554'),
('Gayle', 'Bush','208-220-2112'),
('Summer', 'Frampton', '208-112-2332'),
('Jennifer', 'Mikes', '208-748-8547'),
('Sue', 'Heck', '208-114-4875'),
('Frank', 'Thomas', '208-669-6325'),
('Norm', 'McDonald','208-889-7877'),
('Elisa','Liam', '208-577-7343'),
('Roland', 'Doe', '208-299-4444'),
('Maria', 'Juarez', '208-999-9999'),
('Sarah', 'Silverman', '208-888-8888'),
('Homer', 'Psych', '208-666-6666'),
('Test', 'Delete', '208-555-5555')
;
Go

--drop table if DiskStatus table exists and create
Drop Table if EXISTS DiskStatus;
go
Create Table DiskStatus(
status_id			Int not null Identity Primary Key,
status_description	varchar(25) not null,
);
go
Insert into DiskStatus
(status_description)
Values
('Borrowed'),
('In Inventory')
Go

--drop table if DiskType table exists and create
Drop Table if EXISTS DiskType;
go
Create Table DiskType(
diskType_id				Int not null Identity Primary Key,
diskType_description	varchar(25) not null
);
go
Insert Into DiskType
(diskType_description)
Values
('CD'),
('DVD'),
('Blue Ray')
;
Go

--drop table if Genre table exists and create
Drop Table if EXISTS Genre;
go
Create Table Genre(
genre_id			Int not null Identity Primary Key,
genre_description	varchar(25) not null
);
go
Insert Into Genre
(genre_description)
Values
('Classic Rock'),
('Hip Hop'),
('Country'),
('Alternative Rock'),
('Pop'),
('Jazz'),
('Punk Rock')
;
Go

--drop table if CompactDisk table exists and create
Drop Table if EXISTS CompactDisk;
go
Create Table CompactDisk(
cd_id			Int not null Identity Primary Key,
cd_name			varchar(100) not null,
release_date	Date not null,
status_id		Int not null REFERENCES  DiskStatus(status_id),
diskType_id		Int not null REFERENCES DiskType(diskType_id),
genre_id		Int not null REFERENCES Genre(genre_id)
);

--don't forget to add a couple of dvds and blue rays
Insert Into CompactDisk
(cd_name, release_date, status_id, diskType_id, genre_id)
Values
('Dirty Deeds Done Dirt Cheap','1976/09/20', 2, 1, 1),
('Anarchy', '2000/06/20', 2, 1, 2),
('Blown Away', '2012/07/09', 2, 1, 3),
('Long Trip Alone', '2006/10/17', 2, 1, 3),
('Kamikaze', '2018/08/31', 2, 1, 2),
('Where are you?', '1957/09/02', 2, 1, 6),
('St.Elsewhere', '2006/04/24', 2, 1, 5),
('Where have all the merrymakers gone', '1997/07/29', 2, 1, 4),
('War & Peace, Volume 1: The War Disk', '1998/11/17', 2, 1, 2),
('Mr. A-Z', '2005/07/26', 2, 1, 5),
('Love Gun', '1977/06/30', 1, 1, 1),
('Led Zeppelin IV', '1972/10/21', 1, 1, 1),
('Punk Goes Christmas', '2013/11/5', 2, 1, 7),
('Thriller', '1982/11/30', 2, 1, 5),
('Im Wide Awake, Its Morning', '2005/01/25', 2, 1, 4),
('Flood', '1990/01/15', 2, 1, 4),
('Based on a True Story', '2013/03/26', 2, 1, 3),
('Platinum', '2014/06/03', 1, 1, 3),
('Shout at the Devil', '1983/09/26', 2, 1, 1),
('Catalyst', '2004/05/18', 2, 1, 7),
('Fevers and Mirrors', '2000/05/29', 1, 1, 4);
go

--drop table if DiskHasArtist table exists and create
Drop Table if EXISTS DiskHasArtist;
go
Create Table DiskHasArtist(
artist_id				Int not null REFERENCES Artist(artist_id),
cd_id					Int not null REFERENCES CompactDisk(cd_id),
Primary Key(artist_id, cd_id)
);
go

Insert into DiskHasArtist
(artist_id, cd_id)
Values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,13),
(15,14),
(16,20),
(17,16),
(18,15),
(18,21),
(19,19),
(20,17),
(21,18);
Go
--drop table if DiskHasBorrower table exists and create
Drop Table if EXISTS DiskHasBorrower;
go
Create Table DiskHasBorrower(
borrowed_date	Date not null,
returned_date	Date null,
borrower_id		Int not null REFERENCES Borrower(borrower_id),
cd_id			Int not null References CompactDisk(cd_id),
Primary Key (borrower_id, cd_id, borrowed_date)
);
go
Insert Into DiskHasBorrower
(borrowed_date, returned_date, borrower_id, cd_id)
Values
('2019/01/05','2019/01/20',5,14),
('2019/01/05','2019/01/20',5,10),
('2019/02/02','2019/02/10',18,6),
('2019/02/06','2019/02/28',11,21),
('2019/05/04','2019/08/17',1,1),
('2019/05/18','2019/06/01',3,13),
('2019/03/06','2019/03/16',5,14),
('2019/08/08','2019/08/23',16,2),
('2019/07/04','2019/07/14',6,1),
('2019/06/06','2019/06/16',10,11),
('2019/10/01',null,7,12),
('2019/10/08',null,9,18),
('2019/04/04','2019/04/14',12,16),
('2019/09/09','2019/09/19',17,17),
('2019/10/10',null,13,21),
('2019/07/07','2019/07/27',19,19),
('2019/03/03','2019/03/23',20,2),
('2019/09/01','2019/09/11',14,7),
('2019/08/29',null,15,11),
('2019/07/28','2019/08/05',4,4)
;
Go

--Update the genre for a CD
Update CompactDisk
Set genre_id = 5
Where cd_id = 3;
Go

--Delete borrower from table
Delete from Borrower
Where borrower_id = 21;
Go

--Select statement in which will return all null values in returned_date
--Select borrower_id, cd_id, borrowed_date, returned_date
--from DiskHasBorrower
--Where returned_date is null;
--Go

--Another way to write the select statement to include a status description
Select borrower_id,DiskHasBorrower.cd_id, borrowed_date, --returned_date, 
status_description
from DiskHasBorrower join CompactDisk
on DiskHasBorrower.cd_id = CompactDisk.cd_id
join DiskStatus
on CompactDisk.status_id = DiskStatus.status_id
Where returned_date is null 
Order by borrowed_date asc;

-- Shows artists sorted by last name, first name, and disk name
USE disk_inventoryKP
Select cd_name as 'Disk Name', release_date as 'Release Date', artist_first_name as 'Artist First Name', artist_last_name as 'Artist Last Name' 
from Artist
join DiskHasArtist on Artist.artist_id = DiskHasArtist.artist_id
join CompactDisk on DiskHasArtist.cd_id = CompactDisk.cd_id
where artist_last_name is not null;
Go

-- Created view with artist_id, Artist_first_name, artist_last_name
Create View View_Individual_Artist
AS
Select artist_id, artist_first_name, artist_last_name
from Artist
Go
--Shows individual artists first and last name from View
Select artist_first_name as ' First Name', artist_last_name as 'Last Name'
from View_Individual_Artist
Where artist_last_name is not null
Order by artist_last_name;
Go

--Drop View View_Individual_Artist
--Go

-- Shows Group names with release dates and disk names
Select cd_name as 'Disk Name', release_date as 'Release Date', artist_first_name as 'Band Name'
from View_Individual_Artist join DiskHasArtist
on DiskHasArtist.artist_id = View_Individual_Artist.artist_id
join CompactDisk on CompactDisk.cd_id = DiskHasArtist.cd_id
Where artist_last_name is null
Order by 'Band Name', 'Disk Name';
Go

-- Shows which cds have been borrrowed and who borrowed them, Sorted by First Name, Disk Name, Borrowed Date and Returned Date
Select borrower_first_name as 'First', borrower_last_name as 'Last', cd_name as ' Disk Name', borrowed_date as 'BorrowedDate', returned_date as ' ReturnedDate'
from Borrower
join DiskHasBorrower on Borrower.borrower_id = DiskHasBorrower.borrower_id
join CompactDisk on DiskHasBorrower.cd_id = CompactDisk.cd_id
order by borrower_last_name, borrower_first_name, cd_name, borrowed_date, returned_date;
go

--Shows how many times a disk has been borrowed, what the disk is, and the disk id.
Select CompactDisk.cd_id as 'Disk ID', cd_name as 'CD Name' , Count(DiskHasBorrower.cd_id) as 'Times Borrowed'
from DiskHasBorrower
join CompactDisk on DiskHasBorrower.cd_id = CompactDisk.cd_id
group by cd_name, CompactDisk.cd_id
Order by CompactDisk.cd_id;
Go

-- Show the disks outstanding or on-loan and who has each disk. Sort by disk name.
Select cd_name as 'Disk Name', borrowed_date as 'Borrowed', returned_date as 'Returned', borrower_last_name as 'Last Name'
from Borrower join DiskHasBorrower on Borrower.borrower_id = DiskHasBorrower.borrower_id
join CompactDisk on DiskHasBorrower.cd_id = CompactDisk.cd_id
Where returned_date is null
Order by cd_name;
Go