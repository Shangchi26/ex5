USE Example5
GO

CREATE TABLE ProDucts(
	MaSP INT PRIMARY KEY IDENTITY,
	TenSP VARCHAR(10),
	GiaSP VARCHAR(10),
	Loai VARCHAR(10)
)
GO
SELECT * FROM ProDucts
GO
INSERT INTO ProDucts(TenSP) VALUES ('LAPTOP')
UPDATE ProDucts SET GiaSP = '20.000.000' WHERE MaSP = 1
UPDATE ProDucts SET Loai = 'GAMING' WHERE MaSP = 1
GO
INSERT INTO ProDucts(TenSP) VALUES ('HEADPHONE')
UPDATE ProDucts SET GiaSP = '2.000.000' WHERE MaSP = 2
UPDATE ProDucts SET Loai = 'GAMING' WHERE MaSP = 2
GO

--sv
CREATE TABLE SV(
	MaSV int PRIMARY KEY,
	TenSV varchar(40),
	MaLopHoc int,
	CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLopHoc)
)
GO
INSERT INTO SV(MaSV, TenSV, MaLopHoc) VALUES (5, 'DAO', 1);
INSERT INTO SV(MaSV, TenSV, MaLopHoc) VALUES (3, 'HIEN', 2);
INSERT INTO SV(MaSV, TenSV, MaLopHoc) VALUES (14, 'SHANG', 8),(16, 'HAI', 3);
SELECT * FROM SV
SELECT * FROM Lophoc
GO
--product
create table category (id int primary key, name varchar(20) )
create table Produce (id int, name varchar(40), cat_id int,
	constraint fk2 foreign key (cat_id) references category(id))
insert into category(id, name) values (1, 'HaNoi')
insert into category(id, name) values (2, 'cty')
insert into Produce(id, name, cat_id) values (2, 'May rua bat', 1)
insert into Produce(id, name, cat_id) values (2, 'May lau nha', 2)
insert into Produce(id, name, cat_id) values (2, 'May ru ngu', 1)
select * from category
select * from Produce

--sanpham null
create table SanPham (
	MaSP int NOT NULL,
	TenSP varchar(40) NULL
)
GO
insert into SanPham(MaSP, TenSP) values (1, 'Laptop')
go
insert into SanPham(TenSP) values ('Laptop2')
go
insert into SanPham(MaSP) values (2)
go
select * from SanPham

--default 
create table StoreProduct(
	ProductID int NOT NULL,
	Name varchar(40) NOT NULL,
	Price money NOT NULL DEFAULT (100)
)
go

insert into StoreProduct(ProductID, Name) values (111, 'Rivets')
go
insert into StoreProduct values (1, 'Mac', 101)
go
select * from StoreProduct
go

--contactPhone
create table ContactPhone (
	Person_ID int IDENTITY(500, 10) NOT NULL,
	MobileNumber bigint NOT NULL
)
GO
insert into ContactPhone values (984123123);
insert into ContactPhone values (984123124);
go
select * from ContactPhone
go

--nhận dạng
create table CellularPhone(
	Person_ID uniqueidentifier default NEWID() NOT NULL,
	personName varchar(60) NOT NULL
)
--chèn record
create table CellularPhone1(
  person_ID uniqueidentifier default newid() not null,
  PersonName varchar(60) not null
  )
select * from CellularPhone1
insert into CellularPhone1(PersonName) values('william smith')
go
select * from CellularPhone
go
create table contactphone3(
 person_id int primary key,
 mobileNumber bigint unique,
 serviceProvider varchar (30),
 LandlineNumber bigint unique
 )
insert into contactphone3 values (101, 983345674, 'hihi',null)
insert into contactphone3 values (102, 983345828, 'hahi',55500)
insert into contactphone3 values (103, 983345663, 'haha',00055)
go
select * from contactphone3
go

create table  PhoneExpenses(
  Expenses_ID int primary key,
  MobileNumber bigint foreign key references contactphone3 (mobileNumber),
  Amount bigint check (amount > 0 )
  )
  go
  insert into  PhoneExpenses(Expenses_ID, MobileNumber, Amount)
  values (1 , 389191, 10 )
  go
  insert into PhoneExpenses(Expenses_ID, MobileNumber, Amount)
  values (1 , 9999, 10 )
  go
  insert into PhoneExpenses(Expenses_ID, MobileNumber, Amount)
  values (2 , 888, 10 )
  go
  insert into PhoneExpenses(Expenses_ID, MobileNumber, Amount)
  values (2 ,777, -2 )
  go
  select * from PhoneExpenses
  go
  alter table contactphone3
  alter column serviceProvider varchar (45)
go
select * from contactphone3
  go
  alter table storeProduct
   drop constraint CHECK_PICE

create table student 
(rollNumber int,
name varchar(30),
class varchar(30),
section varchar(30),
mobile varchar(30),
primary key (rollNumber, mobile));

insert into student(rollNumber, name,class,section,mobile)
values (1,'Dao','cu_hien','e', '02020202');
insert into student(rollNumber, name,class,section,mobile)
values (2,'Dao','cu_hien','b', '02020202');
insert into student(rollNumber, name,class,section,mobile)
values (3,'Dao','cu_hien','v', '02020202');
insert into student(rollNumber, name,class,section,mobile)
values (4,'Dao','cu_hien','e', '02020202');
select * from student