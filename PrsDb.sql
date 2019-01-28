use master;
go
alter database PrsDb set single_user with rollback immediate
go
drop database if exists PrsDb;
go
create database PrsDb;
go
use PrsDb;
go
-- after this create your tables
create table Users (
	id int not null primary key identity(1,1),
	Username nvarchar(30) not null unique,
	Password nvarchar(30) not null,
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Phone nvarchar(12),
	Email nvarchar(255),
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0,
	Active bit not null default 1
);
go
Insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
values ('sa', 'sa', 'Super', 'Admin', NULL, NULL, 1, 1);
Insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
values ('reviewer', 'reviewer', 'Normal', 'Reviewer', NULL, NULL, 1, 0);
Insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
values ('user', 'user', 'Normal', 'User', NULL, NULL, 0, 0);
go
create table Vendors (
	id int not null primary key identity(1,1),
	Code nvarchar(4) not null unique,
	Name nvarchar(50) not null,
	Address nvarchar(30),
	City nvarchar(30),
	State nchar(2) default 'OH',
	Zip nvarchar(10),
	Phone nvarchar(12),
	Email nvarchar(255),
	IsPreferred bit not null default 0,
	Active bit not null default 1
);
go
Insert into Vendors (Code, Name, Address, City, State, Zip, Phone, Email)
values ('AMAZ', 'Amazon', '123 St.', 'Seattle', 'WA', '01234', '999-555-1212', 'info@amazon.com');
Insert into Vendors (Code, Name, Address, City, State, Zip, Phone, Email)
values ('TARG', 'Target', '123 St.', 'Minneapolis', 'MN', '98765', '888-555-1212', 'info@target.com');
Insert into Vendors (Code, Name, Address, City, State, Zip, Phone, Email)
values ('MSFT', 'Microsoft', '456 St.', 'Seattle', 'WA', '01234', '777-555-1212', 'info@microsoft.com');
go
create table Products (
	id int not null primary key identity(1,1),
	VendorsId int not null foreign key references Vendors(Id),
	PartNumber nvarchar(30) not null,
	Name nvarchar(30) not null,
	Price decimal(9,2) not null default 0,
	Unit nvarchar(10) not null default 'Each',
	PhotoPath nvarchar(255),
	Active bit not null default 1	
);
go
Insert into Products (VendorsId, PartNumber, Name, Price)
values (1, 'Echo', 'Amazon Echo', 99.99);
Insert into Products (VendorsId, PartNumber, Name, Price)
values (1, 'EchoDot', 'Amazon Echo Dot', 39.99);
Insert into Products (VendorsId, PartNumber, Name, Price)
values (2, 'Timex', 'Timex Watch', 29.99);
Insert into Products (VendorsId, PartNumber, Name, Price)
values (2, 'iPad', 'Apple iPad', 429.99);
Insert into Products (VendorsId, PartNumber, Name, Price)
values (3, 'Office365', 'MS Office 365', 99.99);
Insert into Products (VendorsId, PartNumber, Name, Price)
values (3, 'Word', 'MS Word', 109.99);
go
create table Requests (
	id int not null primary key identity(1,1),
	UsersId int not null foreign key references Users(Id),
	Description nvarchar(80),
	Justification nvarchar(80),
	RejectionReason nvarchar(80),
	DeliveryMode nvarchar(30) default 'Pickup',
	ReviewDate datetime not null default getdate(),
	Status nvarchar(10) not null default 'NEW'
		check (Status in ('NEW','REVIEW','APPROVED','REJECTED')),
	Total decimal(11,2) not null default 0,
	Active bit not null default 1
);
go
Insert into Requests (UsersId, Description)
values (1, 'My first request');
Insert into Requests (UsersId, Description)
values (2, 'My second request');
Insert into Requests (UsersId, Description)
values (3, 'My third request');
go
create table RequestLines (
	id int not null primary key identity(1,1),
	ProductsId int not null foreign key references Products(Id),
	RequestsId int not null foreign key references Requests(Id),
	Quantity int not null default 1
)
go
Insert into RequestLines (ProductsId, RequestsId, Quantity)
values (1, 1, 1);
Insert into RequestLines (ProductsId, RequestsId, Quantity)
values (2, 1, 3);
Insert into RequestLines (ProductsId, RequestsId, Quantity)
values (3, 1, 2);
Insert into RequestLines (ProductsId, RequestsId, Quantity)
values (4, 1, 4);
Insert into RequestLines (ProductsId, RequestsId, Quantity)
values (5, 1, 2);
Insert into RequestLines (ProductsId, RequestsId, Quantity)
values (6, 1, 2);
go