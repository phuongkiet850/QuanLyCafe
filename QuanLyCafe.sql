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
	CheckIn datetime,
	CheckOut datetime,
	PercentVoucher float,
	Method nvarchar(50)
);

create table DetailStatistic
(
	IdDetailStatistic int primary key  DEFAULT DBO.AUTO_IDDetailStatistic(),
	IdStatistic int references  Statistic (IdStatistic),
	NameMenu nvarchar(100),
	Amount int
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

	exec sp_DetailBill @IdTable = 6
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
			
			select IdDetailBill, Name as 'Tên món', DetailBill.Amount as 'Số lượng', Note as 'Ghi chú', Menu.IdMenu from DetailBill
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

	exec sp_AcceptLogin @Email = 'admin', @Password = '33354741122871651676713774147412831195'

	exec sp_AcceptLogin @Email = '' or 1 = 1, @Password = '33354741122871651676713774147412831195'
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
	exec sp_ForgotPassword @Email = 'admin'
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

	exec sp_Delete @IdTable = 12, @IdDetailBill = 0

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
create proc sp_ListCategory
	as
	begin try
		begin tran
			
			select * from Category
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_TagItem @IdMenu = 1
---------------------------------------------------------------------------
drop proc sp_ListMenu_DGV
create proc sp_ListMenu_DGV
	as
	begin try
		begin tran
			
			select Name as 'Tên món', Price as 'Giá', NameCategory as 'Danh mục', IdMenu, Picture  from Menu
			join Category on Menu.CategoryID = Category.IDCategory
			order by  NameCategory
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_TagItem @IdMenu = 1
---------------------------------------------------------------------------

	drop PROC sp_AddMenu

	create proc sp_AddMenu
			@Name nvarchar(100),
			@Price float,
			@CategoryID nvarchar(10),
			@Picture nvarchar(150)
	as
	begin try
		begin tran

			insert into Menu(Name, Price, CategoryID, Picture) values
			(@Name, @Price, @CategoryID, @Picture)
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_UpdatePassword
-----------------------------------------------------------------------------------
	drop PROC sp_UpdateMenu

	create proc sp_UpdateMenu
			@Name nvarchar(100),
			@Price float,
			@CategoryID nvarchar(10),
			@Picture nvarchar(150),
			@IdMenu int
	as
	begin try
		begin tran
			
			update Menu
			set Name = @Name, Price = @Price, CategoryID = @CategoryID, Picture = @Picture
			where IdMenu = @IdMenu
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_UpdatePassword
-----------------------------------------------------------------------------------

	drop PROC sp_DeleteMenu

	create proc sp_DeleteMenu
			@IdMenu int
	as
	begin try
		begin tran
			
			Delete from Menu
			where IdMenu = @IdMenu
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_DeleteMenu @IdMenu = 55
-----------------------------------------------------------------------------------
drop PROC sp_FindMenu_Category
	
	create proc sp_FindMenu_Category
				@Find nvarchar(255),
				@IdCategory nvarchar(10)
	as
	begin try
		begin tran
			
			select Name as 'Tên món', Price as 'Giá', NameCategory as 'Danh mục', IdMenu, Picture  from Menu
			join Category on Menu.CategoryID = Category.IDCategory
			where IDCategory = @IdCategory and Name like '%' + @Find + '%'
			order by  NameCategory
             
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindMenu_Category @Find = N'Sữa', @IdCategory = 'CF'

	-----------------------------------------------------------------------------------
drop PROC sp_FindMenu_Name
	
	create proc sp_FindMenu_All
				@Find nvarchar(255)
	as
	begin try
		begin tran
			
			select Name as 'Tên món', Price as 'Giá', NameCategory as 'Danh mục', IdMenu, Picture  from Menu
			join Category on Menu.CategoryID = Category.IDCategory
			where Name like '%' + @Find + '%'
			order by  NameCategory
             
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindMenu_All @Find = N'asdds'
	exec sp_FindMenu_All @Find = N'Late'

-----------------------------------------------------------------------------------
drop PROC sp_ListPayMent
	
	create proc sp_ListPayMent
	as
	begin try
		begin tran
			
			select * from Payment
             order by IdPayment
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindMenu_All @Find = N'Sữa'

-----------------------------------------------------------------------------------
drop PROC sp_ListVoucher
	
	create proc sp_ListVoucher
	as
	begin try
		begin tran
			
			select * from Voucher
             order by PercentVoucher
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindMenu_All @Find = N'Sữa'


-----------------------------------------------------------------------------------
drop PROC sp_AddStatistic
	
	create proc sp_AddStatistic
		@IdBill int,
		@Total float,
		@Shift nvarchar(10),
		@NameStaff nvarchar(50),
		@CheckIn datetime,
		@CheckOut datetime,
		@PercentVoucher float,
		@Method nvarchar(50)
	as
	begin try
		begin tran
			
			insert into Statistic(IdBill, Total, Shift, NameStaff, CheckIn, CheckOut, PercentVoucher, Method) values
			(@IdBill, @Total, @Shift, @NameStaff, @CheckIn, @CheckOut, @PercentVoucher, @Method)
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindMenu_All @Find = N'Sữa'

-----------------------------------------------------------------------------------
drop PROC sp_AddDetailStatistic
	
	create proc sp_AddDetailStatistic
		@IdBill int,
		@NameMenu nvarchar(100),
		@Amount int
	as
	begin try
		begin tran
			
			DECLARE @ID int
			set @ID = (select IdStatistic from Statistic where IdBill = @IdBill)

			insert into DetailStatistic(IdStatistic, NameMenu, Amount) values
			(@ID, @NameMenu, @Amount)
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindMenu_All @Find = N'Sữa'

exec sp_AddStatistic @IdBill = 3, @Total = 190300, @Shift = N'Ca tối', @NameStaff = N'Trác Phương Kiệt', @CheckIn = '11/05/2021 9:40:11 PM', @CheckOut = '06/11/2021 4:23:54 AM', @PercentVoucher = 0, @Method = N'Tại chỗ'


-----------------------------------------------------------------------------------
drop PROC sp_ListProfileStaff
	
	create proc sp_ListProfileStaff

	as
	begin try
		begin tran
			
			select * from Staff
			order by IdStaff

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindMenu_All @Find = N'Sữa'

---------------------------------------------

			drop PROC sp_SelectIdStaff
	create proc sp_SelectIdStaff
	as
	begin try
		begin tran
		declare  @ID nvarchar(5)
		set @ID = dbo.AUTO_IDStaff()
		select @ID
		
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran

		print N'Thao tác không thành công'
	end catch

	exec sp_SelectIdStaff

	---------------------------------------------

---------------------------------------------
	drop PROC sp_InsertProfileStaff
	create proc sp_InsertProfileStaff
				@NameStaff nvarchar(50),
				@Address nvarchar(100),
				@PhoneNumber nvarchar(11),
				@Email nvarchar(50),
				@Gender nvarchar(4),
				@BirthDay date,
				@Role nvarchar(20),
				@Password nvarchar(50),
				@Picture nvarchar(150)

	
	as
	begin try
		begin tran
			insert into Staff(NameStaff, Address, PhoneNumber, Email, Gender, BirthDay, Role, Password, Picture, IsDelete) values
			(@NameStaff, @Address, @PhoneNumber, @Email, @Gender, @BirthDay, @Role, @Password, @Picture, 0)

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran

		print N'Thao tác không thành công'
	end catch

	exec sp_InsertProfileNV  @TenNV = N'Trác Phương Kiệt', @DiaChi = N'f', @DienThoai = '0789786646', @Email = 'phuongkiet850@gmail.com', @GioiTinh = N'Nam', @NgaySinh = '2019/01/01', @VaiTro = N'Quản trị viên', @MatKhau = N'Nhân dviên',@Hinh = 'f', @TinhTrang = 'Hoạt động'
	

------------------------------------------------------------------------------------
	drop PROC sp_UpdateProfileStaff

	create proc sp_UpdateProfileStaff
				@IdStaff nvarchar(10),
				@NameStaff nvarchar(50),
				@Address nvarchar(100),
				@PhoneNumber nvarchar(11),
				@Gender nvarchar(4),
				@BirthDay date,
				@Role nvarchar(20),
				@Picture nvarchar(150)
	as
	begin try
		begin tran

			update  Staff
			set NameStaff = @NameStaff, Address = @Address, PhoneNumber = @PhoneNumber, Gender = @Gender, BirthDay = @BirthDay, Role = @Role, Picture = @Picture
			where IdStaff = @IdStaff

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_UpdateProfileNV @MaNV = 'NV41', @TenNV = N'asd', @DiaChi = N'asd', @DienThoai = 'asd', @Email = 'asd', @GioiTinh = N'Nam', @NgaySinh = '9/29/2021 12:00:00 AM', @VaiTro = N'Nhân viên', @Hinh = '', @ID = 41

	--------------------------------------------

drop PROC sp_DeleteProfileStaff
	create proc sp_DeleteProfileStaff
				@IdStaff nvarchar(5)
	as
	begin try
		begin tran

			update  Staff
			set IsDelete = 1
			where IdStaff = @IdStaff

			print N'Thao tác thành công'
		commit tran
	end try
	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_DeleteProfileNV @MaNV = 'NV002'


	---------------------------------------------


	drop PROC sp_SelectIdStaff_DGV
	create proc sp_SelectIdStaff_DGV
				@IdStaff nvarchar(10)
	as
	begin try
		begin tran

			select * from Staff where  IdStaff = @IdStaff
			

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran

		print N'Thao tác không thành công'
	end catch

	exec sp_SelectID @MaNV = 'None40'


-------------------------------------------------------------------	

	drop PROC sp_ListProfileStaff_DGV
	
	create proc sp_ListProfileStaff_DGV
	as
	begin try
		begin tran
				select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Role as 'Vai trò' from Staff
				where IsDelete = 0
				order by IdStaff
        
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindProfileStaff_ID @Find = N'02'


-------------------------------------------------------------------	

---------------------------------------------

	drop PROC sp_FindProfileStaff_All
	
	create proc sp_FindProfileStaff_All
				@Find nvarchar(255)
	as
	begin try
		begin tran
			
			select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Role as 'Vai trò' from Staff
             where  IsDelete = 1 and (NameStaff like N'%' + @Find + '%' or IdStaff like '%' + @Find + '%'or Email like '%' + @Find + '%' or Gender like N'%' + @Find + '%' or 
					Role like N'%' + @Find + '%' or PhoneNumber like '%' + @Find + '%' or Address like N'%' + @Find + '%' or 
					CONVERT(nvarchar, BirthDay, 101)  like '%' + CONVERT(nvarchar, @Find, 101) + '%' or 
					CONVERT(nvarchar, BirthDay, 103)  like '%' + CONVERT(nvarchar, @Find, 103) + '%' or 
					CONVERT(nvarchar, BirthDay, 111)  like '%' + CONVERT(nvarchar, @Find, 111) + '%')

			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindProfileStaff_All @Find = N''


-------------------------------------------------------------------	

	drop PROC sp_FindProfileStaff_FindBy
	
	create proc sp_FindProfileStaff_FindBy
				@FindBy nvarchar(255),
				@Find nvarchar(255)
	as
	begin try
		begin tran
			if @FindBy = 'IdStaff'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Role as 'Vai trò' from Staff
				 where IsDelete = 1 and IdStaff like '%' + @Find + '%'
			else if @FindBy = 'NameStaff'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Role as 'Vai trò' from Staff
				 where IsDelete = 1 and NameStaff like '%' + @Find + '%'
			else if @FindBy = 'Address'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Role as 'Vai trò' from Staff
				 where IsDelete = 1 and Address like '%' + @Find + '%'
			else if @FindBy = 'PhoneNumber'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Role as 'Vai trò' from Staff
				 where IsDelete = 1 and PhoneNumber like '%' + @Find + '%'
			else if  @FindBy = 'BirthDay'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Role as 'Vai trò' from Staff
				 where	IsDelete = 1 and (	CONVERT(nvarchar, BirthDay, 101)  like '%' + CONVERT(nvarchar, @Find, 101) + '%' or 
											CONVERT(nvarchar, BirthDay, 103)  like '%' + CONVERT(nvarchar, @Find, 103) + '%' or 
											CONVERT(nvarchar, BirthDay, 111)  like '%' + CONVERT(nvarchar, @Find, 111) + '%')
			else if @FindBy = 'Email'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Role as 'Vai trò' from Staff
				 where IsDelete = 1 and Email like '%' + @Find + '%'
			else if @FindBy = 'Role'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Role as 'Vai trò' from Staff
				 where IsDelete = 1 and Role like '%' + @Find + '%'
			else if @FindBy = 'Gender'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Role as 'Vai trò' from Staff
				 where IsDelete = 1 and Gender like '%' + @Find + '%'
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindProfileStaff_FindBy @Find = N''

exec sp_FindProfileStaff_FindBy @FindBy = 'Gender',  @Find = N''


exec sp_FindProfileStaff_FindBy @Find = N'a', @FindBy = N'NameStaff'


---------------------------------------------

			drop PROC sp_ListVoucher
	create proc sp_ListVoucher

	as
	begin try
		begin tran

			select * from Voucher
			order by PercentVoucher

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran

		print N'Thao tác không thành công'
	end catch

	exec sp_ListProducts_ALL


-----------------------------------------------------------------------------------------------------------------
	
	drop proc sp_ListVoucher_DGV
	create proc sp_ListVoucher_DGV

	as
	begin try
		begin tran
			
			select IdVoucher as 'Mã khuyến mãi', NameVoucher as 'Tên khuyến mãi', PercentVoucher
			from Voucher
			order by PercentVoucher

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

---------------------------------------------
	drop PROC sp_SelectIdVoucher
	create proc sp_SelectIdVoucher
				@IdVoucher nvarchar(10)
	as
	begin try
		begin tran

			select * from Voucher where  IdVoucher = @IdVoucher
			order by PercentVoucher
			

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran

		print N'Thao tác không thành công'
	end catch

	@MaNV = 'None40'
	exec sp_SelectIdVoucher @IdVoucher 'ASD'
---------------------------------------------
	
				drop PROC sp_InsertVoucher
	create proc sp_InsertVoucher
					@IdVoucher nvarchar(10),
					@NameVoucher nvarchar(50),
					@Percent float				
	as
	begin try
		begin tran

			insert into Voucher values 
			(@IdVoucher, @NameVoucher, @Percent)
			

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran

		print N'Thao tác không thành công'
	end catch

	exec sp_InsertKM


	-----------------------------------------------------------------------------------------------------------------
	
	drop proc sp_UpdateVoucher
	create proc sp_UpdateVoucher
				@IdVoucher nvarchar(10),
				@NameVoucher nvarchar(50),
				@Percent float
	as
	begin try
		begin tran
			
			update Voucher
			set  NameVoucher = @NameVoucher, PercentVoucher = @Percent
			where IdVoucher = @IdVoucher

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	-----------------------------------------------------------------------------------------------------------------
	
	drop proc sp_DeleteVoucher
	create proc sp_DeleteVoucher
				@IdVoucher nvarchar(10)
	as
	begin try
		begin tran
			
			delete from Voucher
			where IdVoucher = @IdVoucher

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	-----------------------------------------------------------------------------------------------------------------

drop PROC sp_FindVoucher
	
	create proc sp_FindVoucher
				@Find nvarchar(255)
	as
	begin try
		begin tran
			
			select IdVoucher as 'Mã khuyến mãi', NameVoucher as 'Tên khuyến mãi', PercentVoucher
			from Voucher
			where IdVoucher like '%' + @Find + '%' or NameVoucher like N'%' + @Find + '%' or PercentVoucher like '%' + @Find + '%'
			order by PercentVoucher

			print N'Thao tác thành công'

		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindVoucher @Find = N'd' 

		-----------------------------------------------------------------------------------------------------------------

drop PROC sp_Detach
	create proc sp_Detach
				@IdTable int,
				@IdDetailBill int,
				@Amount int,
				@AmountNew int,
				@Note nvarchar(100)
	as
	begin try
		begin tran
			DECLARE @IdBill int
			set @IdBill = (select IdBill from Bill where IdTable = @IdTable)

			DECLARE @IdDetailBillNew int
			set @IdDetailBillNew = (select TOP(1) IdDetailBill from DetailBill where IdBill = @IdBill order by IdDetailBill desc)

			if (@Amount > 1)
				begin
					Update DetailBill
					set IdBill = @IdBill, Amount = @AmountNew, Note = @Note
					where IdDetailBill = @IdDetailBillNew

					Update DetailBill
					set Amount = @Amount - @AmountNew
					where IdDetailBill = @IdDetailBill
				end
			else
				begin
					Update DetailBill
					set IdBill = @IdBill
					where IdDetailBill = @IdDetailBill
				end

			if (select Amount from DetailBill where IdDetailBill = @IdDetailBill) = 0
				begin
					Delete from DetailBill 
					where IdDetailBill = @IdDetailBill
				end
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindVoucher @Find = N'd' 

	exec sp_Detach @IdTable = 11, @IdDetailBill = 13, @Amount = 4, @AmountNew = 1

-----------------------------------------------------------------------------------------------------------------

drop PROC sp_MergeBill
	create proc sp_MergeBill
				@IdTable int,
				@IdDetailBill int,
				@Amount int,
				@AmountNew int
	as
	begin try
		begin tran
			DECLARE @IdBill int
			set @IdBill = (select IdBill from Bill where IdTable = @IdTable)

			DECLARE @IdDetailBillNew int
			set @IdDetailBillNew = (select TOP(1) IdDetailBill from DetailBill where IdBill = @IdBill order by IdDetailBill desc)

			Update DetailBill
			set Amount = @Amount + @AmountNew
			where IdDetailBill = @IdDetailBill

			Delete from DetailBill 
			where IdDetailBill = @IdDetailBillNew
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindVoucher @Find = N'd' 

	exec sp_MergeBill @IdTable = 24, @IdDetailBill = 30, @Amount = 2, @AmountNew = 1

	exec sp_DetailBill @IdTable = 1
-----------------------------------------------------------------------------------------------------------------

drop PROC sp_MergeBillMenu
	create proc sp_MergeBillMenu
				@IdDetailBill int,
				@Amount int,
				@AmountNew int
	as
	begin try
		begin tran

			Update DetailBill
			set Amount = @Amount + @AmountNew
			where IdDetailBill = @IdDetailBill

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

	exec sp_FindVoucher @Find = N'd' 

	exec sp_MergeBill @IdTable = 24, @IdDetailBill = 30, @Amount = 2, @AmountNew = 1

	exec sp_DetailBill @IdTable = 1


-----------------------------------------------------------------------------------------------------------------

drop PROC sp_ListMaterial
	create proc sp_ListMaterial
	as
	begin try
		begin tran

			select * from Material

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch


-----------------------------------------------------------------------------------------------------------------

drop PROC sp_ListMaterial_DGV
	create proc sp_ListMaterial_DGV
	as
	begin try
		begin tran

			select IdMaterial as 'Mã số', NameMaterial as 'Tên', Amount as 'Số lượng', Type as 'Đơn vị tính', Producer as 'Nhà sản xuất' from Material

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

-----------------------------------------------------------------------------------------------------------------

drop PROC sp_ListMaterial_Id
	create proc sp_ListMaterial_Id
				@IdMaterial nvarchar(50)
	as
	begin try
		begin tran

			select * from Material
			where IdMaterial = @IdMaterial

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch	

-----------------------------------------------------------------------------------------------------------------

drop PROC sp_InsertMaterial
	create proc sp_InsertMaterial
				@IdMaterial nvarchar(50),
				@NameMaterial nvarchar(50),
				@Amount int,
				@Type nvarchar(10),
				@Status nvarchar(20),
				@Producer nvarchar(50),
				@ImportPrice float,
				@ImportDate Date,
				@Picture nvarchar(150)
	as
	begin try
		begin tran

			insert into Material values
			(@IdMaterial, @NameMaterial, @Amount, @Type, @Status, @Producer, @ImportPrice, @ImportDate, @Picture)
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
	exec sp_InsertMaterial @IdMaterial = 'ADS', @NameMaterial = N'asd', @Amount = 10, @Type = N'Chai/Lon', @Status = N'Còn hàng', @Producer = N'asd', @ImportPrice = '22222', @ImportDate = '11/15/2021 12:00:00 AM', @Picture = '\Image\Material\Syrup\siro-torani-cam-torani-orange-syrup-750ml.png'
-----------------------------------------------------------------------------------------------------------------

drop PROC sp_UpdateMaterial
	create proc sp_UpdateMaterial
				@IdMaterial nvarchar(50),
				@NameMaterial nvarchar(50),
				@Amount int,
				@Type nvarchar(10),
				@Status nvarchar(20),
				@Producer nvarchar(50),
				@ImportPrice float,
				@ImportDate Date,
				@Picture nvarchar(150)
	as
	begin try
		begin tran
			
			Update Material
			set NameMaterial = @NameMaterial, Amount = @Amount, Type = @Type, Status = @Status, Producer = @Producer, ImportPrice = @ImportPrice, ImportDate = @ImportDate, Picture = @Picture
			where IdMaterial = @IdMaterial

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

-----------------------------------------------------------------------------------------------------------------

drop PROC sp_FindMaterial
	create proc sp_FindMaterial
				@Find nvarchar(255)
	as
	begin try
		begin tran
			
			select IdMaterial as 'Mã số', NameMaterial as 'Tên', Amount as 'Số lượng', Type as 'Đơn vị tính', Producer as 'Nhà sản xuất' from Material
			where IdMaterial like '%' + @Find + '%' or NameMaterial like '%' + @Find + '%' 

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

-----------------------------------------------------------------------------------------------------------------

drop PROC sp_DeleteMaterial
	create proc sp_DeleteMaterial
				@IdMaterial nvarchar(50)
	as
	begin try
		begin tran
			
			Delete from Material
			where IdMaterial = @IdMaterial

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch

