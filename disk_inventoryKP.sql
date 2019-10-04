/********************************************
*			Week 2 Project					
*
*  Created by			Last Updated
* Kevin POwell			10/2/2019
*						10/3/2019
*						10/4/2019
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
artist_fist_name	varchar(20) not null,
artist_last_name	varchar(20) null,
);
go

--drop table if Borrower table exists and create
Drop Table if EXISTS Borrower;
go
Create Table Borrower(
borrower_id			Int not null Identity Primary Key,
borrower_first_name	varchar(20) not null,
borrower_last_name	varchar(20) not null,
phone_number		int not null
);
go

--drop table if DiskStatus table exists and create
Drop Table if EXISTS DiskStatus;
go
Create Table DiskStatus(
status_id			Int not null Identity Primary Key,
status_description	varchar(25) not null,
);
go

--drop table if DiskType table exists and create
Drop Table if EXISTS DiskType;
go
Create Table DiskType(
diskType_id				Int not null Identity Primary Key,
diskType_description	varchar(25) not null
);
go

--drop table if Genre table exists and create
Drop Table if EXISTS Genre;
go
Create Table Genre(
genre_id			Int not null Identity Primary Key,
genre_description	varchar(25) not null
);
go

--drop table if CompactDisk table exists and create
Drop Table if EXISTS CompactDisk;
go
Create Table CompactDisk(
cd_id			Int not null Identity Primary Key,
cd_name			varchar(25) not null,
release_date	Date not null,
status_id		Int not null REFERENCES  DiskStatus(status_id),
diskType_id		Int not null REFERENCES DiskType(diskType_id),
genre_id		Int not null REFERENCES Genre(genre_id)
);
go

--drop table if DiskHasArtist table exists and create
Drop Table if EXISTS DiskHasArtist;
go
Create Table DiskHasArtist(
disk_artist_description	varchar(25) not null,
artist_id				Int not null REFERENCES Artist(artist_id),
cd_id					Int not null REFERENCES CompactDisk(cd_id),
Primary Key(artist_id, cd_id)
);
go

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