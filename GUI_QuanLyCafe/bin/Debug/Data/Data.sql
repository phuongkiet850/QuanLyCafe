USE [master]
GO
/****** Object:  Database [QuanLyCafe]    Script Date: 11/04/2021 8:22:50 PM ******/
CREATE DATABASE [QuanLyCafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyCafe', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.TRACPHUONGKIET\MSSQL\DATA\QuanLyCafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyCafe_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.TRACPHUONGKIET\MSSQL\DATA\QuanLyCafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyCafe] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyCafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyCafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyCafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyCafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyCafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyCafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyCafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyCafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyCafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyCafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyCafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyCafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyCafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyCafe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyCafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyCafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyCafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyCafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyCafe] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyCafe] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyCafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyCafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyCafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyCafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyCafe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyCafe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyCafe', N'ON'
GO
ALTER DATABASE [QuanLyCafe] SET QUERY_STORE = OFF
GO
USE [QuanLyCafe]
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDBill]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDBill]()
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
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDDetailBill]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDDetailBill]()
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
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDMenu]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDMenu]()
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
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDStaff]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE FUNCTION [dbo].[AUTO_IDStaff]()
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
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDTable]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDTable]()
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
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[IdBill] [int] NOT NULL,
	[IdTable] [int] NULL,
	[CheckIn] [datetime] NULL,
	[IdVoucher] [nvarchar](10) NULL,
	[IdPayment] [varchar](10) NULL,
	[IdStaff] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IDCategory] [varchar](10) NOT NULL,
	[NameCategory] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailBill]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailBill](
	[IdDetailBill] [int] NOT NULL,
	[IdBill] [int] NULL,
	[IdMenu] [int] NULL,
	[Amount] [int] NULL,
	[Note] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetailBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdStaff] [nvarchar](5) NULL,
	[Action] [nvarchar](30) NULL,
	[Object] [nvarchar](20) NULL,
	[IdObject] [nvarchar](20) NULL,
	[DateStart] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[IdMeterial] [nvarchar](50) NOT NULL,
	[NameMeterial] [nvarchar](100) NULL,
	[Amount] [int] NULL,
	[Type] [nvarchar](10) NULL,
	[Status] [nvarchar](20) NULL,
	[Producer] [nvarchar](50) NULL,
	[ImportPrice] [float] NULL,
	[ImportDate] [date] NULL,
	[CategoryID] [varchar](10) NULL,
	[Picture] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMeterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Price] [float] NULL,
	[CategoryID] [varchar](10) NULL,
	[Picture] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[IdPayment] [varchar](10) NOT NULL,
	[Method] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPayment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[IdStaff] [nvarchar](5) NOT NULL,
	[NameStaff] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](4) NOT NULL,
	[BirthDay] [date] NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Picture] [nvarchar](150) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdStaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableCf]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableCf](
	[IdTable] [int] NOT NULL,
	[NameTable] [nvarchar](10) NULL,
	[Status] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 11/04/2021 8:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[IdVoucher] [nvarchar](10) NOT NULL,
	[NameVoucher] [nvarchar](50) NOT NULL,
	[PercentVoucher] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVoucher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bill] ([IdBill], [IdTable], [CheckIn], [IdVoucher], [IdPayment], [IdStaff]) VALUES (1, 22, CAST(N'2021-11-03T00:00:00.000' AS DateTime), N'#NULL', NULL, N'NV001')
GO
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'CF', N'Cafe')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'CK', N'Cake')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'FD', N'Food')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'FZ', N'Freeze')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'SD', N'Soft Drink')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'TE', N'Tea')
GO
INSERT [dbo].[DetailBill] ([IdDetailBill], [IdBill], [IdMenu], [Amount], [Note]) VALUES (1, 1, 1, 1, N'(Không đường)')
INSERT [dbo].[DetailBill] ([IdDetailBill], [IdBill], [IdMenu], [Amount], [Note]) VALUES (2, 1, 5, 1, NULL)
INSERT [dbo].[DetailBill] ([IdDetailBill], [IdBill], [IdMenu], [Amount], [Note]) VALUES (3, 1, 1, 1, NULL)
INSERT [dbo].[DetailBill] ([IdDetailBill], [IdBill], [IdMenu], [Amount], [Note]) VALUES (4, 1, 9, 1, NULL)
GO
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (1, N'Coca', 20000, N'SD', N'\Image\SoftDrink\Coca.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (2, N'7Up', 20000, N'SD', N'\Image\SoftDrink\7up.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (3, N'Espresso', 44000, N'CF', N'\Image\Cafe\Espresso.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (4, N'Cappucino', 54000, N'CF', N'\Image\Cafe\Cappucino.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (5, N'Late', 54000, N'CF', N'\Image\Cafe\Late.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (6, N'Nước suối', 15000, N'SD', N'\Image\SoftDrink\Aquafina.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (7, N'Americano', 44000, N'CF', N'\Image\Cafe\Americano.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (8, N'Bạc xỉu đá', 29000, N'CF', N'\Image\Cafe\BacXiuDa.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (9, N'Phin sữa (đá)', 29000, N'CF', N'\Image\Cafe\PhinSuaDa.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (10, N'Phin sữa (nóng)', 29000, N'CF', N'\Image\Cafe\PhinSuaNong.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (11, N'Phin đen (đá)', 29000, N'CF', N'\Image\Cafe\PhinDenDa.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (12, N'Phin đen (nóng)', 29000, N'CF', N'\Image\Cafe\PhinDenNong.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (13, N'Phindi kem sữa', 39000, N'CF', N'\Image\Cafe\PhinDiKemSua.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (14, N'Phindi hồng trà', 45000, N'CF', N'\Image\Cafe\PhinDiHongTra.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (15, N'Phindi choco', 39000, N'CF', N'\Image\Cafe\PhinDiChoco.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (16, N'Phindi hạnh nhân', 39000, N'CF', N'\Image\Cafe\PhinDiHanhNhan.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (17, N'Caramel machiato', 59000, N'CF', N'\Image\Cafe\CaramelMacchiato.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (18, N'Mocha macchiato', 59000, N'CF', N'\Image\Cafe\MochaMacchiato.PNG')
GO
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [Status]) VALUES (N'NV001', N'Trác Phương Kiệt', N'da', N'0769499550', N'phuongkiet850@gmail.com', N'Nam', CAST(N'2001-01-29' AS Date), N'Thu ngân', N'33354741122871651676713774147412831195', N'asd', N'Hoạt động')
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [Status]) VALUES (N'NV002', N'admin', N'd', N'0769499550', N'admin', N'None', CAST(N'2001-01-29' AS Date), N'Quản lý', N'33354741122871651676713774147412831195', N'ds', N'Hoạt động')
GO
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (1, N'Bàn 01', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (2, N'Bàn 02', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (3, N'Bàn 03', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (4, N'Bàn 04', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (5, N'Bàn 05', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (6, N'Bàn 06', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (7, N'Bàn 07', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (8, N'Bàn 08', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (9, N'Bàn 09', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (10, N'Bàn 10', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (11, N'Bàn 11', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (12, N'Bàn 12', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (13, N'Bàn 13', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (14, N'Bàn 14', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (15, N'Bàn 15', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (16, N'Bàn 16', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (17, N'Bàn 17', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (18, N'Bàn 18', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (19, N'Bàn 19', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (20, N'Bàn 20', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (21, N'Bàn 21', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (22, N'Bàn 22', N'Có người')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (23, N'Bàn 23', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (24, N'Bàn 24', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (25, N'Bàn 25', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (26, N'Bàn 26', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (27, N'Bàn 27', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (28, N'Bàn 28', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (29, N'Bàn 29', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (30, N'Bàn 30', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (31, N'Bàn 31', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (32, N'Bàn 32', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (33, N'Bàn 33', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (34, N'Bàn 34', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (35, N'Bàn 35', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (36, N'Bàn 36', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (37, N'Bàn 37', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (38, N'Bàn 38', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (39, N'Bàn 39', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (40, N'Bàn 40', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (41, N'Bàn 41', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (42, N'Bàn 42', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (43, N'Bàn 43', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (44, N'Bàn 44', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (45, N'Bàn 45', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (46, N'Bàn 46', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (47, N'Bàn 47', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (48, N'Bàn 48', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (49, N'Bàn 49', N'Trống')
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (50, N'Bàn 50', N'Trống')
GO
INSERT [dbo].[Voucher] ([IdVoucher], [NameVoucher], [PercentVoucher]) VALUES (N'#NULL', N'Không có', 0)
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ([DBO].[AUTO_IDBill]()) FOR [IdBill]
GO
ALTER TABLE [dbo].[DetailBill] ADD  DEFAULT ([DBO].[AUTO_IDDetailBill]()) FOR [IdDetailBill]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT ([DBO].[AUTO_IDMenu]()) FOR [IdMenu]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ([DBO].[AUTO_IDStaff]()) FOR [IdStaff]
GO
ALTER TABLE [dbo].[TableCf] ADD  DEFAULT ([DBO].[AUTO_IDTable]()) FOR [IdTable]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([IdPayment])
REFERENCES [dbo].[Payment] ([IdPayment])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([IdStaff])
REFERENCES [dbo].[Staff] ([IdStaff])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([IdTable])
REFERENCES [dbo].[TableCf] ([IdTable])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([IdVoucher])
REFERENCES [dbo].[Voucher] ([IdVoucher])
GO
ALTER TABLE [dbo].[DetailBill]  WITH CHECK ADD FOREIGN KEY([IdBill])
REFERENCES [dbo].[Bill] ([IdBill])
GO
ALTER TABLE [dbo].[DetailBill]  WITH CHECK ADD FOREIGN KEY([IdMenu])
REFERENCES [dbo].[Menu] ([IdMenu])
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD FOREIGN KEY([IdStaff])
REFERENCES [dbo].[Staff] ([IdStaff])
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([IDCategory])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([IDCategory])
GO
/****** Object:  StoredProcedure [dbo].[sp_AcceptLogin]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_AcceptLogin]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_AddBill]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_AddBill]
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
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_BillTable_DGV]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_BillTable_DGV]
		@IdTable int
	as
	begin try
		begin tran
			
			select Name as 'Tên món', DetailBill.Amount as 'Số lượng' from DetailBill
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeTable]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ChangeTable]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBill]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteBill]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DetailBill]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DetailBill]
		@IdTable int
	as
	begin try
		begin tran
			
			select Name, DetailBill.Amount, Price, Price * DetailBill.Amount as Total, CheckIn, PercentVoucher, Note, NameStaff, DetailBill.IdBill as IdDetailBill,Bill.IdBill as IdBill from DetailBill
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DetailBill_DGV]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DetailBill_DGV]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ForgotPassword]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create proc [dbo].[sp_ForgotPassword]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListMenu]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListMenu]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListTable]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListTable]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_MergeTable]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_MergeTable]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_SumTotalBill]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SumTotalBill]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_Table]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create proc [dbo].[sp_Table]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_TagItem]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TagItem]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatePassword]    Script Date: 11/04/2021 8:23:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdatePassword]
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
GO
USE [master]
GO
ALTER DATABASE [QuanLyCafe] SET  READ_WRITE 
GO
