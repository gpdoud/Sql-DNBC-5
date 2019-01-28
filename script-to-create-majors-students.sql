
drop table if exists Students;
go
drop table if exists Majors;
go
create table Majors (
	Id int not null primary key identity(1,1),
	Description nvarchar(50) not null
);
go
create table Students (
	Id int not null primary key identity(1,1),
	Firstname nvarchar(30) not null unique, -- nvarchar(MAX)
	Favdate datetime,
	LovesGameOfThrones bit not null default 1,
	RateGameOfThrones decimal(3, 1) not null default 5.0 
		check (RateGameOfThrones >= 0 and RateGameOfThrones <= 10.0),
	MajorsId int foreign key references Majors(id)
);
go
Insert into Majors (Description) values ('Math');
Insert into Majors (Description) values ('Engineering');
Insert into Majors (Description) values ('Education');
Insert into Majors (Description) values ('Management');
Insert into Majors (Description) values ('CS');
go
Insert into Students 
	(Firstname, Favdate, MajorsId)
	values 
	('Greg', '2019-01-01', NULL); 
Insert into Students 
	(Firstname, Favdate, MajorsId)
	values 
	('Nick', '2018-12-31', 4); 
Insert into Students 
	(Firstname, Favdate, MajorsId)
	values 
	('Error', '2018-12-31', 0); 
go
Update Students set Firstname = 'Gregory' where id = 1;
go
select * from students;
go