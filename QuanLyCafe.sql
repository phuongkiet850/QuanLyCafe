create database QuanLyCafe
use QuanLyCafe

drop table TableCf
drop table Category
drop table Menu
drop table Bill
drop table DetailBill
drop table Log
drop table Staff
drop table Payment
drop table Material

create table TableCf
(
	IdTable int primary key  DEFAULT DBO.AUTO_IDTable(),
	NameTable nvarchar(10),
	Status nvarchar(10)
);

create table Category
(
	IDCategory varchar(10) primary key,
	NameCategory nvarchar(50),
);

create table Menu
(
	IdMenu int primary key  DEFAULT DBO.AUTO_IDMenu(),
	Name nvarchar(100),
	Amount int,
	Price float,
	CategoryID varchar(10) references Category(IDCategory),
	Picture varchar(150)
);

create table Material
(
	IdMeterial nvarchar(50) primary key,
	NameMeterial nvarchar(100),
	Amount int,
	Type nvarchar(10),
	Status nvarchar(20),
	Producer nvarchar(50),
	ImportPrice float,
	ImportDate date,
	CategoryID varchar(10) references Category(IDCategory),
	Picture varchar(150)
);

create table Bill
(
	IdBill int primary key  DEFAULT DBO.AUTO_IDBill(),
	IdTable int references TableCf(IdTable),
	CheckIn dateTime,
	Total float,
	IdVoucher nvarchar(10) references Voucher(IdVoucher),
	IdPayment varchar(10) references Payment(IdPayment),
	IdStaff nvarchar(5) references Staff(IdStaff)
);

create table DetailBill
(
	IdDetailBill int primary key  DEFAULT DBO.AUTO_IDDetailBill(),
	IdBill int references Bill(IdBill),
	IdMenu int references Menu(IdMenu),
	Amount int,
	Note nvarchar(100)
);

create table Log
(
	ID int identity(1,1) primary key,
	IdStaff nvarchar(5),
	Action nvarchar(30),
	Object nvarchar(20),
	IdObject nvarchar(20),
	DateStart datetime
);

create table Voucher
(
	IdVoucher nvarchar(10) primary key not null,
	NameVoucher nvarchar(50)   not null,
	PercentVoucher float   not null
);

create table Staff
(
	IdStaff nvarchar(5) primary key  DEFAULT DBO.AUTO_IDStaff(),
	NameStaff nvarchar(50)  not null,
	Address nvarchar(100)   not null,
	PhoneNumber nvarchar (11)   not null,
	Email nvarchar(50)   not null,
	Gender nvarchar(4)   not null,
	BirthDay date   not null,
	Role nvarchar(20)   not null,
	Password nvarchar(50)   not null,
	Picture nvarchar(150)  not null,
	Status nvarchar(50)  not null
);

create table Payment
(
	IdPayment varchar(10) primary key,
	Method nvarchar(50),
);

create table Statistic
(
	IdStatistic int primary key  DEFAULT DBO.AUTO_IDStatistic(),
	IdBill int,
	Total float,
	Shift nvarchar(10),
	NameStaff nvarchar(50),
	DateEnd datetime
);

create table DetailStatistic
(
	IdDetailStatistic int primary key  DEFAULT DBO.AUTO_IDDetailStatistic(),
	IdStatistic int references  Statistic (IdStatistic),
	NameMenu nvarchar(100),
	Amount int,
	DateStart datetime
);

	drop FUNCTION AUTO_IDNV

	CREATE FUNCTION AUTO_IDStaff()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(*) FROM Staff) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(IdStaff, 3)) FROM Staff
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN  'NV0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

SELECT * from AUTO_IDStaff
---------------------------------------------

drop FUNCTION AUTO_IDTable
CREATE FUNCTION AUTO_IDTable()
RETURNS int
AS
BEGIN
	DECLARE @ID int
	IF (SELECT COUNT(*) FROM TableCf) = 0
		SET @ID = 0
	ELSE
		SELECT @ID = IdTable FROM TableCf
		SET @ID = @ID + 1
	RETURN @ID
END

drop FUNCTION AUTO_IDStatistic
CREATE FUNCTION AUTO_IDStatistic()
RETURNS int
AS
BEGIN
	DECLARE @ID int
	IF (SELECT COUNT(*) FROM Statistic) = 0
		SET @ID = 0
	ELSE
		SELECT @ID = IdStatistic FROM Statistic
		SET @ID = @ID + 1
	RETURN @ID
END

drop FUNCTION AUTO_IDDetailStatistic
CREATE FUNCTION AUTO_IDDetailStatistic()
RETURNS int
AS
BEGIN
	DECLARE @ID int
	IF (SELECT COUNT(*) FROM DetailStatistic) = 0
		SET @ID = 0
	ELSE
		SELECT @ID = IdDetailStatistic FROM DetailStatistic
		SET @ID = @ID + 1
	RETURN @ID
END

drop FUNCTION AUTO_IDMenu

CREATE FUNCTION AUTO_IDMenu()
RETURNS int
AS
BEGIN
	DECLARE @ID int
	IF (SELECT COUNT(*) FROM Menu) = 0
		SET @ID = 0
	ELSE
		SELECT @ID = IdMenu FROM Menu
		SET @ID = @ID + 1
	RETURN @ID
END


drop FUNCTION AUTO_IDBill
CREATE FUNCTION AUTO_IDBill()
RETURNS int
AS
BEGIN
	DECLARE @ID int
	IF (SELECT COUNT(*) FROM Bill) = 0
		SET @ID = 0
	ELSE
		SELECT @ID = IdBill FROM Bill
		SET @ID = @ID + 1
	RETURN @ID
END

drop FUNCTION AUTO_IDDetailBill
CREATE FUNCTION AUTO_IDDetailBill()
RETURNS int
AS
BEGIN
	DECLARE @ID int
	IF (SELECT COUNT(*) FROM DetailBill) = 0
		SET @ID = 0
	ELSE
		SELECT @ID = IdDetailBill FROM DetailBill
		SET @ID = @ID + 1
	RETURN @ID
END

declare @i int = 1
while @i <= 50
begin
if @i < 10
	insert into TableCf (NameTable, Status) values (N'Bàn 0' + cast(@i as nvarchar(100)), N'Tr?ng')
else
	insert into TableCf (NameTable, Status) values (N'Bàn ' + cast(@i as nvarchar(100)), N'Tr?ng')
 set @i = @i +1;
end

---------------------------------------------------------------------------

drop PROC sp_ListTable

	create proc sp_ListTable
	as
	begin try
		begin tran
			
			select *  from TableCf
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_ListTable
---------------------------------------------------------------------------

drop PROC sp_ListMenu

	create proc sp_ListMenu
			@CategoryID varchar(10)
	as
	begin try
		begin tran
			
			select *  from Menu where CategoryID = @CategoryID
			order by Name
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_ListMenu @CategoryID = 'SD'
---------------------------------------------------------------------------

drop PROC sp_DetailBill

	create proc sp_DetailBill
		@IdTable int
	as
	begin try
		begin tran
			
			select Name, DetailBill.Amount, Price, Price * DetailBill.Amount as Total, CheckIn, PercentVoucher, Note, NameStaff, DetailBill.IdBill, Bill.IdBill, IdDetailBill from DetailBill
			join Bill on DetailBill.IdBill = Bill.IdBill
			join Menu on DetailBill.IdMenu = Menu.IdMenu
			left join Staff on Bill.IdStaff = Staff.IdStaff
			left join Voucher on Bill.IdVoucher = Voucher.IdVoucher
			where IdTable = @IdTable
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_DetailBill @IdTable = 5
---------------------------------------------------------------------------
create proc sp_DetailBill_DGV
		@IdTable int
	as
	begin try
		begin tran
			
			select Name as 'Tên món', DetailBill.Amount as 'Số lượng', Price as 'Giá' from DetailBill
			join Bill on DetailBill.IdBill = Bill.IdBill
			join Menu on DetailBill.IdMenu = Menu.IdMenu
			where IdTable = @IdTable
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_DetailBill_DGV @IdTable = 5
---------------------------------------------------------------------------
drop proc sp_BillTable_DGV
create proc sp_BillTable_DGV
		@IdTable int
	as
	begin try
		begin tran
			
			select IdDetailBill, Name as 'Tên món', DetailBill.Amount as 'Số lượng', Note as 'Ghi chú' from DetailBill
			join Bill on DetailBill.IdBill = Bill.IdBill
			join Menu on DetailBill.IdMenu = Menu.IdMenu
			where IdTable = @IdTable
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_BillTable_DGV @IdTable = 1
---------------------------------------------------------------------------
create proc sp_TagItem
		@IdMenu int
	as
	begin try
		begin tran
			
			select * from Menu
			where IdMenu = @IdMenu
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_TagItem @IdMenu = 1
---------------------------------------------------------------------------
create proc sp_SumTotalBill
		@IdTable int
	as
	begin try
		begin tran
			select Sum(Price * DetailBill.Amount) from DetailBill
			join Bill on DetailBill.IdBill = Bill.IdBill
			join Menu on DetailBill.IdMenu = Menu.IdMenu
			where IdTable = @IdTable
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_SumTotalBill @IdTable = 5
---------------------------------------------------------------------------

drop PROC sp_Table

	create proc sp_Table
		@IdTable int
	as
	begin try
		begin tran
			
			select * from TableCf
			where IdTable = @IdTable
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_Table @IdTable = 5
---------------------------------------------------------------------------
drop PROC sp_AcceptLogin

	create proc sp_AcceptLogin
			@Email nvarchar(50),
			@Password nvarchar(50)
	as
	begin try
		begin tran
			
			select *  from Staff
            where Email =  @Email  and Password = @Password
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

---------------------------------------------------------------------------

	drop PROC sp_ForgotPassword

	create proc sp_ForgotPassword
			@Email nvarchar(50)		
	as
	begin try
		begin tran
			
			select *  from Staff
            where Email =  @Email
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_ForgotPassword @Email = 'kiettpps12245@fpt.edu.vn'

---------------------------------------------------------------------------
	drop PROC sp_UpdatePassword

	create proc sp_UpdatePassword
			@Email nvarchar(50),	
			@Password nvarchar(50)		
	as
	begin try
		begin tran
			
			Update Staff
			set Password = @Password
			where Email = @Email
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_UpdatePassword

	------------------------------------------------------------------------------------

	drop PROC sp_Merge

	create proc sp_Merge
			@NewIdTable int,
			@OldIdTable int,	
			@NewIdBill int,
			@OldIdBill int
	as
	begin try
		begin tran
			
			Update TableCf
			set Status = N'Trống'
			where IdTable = @OldIdTable

			Update TableCf
			set Status = N'Có người'
			where IdTable = @NewIdTable

			Update DetailBill
			set IdBill = @NewIdBill
			where IdBill = @OldIdBill

			delete from Bill
			where IdTable = @OldIdTable
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_MergeTable

	------------------------------------------------------------------------------------

	drop PROC sp_Switch

	create proc sp_Switch
			@NewIdTable int,
			@OldIdTable int	
	as
	begin try
		begin tran
			
			Update TableCf
			set Status = N'Trống'
			where IdTable = @OldIdTable

			Update TableCf
			set Status = N'Có người'
			where IdTable = @NewIdTable

			Update Bill
			set IdTable = @NewIdTable
			where IdTable = @OldIdTable
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_ChangeTable

	------------------------------------------------------------------------------------

		drop PROC sp_DeleteBill

	create proc sp_DeleteBill
			@IdTable int,
			@IdBill int
	as
	begin try
		begin tran
			
			delete from DetailBill
			where IdBill = @IdBill

			delete from Bill
			where IdTable = @IdTable

			Update TableCf
			set Status = N'Trống'
			where IdTable = @IdTable
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_UpdatePassword

	------------------------------------------------------------------------------------

		drop PROC sp_AddBill

	create proc sp_AddBill
			@IdTable int,
			@CheckIn datetime,
			@IdVoucher varchar(10),
			@IdPayment varchar(10),
			@IdStaff nvarchar(5)
	as
	begin try
		begin tran
			
			insert into Bill(IdTable, CheckIn, IdVoucher, IdPayment, IdStaff) values
			(@IdTable, @CheckIn, @IdVoucher, @IdPayment, @IdStaff)
			
			Update TableCf
			set Status = N'Có người'
			where IdTable = @IdTable

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_UpdatePassword
-----------------------------------------------------------------------------------

	drop PROC sp_Delete

	create proc sp_Delete
			@IdTable int,
			@IdDetailBill int	
	as
	begin try
		begin tran
			DECLARE @ID int
			set @ID = (select IdBill from Bill where IdTable = @IdTable)

			delete from DetailBill
			where IdDetailBill = @IdDetailBill
			
			if (select count(*) from DetailBill where IdBill = @ID) = 0 
				begin
					delete from Bill
					where IdTable = @IdTable

					Update TableCf
					set Status = N'Trống'
					where IdTable = @IdTable
				end

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_ChangeItemBill @IdTable = 16, @IdDetailBill = 3

	------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------

		drop PROC sp_AddDesertToBill

	create proc sp_AddDesertToBill
			@IdTable int,
			@IdMenu int,
			@Amount int,
			@Note nvarchar(100)
	as
	begin try
		begin tran

			DECLARE @ID int
			set @ID = (select IdBill from Bill where IdTable = @IdTable)

			insert into DetailBill(IdBill, IdMenu, Amount, Note) values
			(@ID, @IdMenu, @Amount, @Note)
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_UpdatePassword
-----------------------------------------------------------------------------------