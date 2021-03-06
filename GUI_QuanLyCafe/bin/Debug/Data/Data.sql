USE [master]
GO
/****** Object:  Database [QuanLyCafe]    Script Date: 12/14/2021 9:28:58 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDBill]    Script Date: 12/14/2021 9:28:58 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDDetailBill]    Script Date: 12/14/2021 9:28:58 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDDetailStatistic]    Script Date: 12/14/2021 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDDetailStatistic]()
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
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDMenu]    Script Date: 12/14/2021 9:28:58 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDStaff]    Script Date: 12/14/2021 9:28:58 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDStatistic]    Script Date: 12/14/2021 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_IDStatistic]()
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
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDTable]    Script Date: 12/14/2021 9:28:58 PM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 12/14/2021 9:28:58 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 12/14/2021 9:28:58 PM ******/
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
/****** Object:  Table [dbo].[DetailBill]    Script Date: 12/14/2021 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailBill](
	[IdDetailBill] [int] NOT NULL,
	[IdBill] [int] NULL,
	[IdMenu] [int] NULL,
	[Amount] [int] NULL,
	[Price] [float] NULL,
	[TotalPrice] [float] NULL,
	[Note] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetailBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailStatistic]    Script Date: 12/14/2021 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailStatistic](
	[IdDetailStatistic] [int] NOT NULL,
	[IdStatistic] [int] NULL,
	[NameMenu] [nvarchar](100) NULL,
	[Amount] [int] NULL,
	[Price] [float] NULL,
	[TotalPrice] [float] NULL,
	[Note] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetailStatistic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 12/14/2021 9:28:58 PM ******/
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
/****** Object:  Table [dbo].[Material]    Script Date: 12/14/2021 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[IdMaterial] [nvarchar](50) NOT NULL,
	[NameMaterial] [nvarchar](100) NULL,
	[Amount] [int] NULL,
	[Type] [nvarchar](10) NULL,
	[Status] [nvarchar](20) NULL,
	[Producer] [nvarchar](50) NULL,
	[ImportPrice] [float] NULL,
	[ImportDate] [date] NULL,
	[Picture] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 12/14/2021 9:28:58 PM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 12/14/2021 9:28:58 PM ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 12/14/2021 9:28:58 PM ******/
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
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdStaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statistic]    Script Date: 12/14/2021 9:28:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistic](
	[IdStatistic] [int] NOT NULL,
	[IdBill] [int] NULL,
	[PercentVoucher] [float] NULL,
	[PercentVAT] [float] NULL,
	[Total] [float] NULL,
	[Shift] [nvarchar](10) NULL,
	[NameStaff] [nvarchar](50) NULL,
	[CheckIn] [datetime] NULL,
	[CheckOut] [datetime] NULL,
	[Method] [nvarchar](50) NULL,
	[NameTable] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdStatistic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableCf]    Script Date: 12/14/2021 9:28:58 PM ******/
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
/****** Object:  Table [dbo].[Voucher]    Script Date: 12/14/2021 9:28:58 PM ******/
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
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'CF', N'Cafe')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'CK', N'Cake')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'FD', N'Food')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'FZ', N'Freeze')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'OR', N'Orther')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'SD', N'Soft Drink')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'TE', N'Tea')
GO
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (1, 1, N'Espresso', 1, 44000, 44000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (2, 1, N'Phin Sữa (Đá)', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (3, 2, N'Phin Đen (Nóng)', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (4, 2, N'Phindi Hạnh Nhân', 2, 39000, 78000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (5, 3, N'Espresso', 3, 44000, 132000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (6, 3, N'Phin Đen (Nóng)', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (7, 4, N'Espresso', 1, 44000, 44000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (8, 5, N'Phin Đen (Nóng)', 1, 29000, 29000, N'nhiều đường')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (9, 5, N'Phin Sữa (Đá)', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (10, 6, N'Phin Sữa (Đá)', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (11, 6, N'Phindi Hạnh Nhân', 1, 39000, 39000, N'asd')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (12, 7, N'Mocha Macchiato', 1, 59000, 59000, N'asd')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (13, 7, N'Phindi Choco', 1, 59000, 59000, N'asd')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (14, 8, N'Phin Sữa (Đá)', 1, 29000, 29000, N'asd')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (15, 8, N'Phindi Choco', 1, 29000, 29000, N'sa')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (16, 9, N'Espresso', 4, 44000, 44000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (17, 9, N'Phin Đen (Nóng)', 1, 44000, 44000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (18, 9, N'Phindi Choco', 1, 0, 0, N'sadddddd')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (19, 9, N'Phindi Choco', 1, 0, 0, N'dddddddddddddddddd')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (20, 9, N'Phin Đen (Nóng)', 1, 29000, 29000, N'ddddddddddddd')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (21, 10, N'Freeze Trà Xanh', 1, 49000, 49000, N'nhiều matcha')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (22, 11, N'Espresso', 1, 44000, 44000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (23, 11, N'Phindi Choco', 1, 39000, 39000, N'dddddddddddddd')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (24, 12, N'Phin Sữa (Đá)', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (25, 12, N'Phin Đen (Nóng)', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (26, 13, N'Bạc Xỉu Đá', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (27, 13, N'Phindi Hạnh Nhân', 1, 39000, 39000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (28, 14, N'Phindi Choco', 1, 39000, 39000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (29, 14, N'Phin Sữa (Đá)', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (30, 15, N'Phindi Choco', 1, 39000, 39000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (31, 15, N'Phindi Hồng Trà', 1, 45000, 45000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (32, 16, N'Phin Sữa (Đá)', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (33, 16, N'Phindi Hạnh Nhân', 1, 39000, 39000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (34, 17, N'Espresso', 1, 44000, 44000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (35, 17, N'Phin Sữa (Đá)', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (36, 18, N'Phomai Cafe', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (37, 18, N'Socola HighLands', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (38, 18, N'Gà Xé', 1, 19000, 19000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (39, 18, N'Trà Sen Vàng', 1, 39000, 39000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (40, 19, N'Freeze Trà Xanh', 1, 49000, 49000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (41, 20, N'Nước Suối', 1, 13000, 13000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (42, 21, N'Sành Điệu 200Gr', 1, 55000, 55000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (43, 22, N'Phindi Choco', 1, 39000, 39000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (44, 22, N'Phindi Hồng Trà', 1, 45000, 45000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (45, 23, N'Espresso', 1, 44000, 44000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (46, 23, N'Phindi Kem Sữa', 1, 39000, 39000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (47, 24, N'Espresso', 1, 44000, 44000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (48, 24, N'Phindi Choco', 1, 39000, 39000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (49, 25, N'Phin Sữa (Đá)', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (50, 25, N'Phindi Hạnh Nhân', 1, 39000, 39000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (51, 26, N'Bạc Xỉu Đá', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (52, 26, N'Caramel Phomai', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (53, 26, N'Cafe Đen (Lon)', 1, 60000, 60000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (54, 26, N'Gà Xé', 1, 19000, 19000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (55, 27, N'Phindi Choco', 1, 39000, 39000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (56, 27, N'Trà Thạch Đào', 1, 39000, 39000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (57, 27, N'Caramel Phin Freeze', 1, 49000, 49000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (58, 28, N'Phin Sữa (Đá)', 1, 29000, 29000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (59, 29, N'Espresso', 1, 44000, 44000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (60, 29, N'Cappucino', 1, 54000, 54000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (61, 29, N'Freeze Trà Xanh', 1, 98000, 196000, N'')
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount], [Price], [TotalPrice], [Note]) VALUES (62, 30, N'Espresso', 1, 44000, 44000, N'')
GO
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1, N'NV01', N'xóa', N'menu', N'Late', CAST(N'2021-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (2, N'NV002', N'xóa', N'nhân viên', N'NV003', CAST(N'2021-11-16T18:07:44.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (3, N'NV002', N'sửa', N'nhân viên', N'NV001', CAST(N'2021-11-16T18:08:09.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (4, N'NV002', N'sửa', N'nhân viên', N'NV001', CAST(N'2021-11-16T18:10:31.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (5, N'NV002', N'thêm', N'nhân viên', N'NV004', CAST(N'2021-11-16T18:11:28.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (6, N'NV002', N'xóa', N'nhân viên', N'NV004', CAST(N'2021-11-16T18:12:10.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (7, N'NV002', N'xóa', N'nhân viên', N'NV003', CAST(N'2021-11-16T18:24:00.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (8, N'NV002', N'xóa', N'nhân viên', N'NV004', CAST(N'2021-11-16T18:24:03.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (9, N'NV002', N'sửa', N'nhân viên', N'NV001', CAST(N'2021-11-16T18:24:16.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (10, N'NV002', N'sửa', N'nhân viên', N'NV001', CAST(N'2021-11-16T18:26:03.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (11, N'NV002', N'xóa', N'nhân viên', N'NV004', CAST(N'2021-11-16T18:27:06.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (12, N'NV002', N'xóa', N'nhân viên', N'NV003', CAST(N'2021-11-16T18:27:43.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (13, N'NV002', N'xóa', N'nhân viên', N'NV004', CAST(N'2021-11-16T18:29:53.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (14, N'NV002', N'xóa', N'nhân viên', N'NV003', CAST(N'2021-11-16T18:29:58.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (15, N'NV002', N'sửa', N'nhân viên', N'NV001', CAST(N'2021-11-16T18:30:19.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (16, N'NV002', N'sửa', N'nhân viên', N'NV001', CAST(N'2021-11-16T18:30:26.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (17, N'NV002', N'xóa vùng lưu', N'nhân viên', N'NV005', CAST(N'2021-11-16T18:32:52.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (18, N'NV002', N'sửa', N'nguyên liệu', N'SR_ORANGE', CAST(N'2021-11-16T18:53:27.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (19, N'NV002', N'sửa', N'nguyên liệu', N'SR_ORANGE', CAST(N'2021-11-16T18:54:28.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (20, N'NV002', N'xóa vùng lưu', N'nguyên liệu', N'', CAST(N'2021-11-16T18:54:38.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (21, N'NV002', N'tạo vùng lưu', N'nhân viên', N'NV005', CAST(N'2021-11-16T18:56:25.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (22, N'NV002', N'xóa vùng lưu', N'nhân viên', N'NV005', CAST(N'2021-11-16T18:56:31.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (23, N'NV002', N'tạo vùng lưu', N'nhân viên', N'NV005', CAST(N'2021-11-16T18:57:37.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (24, N'NV002', N'xóa vùng lưu', N'nhân viên', N'NV005', CAST(N'2021-11-16T18:57:42.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (25, N'NV002', N'tạo vùng lưu', N'nguyên liệu', N'', CAST(N'2021-11-16T18:59:04.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (26, N'NV002', N'thêm', N'nguyên liệu', N'ASD', CAST(N'2021-11-16T18:59:13.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (27, N'NV002', N'sửa', N'nguyên liệu', N'ASD', CAST(N'2021-11-16T18:59:28.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (28, N'NV002', N'xóa', N'nguyên liệu', N'ASD', CAST(N'2021-11-16T18:59:31.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (29, N'NV002', N'tạo vùng lưu', N'nguyên liệu', N'', CAST(N'2021-11-16T18:59:43.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (30, N'NV002', N'xóa vùng lưu', N'nguyên liệu', N'', CAST(N'2021-11-16T18:59:44.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (31, N'NV002', N'sửa', N'menu', N'Phin Sữa (Đá)', CAST(N'2021-11-18T16:06:59.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (32, N'NV002', N'sửa', N'menu', N'Phin Sữa (Đá)', CAST(N'2021-11-18T16:07:06.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (33, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:07:14.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (34, N'NV002', N'thêm', N'menu', N'asd', CAST(N'2021-11-18T16:07:18.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (35, N'NV002', N'xóa', N'menu', N'asd', CAST(N'2021-11-18T16:07:52.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (36, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:08:00.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (37, N'NV002', N'xóa vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:08:02.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (38, N'NV002', N'xóa vùng lưu', N'menu', N'd', CAST(N'2021-11-18T16:08:07.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (39, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:09:17.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (40, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:10:36.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (41, N'NV002', N'xóa vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:10:37.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (42, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:11:08.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (43, N'NV002', N'xóa vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:11:26.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (44, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:12:30.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (45, N'NV002', N'xóa vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:12:32.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (46, N'NV002', N'xóa vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:12:34.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (47, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:13:43.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (48, N'NV002', N'xóa vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:13:45.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (49, N'NV002', N'xóa', N'menu', N'', CAST(N'2021-11-18T16:13:51.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (50, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:18:42.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (51, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:19:49.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (52, N'NV002', N'xóa vùng lưu', N'menu', N'ds', CAST(N'2021-11-18T16:20:03.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (53, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:21:33.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (54, N'NV002', N'thêm', N'menu', N'ds', CAST(N'2021-11-18T16:21:39.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (55, N'NV002', N'xóa', N'menu', N'ds', CAST(N'2021-11-18T16:21:58.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (56, N'NV002', N'xóa', N'menu', N'ds', CAST(N'2021-11-18T16:22:05.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (57, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:23:43.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (58, N'NV002', N'thêm', N'menu', N'asds', CAST(N'2021-11-18T16:23:45.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (59, N'NV002', N'xóa', N'menu', N'asds', CAST(N'2021-11-18T16:24:10.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (60, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:26:02.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (61, N'NV002', N'thêm', N'menu', N'cv', CAST(N'2021-11-18T16:26:05.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (62, N'NV002', N'xóa', N'menu', N'cv', CAST(N'2021-11-18T16:26:12.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (63, N'NV002', N'tạo vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:26:16.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (64, N'NV002', N'xóa vùng lưu', N'menu', N'', CAST(N'2021-11-18T16:26:20.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (65, N'NV002', N'tạo vùng lưu', N'voucher', N'', CAST(N'2021-11-18T16:30:57.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (66, N'NV002', N'thêm', N'voucher', N'DSA', CAST(N'2021-11-18T16:31:02.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (67, N'NV002', N'sửa', N'voucher', N'DSA', CAST(N'2021-11-18T16:31:07.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (68, N'NV002', N'xóa', N'voucher', N'DSA', CAST(N'2021-11-18T16:31:11.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (69, N'NV002', N'tạo vùng lưu', N'voucher', N'', CAST(N'2021-11-18T16:31:14.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (70, N'NV002', N'xóa vùng lưu', N'voucher', N'', CAST(N'2021-11-18T16:31:16.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (71, N'NV002', N'thêm 2', N'món', N'Bàn 37', CAST(N'2021-11-18T16:42:38.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (72, N'NV002', N'thêm 2', N'món', N'Bàn 33', CAST(N'2021-11-18T16:43:38.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (73, N'NV002', N'thêm 0', N'món', N'Bàn 36', CAST(N'2021-11-18T16:48:30.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (74, N'NV002', N'thêm 3', N'món', N'Bàn 34', CAST(N'2021-11-18T16:49:36.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (75, N'NV002', N'sửa', N'menu', N'Espresso', CAST(N'2021-11-18T16:54:51.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (76, N'NV002', N'thanh toán', N'hóa đơn', N'Tên : Bàn 36', CAST(N'2021-11-19T01:11:18.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (77, N'NV002', N'thanh toán', N'hóa đơn', N'', CAST(N'2021-11-19T01:17:07.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (78, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 37', CAST(N'2021-11-19T01:18:47.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (79, N'NV002', N'xóa', N'hóa đơn', N'Bàn 29', CAST(N'2021-11-19T01:20:05.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (80, N'NV002', N'thêm 1', N'món', N'Bàn 26', CAST(N'2021-11-19T01:28:00.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (81, N'NV002', N'thêm 2', N'món', N'Bàn 35', CAST(N'2021-11-19T01:28:08.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (82, N'NV002', N'gộp', N'hóa đơn', N'Bàn 34 và Bàn 26', CAST(N'2021-11-19T01:28:16.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (83, N'NV002', N'gộp', N'hóa đơn', N'Bàn 35 và Bàn 26', CAST(N'2021-11-19T01:30:30.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (84, N'NV002', N'chuyển', N'hóa đơn', N'Bàn 26 sang Bàn 07', CAST(N'2021-11-19T01:31:48.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (85, N'NV002', N'tách0 Cappucino', N'món', N'Bàn 07 sang Bàn 13', CAST(N'2021-11-19T01:35:47.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (86, N'NV002', N'tách 1', N'món', N'Bàn 07 sang Bàn 13', CAST(N'2021-11-19T01:39:00.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (87, N'NV002', N'thêm 3', N'món', N'Bàn 07', CAST(N'2021-11-19T01:39:22.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (88, N'NV002', N'tách 2', N'món', N'Bàn 07 sang Bàn 13', CAST(N'2021-11-19T01:39:41.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (89, N'NV002', N'xóa 1', N'món', N'Bàn 13', CAST(N'2021-11-19T01:41:44.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (90, N'NV002', N'xóa 2', N'món', N'Bàn 13', CAST(N'2021-11-19T01:42:09.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (91, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 07', CAST(N'2021-11-19T15:42:30.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (92, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 13', CAST(N'2021-11-19T15:42:42.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (93, N'NV001', N'thêm 3', N'món', N'Bàn 16', CAST(N'2021-11-19T18:33:55.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (94, N'NV001', N'thêm 5', N'món', N'Bàn 32', CAST(N'2021-11-19T18:33:59.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (95, N'NV001', N'thêm 6', N'món', N'Bàn 04', CAST(N'2021-11-19T18:34:05.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (96, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 04', CAST(N'2021-11-19T18:34:12.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (97, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 32', CAST(N'2021-11-19T18:34:24.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (98, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 16', CAST(N'2021-11-19T18:34:33.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (99, N'NV002', N'thêm 2', N'món', N'Bàn 34', CAST(N'2021-11-19T20:16:11.000' AS DateTime))
GO
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (100, N'NV002', N'sửa', N'menu', N'Phin Đen (Nóng)', CAST(N'2021-11-19T20:16:39.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (101, N'NV002', N'sửa', N'menu', N'Phin Đen (Nóng)', CAST(N'2021-11-19T20:17:24.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (102, N'NV002', N'thêm 2', N'món', N'Bàn 35', CAST(N'2021-11-19T20:26:29.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (103, N'NV002', N'thêm 2', N'món', N'Bàn 13', CAST(N'2021-11-19T20:29:47.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (104, N'NV002', N'thêm 1', N'món', N'Bàn 34', CAST(N'2021-11-19T20:33:39.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (105, N'NV002', N'thêm 2', N'món', N'Bàn 35', CAST(N'2021-11-19T20:33:46.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (106, N'NV002', N'thêm 3', N'món', N'Bàn 35', CAST(N'2021-11-19T20:33:55.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (107, N'NV002', N'thêm 4', N'món', N'Bàn 25', CAST(N'2021-11-19T20:34:05.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (108, N'NV002', N'thêm 5', N'món', N'Bàn 35', CAST(N'2021-11-19T20:34:11.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (109, N'NV002', N'xóa', N'hóa đơn', N'Bàn 35', CAST(N'2021-11-19T20:34:37.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (110, N'NV002', N'thêm 6', N'món', N'Bàn 35', CAST(N'2021-11-19T20:34:43.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (111, N'NV002', N'chuyển', N'hóa đơn', N'Bàn 35 sang Bàn 24', CAST(N'2021-11-19T20:34:57.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (112, N'NV002', N'sửa', N'menu', N'Phindi Choco', CAST(N'2021-11-19T20:35:30.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (113, N'NV002', N'sửa', N'menu', N'Phindi Choco', CAST(N'2021-11-19T20:35:45.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (114, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 25', CAST(N'2021-11-19T20:52:09.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (115, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 34', CAST(N'2021-11-19T20:52:40.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (116, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 24', CAST(N'2021-11-19T20:52:44.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (117, N'NV002', N'thêm 3', N'món', N'Bàn 25', CAST(N'2021-11-19T20:53:00.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (118, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 25', CAST(N'2021-11-19T20:53:07.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (119, N'NV002', N'thêm 6', N'món', N'Bàn 25', CAST(N'2021-11-19T20:53:34.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (120, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 25', CAST(N'2021-11-19T20:53:39.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (121, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 22', CAST(N'2021-11-19T20:54:10.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (122, N'NV002', N'thêm 9', N'món', N'Bàn 13', CAST(N'2021-11-19T20:54:33.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (123, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 13', CAST(N'2021-11-19T20:54:37.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (124, N'NV002', N'thêm 2', N'món', N'Bàn 25', CAST(N'2021-11-19T20:56:33.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (125, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 25', CAST(N'2021-11-19T20:58:36.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (126, N'NV002', N'thêm 4', N'món', N'Bàn 37', CAST(N'2021-11-19T20:59:22.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (127, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 37', CAST(N'2021-11-19T20:59:29.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (128, N'NV002', N'thêm 8', N'món', N'Bàn 38', CAST(N'2021-11-19T20:59:56.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (129, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 38', CAST(N'2021-11-19T21:00:00.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (130, N'NV002', N'thêm 4', N'món', N'Bàn 35', CAST(N'2021-11-19T21:01:01.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (131, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 35', CAST(N'2021-11-19T21:01:07.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (132, N'NV002', N'thêm 13', N'món', N'Bàn 25', CAST(N'2021-11-19T21:01:36.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (133, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 25', CAST(N'2021-11-19T21:01:40.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (134, N'NV002', N'thêm 15', N'món', N'Bàn 17', CAST(N'2021-11-19T21:02:20.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (135, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 17', CAST(N'2021-11-19T21:02:25.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (136, N'NV002', N'thêm 16', N'món', N'Bàn 37', CAST(N'2021-11-19T21:03:19.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (137, N'NV002', N'thêm 21', N'món', N'Bàn 25', CAST(N'2021-11-19T21:03:33.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (138, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 25', CAST(N'2021-11-19T21:03:37.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (139, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 37', CAST(N'2021-11-19T21:04:29.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (140, N'NV002', N'thêm 22', N'món', N'Bàn 25', CAST(N'2021-11-19T21:04:45.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (141, N'NV002', N'thêm 1', N'món', N'Bàn 26', CAST(N'2021-11-19T21:07:07.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (142, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 25', CAST(N'2021-11-19T21:09:23.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (143, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 26', CAST(N'2021-11-19T21:09:27.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (144, N'NV002', N'thêm 2', N'món', N'Bàn 29', CAST(N'2021-11-19T21:20:41.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (145, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 29', CAST(N'2021-11-19T21:22:17.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (146, N'NV002', N'thêm 3', N'món', N'Bàn 35', CAST(N'2021-11-19T21:22:59.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (147, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 35', CAST(N'2021-11-19T21:23:03.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (148, N'NV002', N'thêm 2', N'món', N'Bàn 16', CAST(N'2021-11-19T21:42:19.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (149, N'NV002', N'thêm 5', N'món', N'Bàn 25', CAST(N'2021-11-19T21:42:25.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (150, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 16', CAST(N'2021-11-19T21:42:30.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (151, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 25', CAST(N'2021-11-19T21:42:35.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (152, N'NV002', N'thêm 4', N'món', N'Bàn 25', CAST(N'2021-11-20T17:20:17.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (153, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 25', CAST(N'2021-11-20T17:20:22.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (154, N'NV002', N'thêm 5', N'món', N'Bàn 35', CAST(N'2021-11-20T17:20:28.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (155, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 35', CAST(N'2021-11-20T17:20:36.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (156, N'NV001', N'thêm 1', N'món', N'Bàn 37', CAST(N'2021-11-20T19:13:08.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (157, N'NV001', N'thêm 1', N'món', N'Bàn 37', CAST(N'2021-11-20T19:38:28.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (158, N'NV001', N'thêm 2', N'món', N'Bàn 27', CAST(N'2021-11-20T19:38:55.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (159, N'NV001', N'thêm 3', N'món', N'Bàn 27', CAST(N'2021-11-20T19:39:31.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (160, N'NV002', N'xóa 1', N'món', N'Bàn 37', CAST(N'2021-11-21T00:59:43.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (161, N'NV002', N'thêm 1', N'món', N'Bàn 37', CAST(N'2021-11-21T00:59:55.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (162, N'NV002', N'thêm 2', N'món', N'Bàn 37', CAST(N'2021-11-21T01:00:02.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (163, N'NV002', N'thêm 4', N'món', N'Bàn 28', CAST(N'2021-11-21T01:00:12.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (164, N'NV002', N'thêm 5', N'món', N'Bàn 24', CAST(N'2021-11-21T01:00:17.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (165, N'NV002', N'thêm 6', N'món', N'Bàn 24', CAST(N'2021-11-21T01:00:24.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (166, N'NV002', N'xóa', N'hóa đơn', N'Bàn 37', CAST(N'2021-11-21T01:00:30.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (167, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 27', CAST(N'2021-11-21T01:00:36.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (168, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 28', CAST(N'2021-11-21T01:00:41.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (169, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 24', CAST(N'2021-11-21T01:00:45.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (170, N'NV002', N'thêm 7', N'món', N'Bàn 26', CAST(N'2021-11-21T01:00:55.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (171, N'NV002', N'thêm 8', N'món', N'Bàn 26', CAST(N'2021-11-21T01:01:00.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (172, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 26', CAST(N'2021-11-21T01:01:46.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (173, N'NV002', N'thêm 1', N'món', N'Bàn 14', CAST(N'2021-11-21T23:23:20.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (174, N'NV002', N'thêm 5', N'món', N'Bàn 14', CAST(N'2021-11-21T23:23:57.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (175, N'NV002', N'thêm 1', N'món', N'Bàn 14', CAST(N'2021-11-22T15:52:04.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (176, N'NV002', N'thêm 2', N'món', N'Bàn 14', CAST(N'2021-11-22T15:53:06.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (177, N'NV002', N'thêm 4', N'món', N'Bàn 37', CAST(N'2021-11-22T15:53:14.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (178, N'NV002', N'thêm 1', N'món', N'Bàn 14', CAST(N'2021-11-22T15:56:02.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (179, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 14', CAST(N'2021-11-22T15:56:15.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (180, N'NV002', N'thêm 1', N'món', N'Bàn 26', CAST(N'2021-11-23T16:11:03.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (181, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 26', CAST(N'2021-11-23T16:11:43.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (182, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 37', CAST(N'2021-11-29T02:54:54.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (183, N'NV001', N'thêm 2', N'món', N'Bàn 14', CAST(N'2021-11-29T16:08:25.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (184, N'NV001', N'thêm 4', N'món', N'Bàn 28', CAST(N'2021-11-29T16:08:30.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (185, N'NV001', N'thêm 6', N'món', N'Bàn 23', CAST(N'2021-11-29T16:08:36.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (186, N'NV001', N'thêm 8', N'món', N'Bàn 03', CAST(N'2021-11-29T16:08:42.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (187, N'NV001', N'thêm 10', N'món', N'Bàn 07', CAST(N'2021-11-29T16:08:47.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (188, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 28', CAST(N'2021-11-29T16:08:52.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (189, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 14', CAST(N'2021-11-29T16:08:58.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (190, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 23', CAST(N'2021-11-29T16:09:02.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (191, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 03', CAST(N'2021-11-29T16:09:06.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (192, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 07', CAST(N'2021-11-29T16:09:11.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (193, N'NV001', N'thêm 12', N'món', N'Bàn 23', CAST(N'2021-11-29T16:09:59.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (194, N'NV001', N'thêm 13', N'món', N'Bàn 17', CAST(N'2021-11-29T16:10:03.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (195, N'NV001', N'thêm 17', N'món', N'Bàn 03', CAST(N'2021-11-29T16:10:13.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (196, N'NV001', N'thêm 18', N'món', N'Bàn 15', CAST(N'2021-11-29T16:10:20.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (197, N'NV001', N'thêm 19', N'món', N'Bàn 08', CAST(N'2021-11-29T16:10:26.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (198, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 23', CAST(N'2021-11-29T16:10:31.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (199, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 03', CAST(N'2021-11-29T16:10:36.000' AS DateTime))
GO
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (200, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 15', CAST(N'2021-11-29T16:10:41.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (201, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 17', CAST(N'2021-11-29T16:10:45.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (202, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 08', CAST(N'2021-11-29T16:10:49.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (203, N'NV001', N'thêm 21', N'món', N'Bàn 24', CAST(N'2021-11-29T16:12:15.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (204, N'NV001', N'thêm 23', N'món', N'Bàn 17', CAST(N'2021-11-29T16:12:19.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (205, N'NV001', N'thêm 25', N'món', N'Bàn 15', CAST(N'2021-11-29T16:12:24.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (206, N'NV001', N'thêm 27', N'món', N'Bàn 12', CAST(N'2021-11-29T16:12:29.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (207, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 12', CAST(N'2021-11-29T16:12:37.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (208, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 24', CAST(N'2021-11-29T16:12:43.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (209, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 15', CAST(N'2021-11-29T16:12:47.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (210, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 17', CAST(N'2021-11-29T16:12:51.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (211, N'NV001', N'thêm 30', N'món', N'Bàn 33', CAST(N'2021-11-29T16:13:45.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (212, N'NV001', N'thêm 34', N'món', N'Bàn 05', CAST(N'2021-11-29T16:13:57.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (213, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 05', CAST(N'2021-11-29T16:14:04.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (214, N'NV001', N'thanh toán', N'hóa đơn', N'Bàn 33', CAST(N'2021-11-29T16:14:08.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (215, N'NV002', N'sửa', N'nguyên liệu', N'SR_ORANGE', CAST(N'2021-11-29T17:57:53.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (216, N'NV002', N'sửa', N'nguyên liệu', N'SR_ORANGE', CAST(N'2021-11-29T18:17:18.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (217, N'NV002', N'sửa', N'nguyên liệu', N'SR_ORANGE', CAST(N'2021-11-29T18:18:00.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1212, N'NV002', N'tạo vùng lưu', N'nhân viên', N'NV005', CAST(N'2021-12-01T20:09:08.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1213, N'NV002', N'tạo vùng lưu', N'nhân viên', N'NV006', CAST(N'2021-12-01T20:12:01.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1214, N'NV002', N'thêm', N'nhân viên', N'NV006', CAST(N'2021-12-01T20:12:39.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1215, N'NV002', N'sửa', N'nhân viên', N'NV002', CAST(N'2021-12-01T20:18:27.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1216, N'NV002', N'tạo vùng lưu', N'nhân viên', N'NV005', CAST(N'2021-12-01T20:18:34.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1217, N'NV002', N'tạo vùng lưu', N'nhân viên', N'NV006', CAST(N'2021-12-01T20:19:27.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1218, N'NV002', N'thêm', N'nhân viên', N'NV006', CAST(N'2021-12-01T20:19:57.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1219, N'NV002', N'tạo vùng lưu', N'nhân viên', N'NV007', CAST(N'2021-12-01T20:23:04.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1220, N'NV002', N'thêm', N'nhân viên', N'NV007', CAST(N'2021-12-01T20:23:41.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1221, N'NV002', N'tạo vùng lưu', N'nhân viên', N'NV008', CAST(N'2021-12-01T20:23:54.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1222, N'NV002', N'thêm', N'nhân viên', N'NV008', CAST(N'2021-12-01T20:24:49.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1223, N'NV002', N'sửa', N'nhân viên', N'NV008', CAST(N'2021-12-01T20:25:27.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1224, N'NV001', N'thêm 1', N'món', N'Bàn 38', CAST(N'2021-12-01T20:29:29.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1225, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 38', CAST(N'2021-12-01T20:30:56.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1226, N'NV002', N'tạo vùng lưu', N'nhân viên', N'NV009', CAST(N'2021-12-02T17:23:07.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1227, N'NV002', N'thêm', N'nhân viên', N'NV009', CAST(N'2021-12-02T17:24:00.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1228, N'NV002', N'sửa', N'nhân viên', N'NV009', CAST(N'2021-12-02T17:24:13.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1229, N'NV002', N'xóa', N'nhân viên', N'NV009', CAST(N'2021-12-02T17:25:38.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1230, N'NV002', N'tạo vùng lưu', N'nhân viên', N'NV010', CAST(N'2021-12-02T17:25:42.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1231, N'NV002', N'thêm', N'nhân viên', N'NV010', CAST(N'2021-12-02T17:26:31.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1232, N'NV002', N'thêm 4', N'món', N'Bàn 26', CAST(N'2021-12-10T17:43:57.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1233, N'NV002', N'tách 1', N'món', N'Bàn 26 sang Bàn 23', CAST(N'2021-12-10T17:45:15.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1234, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 26', CAST(N'2021-12-10T17:45:58.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1235, N'NV002', N'thêm 3', N'món', N'Bàn 37', CAST(N'2021-12-10T18:03:43.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1236, N'NV002', N'tách 1', N'món', N'Bàn 37 sang Bàn 23', CAST(N'2021-12-10T18:03:53.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1237, N'NV002', N'thêm 8', N'món', N'Bàn 35', CAST(N'2021-12-10T18:11:28.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1238, N'NV002', N'tách 2', N'món', N'Bàn 35 sang Bàn 24', CAST(N'2021-12-10T18:16:42.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1239, N'NV002', N'tách 1', N'món', N'Bàn 35 sang Bàn 15', CAST(N'2021-12-10T18:34:07.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1240, N'NV002', N'thêm 6', N'món', N'Bàn 32', CAST(N'2021-12-10T18:34:27.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1241, N'NV002', N'tách 3', N'món', N'Bàn 32 sang Bàn 01', CAST(N'2021-12-10T18:34:40.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1242, N'NV002', N'tách 2', N'món', N'Bàn 32 sang Bàn 01', CAST(N'2021-12-10T18:35:19.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1243, N'NV002', N'thêm 8', N'món', N'Bàn 50', CAST(N'2021-12-10T18:42:26.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1244, N'NV002', N'thêm 9', N'món', N'Bàn 50', CAST(N'2021-12-10T18:42:35.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1245, N'NV002', N'thêm 2', N'món', N'Bàn 41', CAST(N'2021-12-10T18:43:44.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1246, N'NV002', N'thêm 4', N'món', N'Bàn 43', CAST(N'2021-12-10T18:43:50.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1247, N'NV002', N'tách 1', N'món', N'Bàn 43 sang Bàn 41', CAST(N'2021-12-10T18:44:09.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1248, N'NV002', N'xóa', N'hóa đơn', N'Bàn 01', CAST(N'2021-12-10T18:45:20.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1249, N'NV002', N'xóa', N'hóa đơn', N'Bàn 41', CAST(N'2021-12-10T18:45:24.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1250, N'NV002', N'xóa', N'hóa đơn', N'Bàn 43', CAST(N'2021-12-10T18:45:28.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1251, N'NV002', N'xóa', N'hóa đơn', N'Bàn 32', CAST(N'2021-12-10T18:45:32.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1252, N'NV002', N'xóa', N'hóa đơn', N'Bàn 50', CAST(N'2021-12-10T18:45:37.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1253, N'NV002', N'xóa', N'hóa đơn', N'Bàn 37', CAST(N'2021-12-10T18:45:40.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1254, N'NV002', N'xóa', N'hóa đơn', N'Bàn 35', CAST(N'2021-12-10T18:45:44.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1255, N'NV002', N'xóa', N'hóa đơn', N'Bàn 24', CAST(N'2021-12-10T18:45:48.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1256, N'NV002', N'xóa', N'hóa đơn', N'Bàn 23', CAST(N'2021-12-10T18:45:51.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1257, N'NV002', N'thêm 5', N'món', N'Bàn 14', CAST(N'2021-12-10T18:46:02.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1258, N'NV002', N'thêm 6', N'món', N'Bàn 19', CAST(N'2021-12-10T18:46:08.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1259, N'NV002', N'xóa', N'hóa đơn', N'Bàn 14', CAST(N'2021-12-10T18:46:12.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1260, N'NV002', N'xóa', N'hóa đơn', N'Bàn 15', CAST(N'2021-12-10T18:46:16.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1261, N'NV002', N'xóa', N'hóa đơn', N'Bàn 19', CAST(N'2021-12-10T18:46:24.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1262, N'NV002', N'thêm 2', N'món', N'Bàn 16', CAST(N'2021-12-10T18:47:47.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1263, N'NV002', N'thêm 2', N'món', N'Bàn 13', CAST(N'2021-12-10T18:50:24.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1264, N'NV002', N'thêm 7', N'món', N'Bàn 33', CAST(N'2021-12-10T18:50:43.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1265, N'NV002', N'tách 1', N'món', N'Bàn 33 sang Bàn 16', CAST(N'2021-12-10T18:51:11.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1266, N'NV002', N'thêm 12', N'món', N'Bàn 01', CAST(N'2021-12-10T18:52:21.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1267, N'NV002', N'thêm 13', N'món', N'Bàn 02', CAST(N'2021-12-10T18:52:31.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1268, N'NV002', N'tách 1', N'món', N'Bàn 01 sang Bàn 02', CAST(N'2021-12-10T18:52:43.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1269, N'NV002', N'tách 2', N'món', N'Bàn 01 sang Bàn 02', CAST(N'2021-12-10T18:53:08.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1270, N'NV002', N'thêm 4', N'món', N'Bàn 31', CAST(N'2021-12-10T18:56:14.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1271, N'NV002', N'tách 2', N'món', N'Bàn 31 sang Bàn 02', CAST(N'2021-12-10T18:56:28.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1272, N'NV002', N'xóa', N'hóa đơn', N'Bàn 31', CAST(N'2021-12-10T18:57:16.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1273, N'NV002', N'xóa', N'hóa đơn', N'Bàn 33', CAST(N'2021-12-10T18:57:19.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1274, N'NV002', N'xóa', N'hóa đơn', N'Bàn 13', CAST(N'2021-12-10T18:57:26.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1275, N'NV002', N'thêm 5', N'món', N'Bàn 25', CAST(N'2021-12-10T18:57:35.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1276, N'NV002', N'xóa', N'hóa đơn', N'Bàn 25', CAST(N'2021-12-10T18:57:38.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1277, N'NV002', N'xóa', N'hóa đơn', N'Bàn 16', CAST(N'2021-12-10T18:57:42.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1278, N'NV002', N'thêm 10', N'món', N'Bàn 22', CAST(N'2021-12-10T18:57:53.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1279, N'NV002', N'tách 3', N'món', N'Bàn 22 sang Bàn 02', CAST(N'2021-12-10T18:58:10.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1280, N'NV002', N'xóa', N'hóa đơn', N'Bàn 01', CAST(N'2021-12-10T18:58:53.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1281, N'NV002', N'tách 1', N'món', N'Bàn 22 sang Bàn 23', CAST(N'2021-12-10T18:59:08.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1282, N'NV002', N'gộp', N'hóa đơn', N'Bàn 22 và Bàn 23', CAST(N'2021-12-10T18:59:22.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1283, N'NV002', N'xóa', N'hóa đơn', N'Bàn 23', CAST(N'2021-12-10T19:05:46.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1284, N'NV002', N'thêm 1', N'món', N'Bàn 22', CAST(N'2021-12-10T19:05:55.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1285, N'NV002', N'thêm 2', N'món', N'Bàn 23', CAST(N'2021-12-10T19:05:58.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1286, N'NV002', N'xóa', N'hóa đơn', N'Bàn 23', CAST(N'2021-12-10T19:06:19.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1287, N'NV002', N'thêm 3', N'món', N'Bàn 23', CAST(N'2021-12-10T19:06:31.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1288, N'NV002', N'thêm 4', N'món', N'Bàn 24', CAST(N'2021-12-10T19:06:35.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1289, N'NV002', N'thêm 1', N'món', N'Bàn 23', CAST(N'2021-12-10T19:08:03.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1290, N'NV002', N'thêm 2', N'món', N'Bàn 24', CAST(N'2021-12-10T19:08:07.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1291, N'NV002', N'gộp', N'hóa đơn', N'Bàn 23 và Bàn 24', CAST(N'2021-12-10T19:09:22.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1292, N'NV002', N'gộp', N'hóa đơn', N'Bàn 02 và Bàn 24', CAST(N'2021-12-10T19:10:24.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1293, N'NV002', N'thêm 3', N'món', N'Bàn 25', CAST(N'2021-12-10T19:10:50.000' AS DateTime))
GO
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1294, N'NV002', N'thêm 4', N'món', N'Bàn 26', CAST(N'2021-12-10T19:11:00.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1295, N'NV002', N'gộp', N'hóa đơn', N'Bàn 25 và Bàn 26', CAST(N'2021-12-10T19:11:11.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1296, N'NV002', N'thêm 5', N'món', N'Bàn 35', CAST(N'2021-12-10T19:11:31.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1297, N'NV002', N'gộp', N'hóa đơn', N'Bàn 35 và Bàn 26', CAST(N'2021-12-10T19:11:43.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1298, N'NV002', N'tách 2', N'món', N'Bàn 24 sang Bàn 12', CAST(N'2021-12-10T19:11:58.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1299, N'NV002', N'thêm 6', N'món', N'Bàn 14', CAST(N'2021-12-10T19:12:16.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1300, N'NV002', N'tách 2', N'món', N'Bàn 24 sang Bàn 14', CAST(N'2021-12-10T19:12:31.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1301, N'NV002', N'chuyển', N'hóa đơn', N'Bàn 24 sang Bàn 01', CAST(N'2021-12-10T19:12:46.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1302, N'NV002', N'xóa', N'hóa đơn', N'Bàn 01', CAST(N'2021-12-10T19:43:22.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1303, N'NV002', N'xóa', N'hóa đơn', N'Bàn 12', CAST(N'2021-12-10T19:43:25.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1304, N'NV002', N'xóa', N'hóa đơn', N'Bàn 14', CAST(N'2021-12-10T19:43:28.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1305, N'NV002', N'xóa', N'hóa đơn', N'Bàn 26', CAST(N'2021-12-10T19:43:31.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1306, N'NV002', N'tạo vùng lưu', N'nguyên liệu', N'', CAST(N'2021-12-10T19:43:44.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1307, N'NV002', N'xóa vùng lưu', N'nguyên liệu', N'', CAST(N'2021-12-10T19:43:52.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1308, N'NV002', N'tạo vùng lưu', N'nguyên liệu', N'', CAST(N'2021-12-10T19:44:03.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1309, N'NV002', N'thêm', N'nguyên liệu', N'RD_PEACH', CAST(N'2021-12-10T19:45:35.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1310, N'NV002', N'tạo vùng lưu', N'nguyên liệu', N'', CAST(N'2021-12-10T19:45:41.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1311, N'NV002', N'thêm', N'nguyên liệu', N'NF_LYCHEE', CAST(N'2021-12-10T19:46:42.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1312, N'NV002', N'tạo vùng lưu', N'nguyên liệu', N'', CAST(N'2021-12-14T18:06:24.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1313, N'NV002', N'xóa vùng lưu', N'nguyên liệu', N'DSD', CAST(N'2021-12-14T18:06:39.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1314, N'NV002', N'thêm 1', N'món', N'Bàn 09', CAST(N'2021-12-14T18:12:56.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1315, N'NV002', N'chuyển', N'hóa đơn', N'Bàn 09 sang Bàn 08', CAST(N'2021-12-14T18:31:08.000' AS DateTime))
INSERT [dbo].[Log] ([ID], [IdStaff], [Action], [Object], [IdObject], [DateStart]) VALUES (1316, N'NV002', N'thanh toán', N'hóa đơn', N'Bàn 08', CAST(N'2021-12-14T21:27:59.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Log] OFF
GO
INSERT [dbo].[Material] ([IdMaterial], [NameMaterial], [Amount], [Type], [Status], [Producer], [ImportPrice], [ImportDate], [Picture]) VALUES (N'NF_LYCHEE', N'Vải Ngâm', 6, N'Hộp', N'Còn hàng', N'Nif', 55000, CAST(N'2021-12-10' AS Date), N'\Image\Material\Khac\VaiNgam.jpg')
INSERT [dbo].[Material] ([IdMaterial], [NameMaterial], [Amount], [Type], [Status], [Producer], [ImportPrice], [ImportDate], [Picture]) VALUES (N'RD_PEACH', N'Đào Ngâm', 8, N'Hộp', N'Còn hàng', N'Rhodes', 55000, CAST(N'2021-12-10' AS Date), N'\Image\Material\Khac\DaoNgam.jpg')
INSERT [dbo].[Material] ([IdMaterial], [NameMaterial], [Amount], [Type], [Status], [Producer], [ImportPrice], [ImportDate], [Picture]) VALUES (N'SR_ORANGE', N'Syrup Cam', 7, N'Chai/Lon', N'Còn hàng', N'Torani', 45000, CAST(N'2021-11-15' AS Date), N'\Image\Material\Syrup\siro-torani-cam-torani-orange-syrup-750ml.png')
GO
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (1, N'Coca', 15000, N'SD', N'\Image\SoftDrink\Coca.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (2, N'7Up', 15000, N'SD', N'\Image\SoftDrink\7up.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (3, N'Espresso', 44000, N'CF', N'\Image\Cafe\Espresso.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (4, N'Cappucino', 54000, N'CF', N'\Image\Cafe\Cappucino.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (6, N'Nước Suối', 13000, N'SD', N'\Image\SoftDrink\Aquafina.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (7, N'Americano', 44000, N'CF', N'\Image\Cafe\Americano.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (8, N'Bạc Xỉu Đá', 29000, N'CF', N'\Image\Cafe\BacXiuDa.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (9, N'Phin Sữa (Đá)', 29000, N'CF', N'\Image\Cafe\PhinSuaDa.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (10, N'Phin Sữa (Nóng)', 29000, N'CF', N'\Image\Cafe\PhinSuaNong.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (11, N'Phin Đen (Đá)', 29000, N'CF', N'\Image\Cafe\PhinDenDa.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (12, N'Phin Đen (Nóng)', 29000, N'CF', N'\Image\Cafe\PhinDenNong.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (13, N'Phindi Kem Sữa', 39000, N'CF', N'\Image\Cafe\PhinDiKemSua.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (14, N'Phindi Hồng Trà', 45000, N'CF', N'\Image\Cafe\PhinDiHongTra.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (15, N'Phindi Choco', 39000, N'CF', N'\Image\Cafe\PhinDiChoco.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (16, N'Phindi Hạnh Nhân', 39000, N'CF', N'\Image\Cafe\PhinDiHanhNhan.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (17, N'Caramel Machiato', 59000, N'CF', N'\Image\Cafe\CaramelMacchiato.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (18, N'Mocha Macchiato', 59000, N'CF', N'\Image\Cafe\MochaMacchiato.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (20, N'Freeze Trà Xanh', 49000, N'FZ', N'\Image\Freeze\FreezeTraXanh.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (21, N'Cookies & Cream', 49000, N'FZ', N'\Image\Freeze\CookiesAndCream.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (22, N'Freeze Socola', 49000, N'FZ', N'\Image\Freeze\FreezeSocola.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (23, N'Caramel Phin Freeze', 49000, N'FZ', N'\Image\Freeze\CaramelPhinFreeze.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (24, N'Classic Phin Freeze', 49000, N'FZ', N'\Image\Freeze\ClassicPhinFreeze.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (26, N'Trà Thạch Đào', 39000, N'TE', N'\Image\Tea\TraThachDao.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (27, N'Thịt Nướng', 19000, N'FD', N'\Image\Food\BMTHITNUONG.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (28, N'Chả Lụa Xá Xíu', 19000, N'FD', N'\Image\Food\BMCHALUAXAXIU.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (29, N'Xíu Mại', 19000, N'FD', N'\Image\Food\BMXIUMAI.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (30, N'Gà Xé', 19000, N'FD', N'\Image\Food\BMGAXE.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (31, N'Phin Inox', 79000, N'OR', N'\Image\Other\PhinInox.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (32, N'Ly Sứ Mosaic', 149000, N'OR', N'\Image\Other\LySuMosaic.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (33, N'3In1 (40 Gói)', 95000, N'OR', N'\Image\Other\3IN1-40.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (34, N'3In1 (20 Gói)', 50000, N'OR', N'\Image\Other\IN1-20.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (35, N'Truyền Thống 1Kg', 235000, N'OR', N'\Image\Other\TRUYEN-THONG-1KG.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (36, N'Truyền Thống 200Gr', 47000, N'OR', N'\Image\Other\RG-TRUYEN-THONG.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (37, N'Sành Điệu 200Gr', 55000, N'OR', N'\Image\Other\RG-SANH-DIEU.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (38, N'Moka 200Gr', 75000, N'OR', N'\Image\Other\RG-MOKA.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (39, N'Di sản 200Gr', 42000, N'OR', N'\Image\Other\RG-DI-SAN.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (40, N'Culi 200Gr', 64000, N'OR', N'\Image\Other\RG-CULI.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (41, N'Cafe Sữa (Lon)', 69000, N'SD', N'\Image\SoftDrink\CPS-185.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (42, N'Cafe Đen (Lon)', 60000, N'SD', N'\Image\SoftDrink\CPD-185.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (43, N'Phomai Cafe', 29000, N'CK', N'\Image\Cake\PHOMAICAPHE.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (44, N'Phomai Chanh Dây', 29000, N'CK', N'\Image\Cake\PHOMAICHANHDAY.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (45, N'Phomai Trà Xanhh', 29000, N'CK', N'\Image\Cake\PHOMAITRAXANH.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (46, N'Caramel Phomai', 29000, N'CK', N'\Image\Cake\CARAMELPHOMAI.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (47, N'Tiramisu', 19000, N'CK', N'\Image\Cake\TIRAMISU.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (48, N'Bánh Chuối', 19000, N'CK', N'\Image\Cake\BANHCHUOI.PNG')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (49, N'Mousse Cacao', 29000, N'CK', N'\Image\Cake\MOUSSECACAO.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (50, N'Mousse Đào', 29000, N'CK', N'\Image\Cake\MOUSSEDAO.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (51, N'Socola HighLands', 29000, N'CK', N'\Image\Cake\SOCOLAHL.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (52, N'Trà Thạch Vải', 39000, N'TE', N'\Image\Tea\TraThachVai.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (53, N'Trà Thanh Đào', 39000, N'TE', N'\Image\Tea\TraThanhDao.png')
INSERT [dbo].[Menu] ([IdMenu], [Name], [Price], [CategoryID], [Picture]) VALUES (54, N'Trà Sen Vàng', 39000, N'TE', N'\Image\Tea\TraSenVang.png')
GO
INSERT [dbo].[Payment] ([IdPayment], [Method]) VALUES (N'#NULL', N'Tiền mặt')
GO
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [IsDelete]) VALUES (N'NV001', N'Trác Phương Kiệt', N'da', N'0769499550', N'phuongkiet850@gmail.com', N'Nam', CAST(N'2001-01-29' AS Date), N'Thu ngân', N'33354741122871651676713774147412831195', N'\Image\NhanVien\241982101_564828874726069_2353499063666868269_n.jpg', 0)
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [IsDelete]) VALUES (N'NV002', N'Nguyễn Tăng Thanh Phương', N'Q12', N'0123456789', N'chinhchu@gmail.com', N'Nam', CAST(N'2001-01-09' AS Date), N'Quản lý', N'1962026656160185351301320480154111117132155', N'\Image\NhanVien\Nam_3.jpg', 0)
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [IsDelete]) VALUES (N'NV003', N'dasd', N'asdasd', N'0124587555', N'phuongkiet850d@gmail.com', N'Nam', CAST(N'2021-11-15' AS Date), N'Phục vụ', N'', N'\Image\NhanVien\241745361_564829181392705_7659333528664838532_n.jpg', 1)
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [IsDelete]) VALUES (N'NV004', N'asd', N'asdasd', N'0125555555', N'dsa@gmail.com', N'Nam', CAST(N'2021-11-16' AS Date), N'Phục vụ', N'', N'\Image\Icon\unknown1.PNG', 1)
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [IsDelete]) VALUES (N'NV006', N'Nguyễn Thị Thảo', N'Quận 11', N'0932088173', N'thithao@gmail.com', N'Nữ', CAST(N'2021-12-01' AS Date), N'Phục vụ', N'', N'\Image\NhanVien\Nu_4.jpg', 0)
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [IsDelete]) VALUES (N'NV007', N'Lê Thị Minh Thư', N'Bình Tân', N'0789786646', N'minhthu@gmail.com', N'Nữ', CAST(N'2021-12-01' AS Date), N'Thu ngân', N'1368441624624948159657435218173154232163', N'\Image\NhanVien\Nu_2.jpg', 0)
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [IsDelete]) VALUES (N'NV008', N'Lê Vũ Nhật Quang', N'Gò Vấp', N'0932932881', N'nhatquang@gmail.com', N'Nam', CAST(N'2021-12-01' AS Date), N'Phục vụ', N'', N'\Image\NhanVien\Nam_2.jpg', 0)
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [IsDelete]) VALUES (N'NV010', N'Trần Gia Kiệt', N'Bình Thạnh', N'0128754958', N'kiettpps12245@fpt.edu.vn', N'Nam', CAST(N'2021-12-02' AS Date), N'Thu ngân', N'24211213517553229253631752015215121224108158', N'\Image\NhanVien\Nam_4.jpg', 0)
GO
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (1, 1, 0, 10, 80300, N'Ca tối', N'admin', CAST(N'2021-11-19T21:42:18.000' AS DateTime), CAST(N'2021-11-19T21:42:30.000' AS DateTime), N'Tiền mặt', N'Bàn 16')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (2, 2, 0, 10, 117700, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-19T21:42:25.000' AS DateTime), CAST(N'2021-11-19T21:42:35.000' AS DateTime), N'Tiền mặt', N'Bàn 25')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (3, 1, 0, 10, 177100, N'Ca tối', N'admin', CAST(N'2021-11-20T17:20:16.000' AS DateTime), CAST(N'2021-11-20T17:20:22.000' AS DateTime), N'Tiền mặt', N'Bàn 25')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (4, 1, 10, 10, 43560, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-20T17:20:27.000' AS DateTime), CAST(N'2021-11-20T17:20:36.000' AS DateTime), N'Tiền mặt', N'Bàn 35')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (5, 2, 0, 10, 63800, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-20T19:38:54.000' AS DateTime), CAST(N'2021-12-21T01:00:36.000' AS DateTime), N'Tiền mặt', N'Bàn 27')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (6, 3, 0, 10, 74800, N'Ca tối', N'admin', CAST(N'2021-12-21T01:00:11.000' AS DateTime), CAST(N'2019-11-21T01:00:41.000' AS DateTime), N'Tiền mặt', N'Bàn 28')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (7, 4, 0, 10, 129800, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-21T01:00:16.000' AS DateTime), CAST(N'2021-12-21T01:00:45.000' AS DateTime), N'Tiền mặt', N'Bàn 24')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (8, 1, 0, 10, 63800, N'Ca tối', N'admin', CAST(N'2021-11-21T01:00:54.000' AS DateTime), CAST(N'2021-11-21T01:01:46.000' AS DateTime), N'Tiền mặt', N'Bàn 26')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (9, 1, 0, 10, 128700, N'Ca tối', N'admin', CAST(N'2021-11-21T23:23:18.000' AS DateTime), CAST(N'2021-11-22T15:56:15.000' AS DateTime), N'Tiền mặt', N'Bàn 14')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (10, 3, 10, 10, 48510, N'Ca tối', N'admin', CAST(N'2021-11-23T16:11:01.000' AS DateTime), CAST(N'2021-11-23T16:11:43.000' AS DateTime), N'Tiền mặt', N'Bàn 26')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (11, 2, 0, 10, 91300, N'Ca tối', N'admin', CAST(N'2021-11-22T15:53:14.000' AS DateTime), CAST(N'2021-11-29T02:54:54.000' AS DateTime), N'Tiền mặt', N'Bàn 37')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (12, 2, 0, 10, 63800, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:08:29.000' AS DateTime), CAST(N'2021-11-29T16:08:52.000' AS DateTime), N'Tiền mặt', N'Bàn 28')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (13, 1, 0, 10, 74800, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:08:25.000' AS DateTime), CAST(N'2021-01-29T16:08:58.000' AS DateTime), N'Tiền mặt', N'Bàn 14')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (14, 3, 0, 10, 74800, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:08:35.000' AS DateTime), CAST(N'2021-01-29T16:09:02.000' AS DateTime), N'Tiền mặt', N'Bàn 23')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (15, 4, 0, 10, 92400, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:08:40.000' AS DateTime), CAST(N'2021-02-02T16:09:06.000' AS DateTime), N'Tiền mặt', N'Bàn 03')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (16, 5, 0, 10, 74800, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:08:46.000' AS DateTime), CAST(N'2021-03-29T16:09:11.000' AS DateTime), N'Tiền mặt', N'Bàn 07')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (17, 1, 0, 10, 80300, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:09:58.000' AS DateTime), CAST(N'2021-03-29T16:10:31.000' AS DateTime), N'Tiền mặt', N'Bàn 23')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (18, 3, 0, 10, 127600, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:10:12.000' AS DateTime), CAST(N'2021-04-29T16:10:36.000' AS DateTime), N'Tiền mặt', N'Bàn 03')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (19, 4, 0, 10, 53900, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:10:19.000' AS DateTime), CAST(N'2021-05-29T16:10:40.000' AS DateTime), N'Tiền mặt', N'Bàn 15')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (20, 2, 0, 10, 14300, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:10:02.000' AS DateTime), CAST(N'2021-06-29T16:10:45.000' AS DateTime), N'Tiền mặt', N'Bàn 17')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (21, 5, 0, 10, 60500, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:10:25.000' AS DateTime), CAST(N'2021-06-29T16:10:49.000' AS DateTime), N'Tiền mặt', N'Bàn 08')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (22, 4, 0, 10, 92400, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:12:28.000' AS DateTime), CAST(N'2021-07-29T16:12:37.000' AS DateTime), N'Tiền mặt', N'Bàn 12')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (23, 1, 0, 10, 91300, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:12:14.000' AS DateTime), CAST(N'2021-07-29T16:12:43.000' AS DateTime), N'Tiền mặt', N'Bàn 24')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (24, 3, 0, 10, 91300, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:12:23.000' AS DateTime), CAST(N'2021-08-29T16:12:47.000' AS DateTime), N'Tiền mặt', N'Bàn 15')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (25, 2, 0, 10, 74800, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:12:18.000' AS DateTime), CAST(N'2021-09-29T16:12:51.000' AS DateTime), N'Tiền mặt', N'Bàn 17')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (26, 2, 0, 10, 150700, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:13:55.000' AS DateTime), CAST(N'2021-12-29T16:14:04.000' AS DateTime), N'Tiền mặt', N'Bàn 05')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (27, 1, 0, 10, 139700, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-29T16:13:44.000' AS DateTime), CAST(N'2021-10-29T16:14:08.000' AS DateTime), N'Tiền mặt', N'Bàn 33')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (28, 1, 0, 10, 31900, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-12-01T20:29:28.000' AS DateTime), CAST(N'2021-12-01T20:30:56.000' AS DateTime), N'Tiền mặt', N'Bàn 38')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (29, 1, 0, 10, 323400, N'Ca tối', N'Nguyễn Tăng Thanh Phương', CAST(N'2021-12-10T17:43:54.000' AS DateTime), CAST(N'2021-12-10T17:45:57.000' AS DateTime), N'Tiền mặt', N'Bàn 26')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [PercentVoucher], [PercentVAT], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [Method], [NameTable]) VALUES (30, 1, 0, 10, 48400, N'Ca tối', N'Nguyễn Tăng Thanh Phương', CAST(N'2021-12-14T18:12:54.000' AS DateTime), CAST(N'2021-12-14T21:27:59.000' AS DateTime), N'Tiền mặt', N'Bàn 08')
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
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (22, N'Bàn 22', N'Trống')
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
INSERT [dbo].[Voucher] ([IdVoucher], [NameVoucher], [PercentVoucher]) VALUES (N'SALE10%', N'Giảm 10%', 10)
INSERT [dbo].[Voucher] ([IdVoucher], [NameVoucher], [PercentVoucher]) VALUES (N'SALE7.5%', N'Giảm 7.5%', 7.5)
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ([DBO].[AUTO_IDBill]()) FOR [IdBill]
GO
ALTER TABLE [dbo].[DetailBill] ADD  DEFAULT ([DBO].[AUTO_IDDetailBill]()) FOR [IdDetailBill]
GO
ALTER TABLE [dbo].[DetailStatistic] ADD  DEFAULT ([DBO].[AUTO_IDDetailStatistic]()) FOR [IdDetailStatistic]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT ([DBO].[AUTO_IDMenu]()) FOR [IdMenu]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ([DBO].[AUTO_IDStaff]()) FOR [IdStaff]
GO
ALTER TABLE [dbo].[Statistic] ADD  DEFAULT ([DBO].[AUTO_IDStatistic]()) FOR [IdStatistic]
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
ALTER TABLE [dbo].[DetailStatistic]  WITH CHECK ADD FOREIGN KEY([IdStatistic])
REFERENCES [dbo].[Statistic] ([IdStatistic])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([IDCategory])
GO
/****** Object:  StoredProcedure [dbo].[sp_AcceptLogin]    Script Date: 12/14/2021 9:29:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddBill]    Script Date: 12/14/2021 9:29:10 PM ******/
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
GO
/****** Object:  StoredProcedure [dbo].[sp_AddDesertToBill]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_AddDesertToBill]
			@IdTable int,
			@IdMenu int,
			@Amount int,
			@Price float,
			@TotalPrice float,
			@Note nvarchar(100)
	as
	begin try
		begin tran

			DECLARE @ID int
			set @ID = (select IdBill from Bill where IdTable = @IdTable)

			insert into DetailBill(IdBill, IdMenu, Amount, Price, TotalPrice, Note) values
			(@ID, @IdMenu, @Amount, @Price, @TotalPrice, @Note)
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_AddDetailStatistic]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_AddDetailStatistic]
		@IdBill int,
		@NameMenu nvarchar(100),
		@Amount int,
		@Price float,
		@TotalPrice float,
		@Note nvarchar(100)
	as
	begin try
		begin tran
			
			DECLARE @ID int
			set @ID = (select Top(1) IdStatistic from Statistic where IdBill = @IdBill order by IdStatistic desc)

			insert into DetailStatistic(IdStatistic, NameMenu, Amount, Price, TotalPrice, Note) values
			(@ID, @NameMenu, @Amount, @Price, @TotalPrice, @Note)
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_AddMenu]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create proc [dbo].[sp_AddMenu]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_AddStatistic]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_AddStatistic]
		@IdBill int,
		@PercentVoucher float,
		@PercentVAT float,
		@Total float,
		@Shift nvarchar(10),
		@NameStaff nvarchar(50),
		@CheckIn datetime,
		@CheckOut datetime,
		@Method nvarchar(50),
		@NameTable nvarchar(10)
	as
	begin try
		begin tran
			
			insert into Statistic(IdBill, PercentVoucher, PercentVAT, Total, Shift, NameStaff, CheckIn, CheckOut, Method, NameTable) values
			(@IdBill, @PercentVoucher, @PercentVAT, @Total, @Shift, @NameStaff, @CheckIn, @CheckOut, @Method, @NameTable)
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_BillTable_DGV]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_BillTable_DGV]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Delete]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBill]    Script Date: 12/14/2021 9:29:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteMaterial]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteMaterial]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteMenu]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteMenu]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteProfileStaff]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteProfileStaff]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteVoucher]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteVoucher]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_Detach]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Detach]
				@IdTable int,
				@IdDetailBill int,
				@Amount int,
				@AmountNew int,
				@Note nvarchar(100),
				@Price float,
				@TotalPrice float
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
					set IdBill = @IdBill, Amount = @AmountNew, Note = @Note, Price = @Price, TotalPrice = @TotalPrice
					where IdDetailBill = @IdDetailBillNew

					Update DetailBill
					set Amount = @Amount - @AmountNew
					where IdDetailBill = @IdDetailBill

					Update DetailBill
					set TotalPrice = Amount * Price
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DetailBill]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DetailBill]
		@IdTable int
	as
	begin try
		begin tran
			
			select Name, DetailBill.Amount, DetailBill.Price, TotalPrice as Total, CheckIn, PercentVoucher, Note, NameStaff, DetailBill.IdBill, Bill.IdBill, IdDetailBill from DetailBill
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
/****** Object:  StoredProcedure [dbo].[sp_DetailStatistic]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DetailStatistic]
				@IdStatistic int

	as
	begin try
		begin tran
			
			select * from DetailStatistic
			where IdStatistic = @IdStatistic

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_FindMaterial]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FindMaterial]
				@Find nvarchar(255)
	as
	begin try
		begin tran
			
			select IdMaterial as 'Mã số', NameMaterial as 'Tên', Amount as 'Số lượng', Type as 'Đơn vị tính', Producer as 'Nhà sản xuất' from Material
			where IdMaterial like '%' + @Find + '%' or NameMaterial like '%' + @Find + '%' or Producer like '%' + @Find + '%' 

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_FindMenu_All]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FindMenu_All]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_FindMenu_Category]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FindMenu_Category]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_FindProfileStaff_All]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FindProfileStaff_All]
				@Find nvarchar(255)
	as
	begin try
		begin tran
			
			select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Email, Role as 'Vai trò' from Staff
             where  IsDelete = 0 and (NameStaff like N'%' + @Find + '%' or IdStaff like '%' + @Find + '%'or Email like '%' + @Find + '%' or Gender like N'%' + @Find + '%' or 
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
GO
/****** Object:  StoredProcedure [dbo].[sp_FindProfileStaff_FindBy]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FindProfileStaff_FindBy]
				@FindBy nvarchar(255),
				@Find nvarchar(255)
	as
	begin try
		begin tran
			if @FindBy = 'IdStaff'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Email, Role as 'Vai trò' from Staff
				 where IsDelete = 0 and IdStaff like '%' + @Find + '%'
			else if @FindBy = 'NameStaff'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Email, Role as 'Vai trò' from Staff
				 where IsDelete = 0 and NameStaff like '%' + @Find + '%'
			else if @FindBy = 'Address'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Email, Role as 'Vai trò' from Staff
				 where IsDelete = 0 and Address like '%' + @Find + '%'
			else if @FindBy = 'PhoneNumber'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Email, Role as 'Vai trò' from Staff
				 where IsDelete = 0 and PhoneNumber like '%' + @Find + '%'
			else if  @FindBy = 'BirthDay'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Email, Role as 'Vai trò' from Staff
				 where	IsDelete = 0 and (	CONVERT(nvarchar, BirthDay, 101)  like '%' + CONVERT(nvarchar, @Find, 101) + '%' or 
											CONVERT(nvarchar, BirthDay, 103)  like '%' + CONVERT(nvarchar, @Find, 103) + '%' or 
											CONVERT(nvarchar, BirthDay, 111)  like '%' + CONVERT(nvarchar, @Find, 111) + '%')
			else if @FindBy = 'Email'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Email, Role as 'Vai trò' from Staff
				 where IsDelete = 0 and Email like '%' + @Find + '%'
			else if @FindBy = 'Role'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Email, Role as 'Vai trò' from Staff
				 where IsDelete = 0 and Role like '%' + @Find + '%'
			else if @FindBy = 'Gender'
				 select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Email, Role as 'Vai trò' from Staff
				 where IsDelete = 0 and Gender like '%' + @Find + '%'
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_FindVoucher]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FindVoucher]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ForgotPassword]    Script Date: 12/14/2021 9:29:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsertLog]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertLog]
			@IdStaff nvarchar(5),
			@Action nvarchar(30),
			@Object nvarchar(20),
			@IdObject nvarchar(20),
			@DateStart DateTime
	as
	begin try
		begin tran
			
			insert into Log values
			(@IdStaff, @Action, @Object, @IdObject, @DateStart)

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertMaterial]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertMaterial]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertProfileStaff]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertProfileStaff]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertVoucher]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertVoucher]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListCategory]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListCategory]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListMaterial]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListMaterial]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListMaterial_DGV]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListMaterial_DGV]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListMaterial_Id]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListMaterial_Id]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListMenu]    Script Date: 12/14/2021 9:29:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListMenu_DGV]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListMenu_DGV]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListPayMent]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListPayMent]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListProfileStaff]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListProfileStaff]

	as
	begin try
		begin tran
			
			select * from Staff
			where IsDelete = 0
			order by IdStaff

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_ListProfileStaff_DGV]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListProfileStaff_DGV]
	as
	begin try
		begin tran
				select IdStaff as 'Mã số', NameStaff as 'Họ tên', Gender as 'Giới tính', PhoneNumber as 'Số điện thoại', Email, Role as 'Vai trò' from Staff
				where IsDelete = 0
				order by IdStaff
        
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_ListStatistic]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListStatistic]
	as
	begin try
		begin tran
			
			select * from Statistic
			order by CheckOut desc
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_ListStatistic_MonthYear]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListStatistic_MonthYear]
				@Month int,
				@Year int
	as
	begin try
		begin tran
			
			select * from Statistic
			where Month(CheckOut) = @Month  and  Year(CheckOut) = @Year 
			order by CheckOut desc
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_ListStatistic_Year]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListStatistic_Year]
				@Year int
	as
	begin try
		begin tran
			
			select * from Statistic
			where Year(CheckOut) = @Year
			order by CheckOut desc
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_ListTable]    Script Date: 12/14/2021 9:29:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListVoucher]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListVoucher]

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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListVoucher_DGV]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListVoucher_DGV]

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
GO
/****** Object:  StoredProcedure [dbo].[sp_Log]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Log]
			@Object nvarchar(20)
	as
	begin try
		begin tran
			
			select * from Log
			where Object = @Object
			order by DateStart desc

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_Logs]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create proc [dbo].[sp_Logs]
			@Object1 nvarchar(20),
			@Object2 nvarchar(20)
	as
	begin try
		begin tran
			
			select * from Log
			where Object = @Object1 or Object = @Object2
			order by DateStart desc

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_Merge]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Merge]
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
/****** Object:  StoredProcedure [dbo].[sp_MergeBill]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_MergeBill]
				@IdTable int,
				@IdDetailBill int,
				@Amount int,
				@AmountNew int,
				@TotalPrice float
	as
	begin try
		begin tran
			DECLARE @IdBill int
			set @IdBill = (select IdBill from Bill where IdTable = @IdTable)

			DECLARE @IdDetailBillNew int
			set @IdDetailBillNew = (select TOP(1) IdDetailBill from DetailBill where IdBill = @IdBill order by IdDetailBill desc)

			Update DetailBill
			set Amount = @Amount + @AmountNew, TotalPrice = @TotalPrice
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
GO
/****** Object:  StoredProcedure [dbo].[sp_MergeBillMenu]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_MergeBillMenu]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectIdStaff]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SelectIdStaff]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectIdStaff_DGV]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SelectIdStaff_DGV]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectIdVoucher]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SelectIdVoucher]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_Statistic]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Statistic]
				@IdStatistic int

	as
	begin try
		begin tran
			
			select * from Statistic
			where IdStatistic = @IdStatistic

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_Statistic_All]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Statistic_All]
				@Value1 varchar(50),
				@Value2 varchar(50)
	as
	begin try
		begin tran
			
			select * from Statistic
			where CheckOut between @Value1 and @Value2
			order by CheckOut desc

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_Statistic_Shift]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Statistic_Shift]
				@Value1 varchar(50),
				@Value2 varchar(50),
				@Shift nvarchar(10)
	as
	begin try
		begin tran
			
			select * from Statistic
			where CheckOut between @Value1 and @Value2 and Shift = @Shift
			order by CheckOut desc

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_Statistic_Shift_Staff]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Statistic_Shift_Staff]
				@Value1 varchar(50),
				@Value2 varchar(50),
				@Shift nvarchar(10),
				@NameStaff nvarchar(50)
	as
	begin try
		begin tran
			
			select * from Statistic
			where CheckOut between @Value1 and @Value2 and Shift = @Shift and NameStaff = @NameStaff
			order by CheckOut desc

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_Statistic_Staff]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Statistic_Staff]
				@Value1 varchar(50),
				@Value2 varchar(50),
				@NameStaff nvarchar(50)
	as
	begin try
		begin tran
			
			select * from Statistic
			where CheckOut between @Value1 and @Value2 and NameStaff = @NameStaff
			order by CheckOut desc

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_StatisticChoose]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StatisticChoose]
				@Value1 varchar(50),
				@Value2 varchar(50)
	as
	begin try
		begin tran
			
			select CONVERT(nvarchar, CheckOut, 101) as 'Thời gian', Sum(Total) as 'Tổng' from Statistic
			where CheckOut between @Value1 and @Value2
			group by CONVERT(nvarchar, CheckOut, 101)
			order by CONVERT(nvarchar, CheckOut, 101) desc
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_StatisticChoose_Month]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StatisticChoose_Month]
					@Month int
	as
	begin try
		begin tran
			
			select Sum(Total) as 'Tổng' from Statistic
			where Month(CheckOut) = @Month
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_StatisticChoose_MonthStaff]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StatisticChoose_MonthStaff]
				@Value1 varchar(50),
				@Value2 varchar(50),
				@NameStaff nvarchar(50)
	as
	begin try
		begin tran
			
			select CONVERT(nvarchar, CheckOut, 101), Sum(Total) as 'Tổng' from Statistic
			where CheckOut between @Value1 and @Value2 and NameStaff = @NameStaff
			group by CONVERT(nvarchar, CheckOut, 101)
			order by CONVERT(nvarchar, CheckOut, 101) desc
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_StatisticChoose_MonthYear]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StatisticChoose_MonthYear]
					@Month int,
					@Year int
	as
	begin try
		begin tran
			
			select Sum(Total) as 'Tổng' from Statistic
			where Month(CheckOut) = @Month  and  Year(CheckOut) = @Year 
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_StatisticChoose_YearStaff]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_StatisticChoose_YearStaff]
					@Month int,
					@Year int,
					@NameStaff nvarchar(50)
	as
	begin try
		begin tran
			
			select Sum(Total) as 'Tổng' from Statistic
			where Month(CheckOut) = @Month  and  Year(CheckOut) = @Year and NameStaff = @NameStaff
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_Switch]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Switch]
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
/****** Object:  StoredProcedure [dbo].[sp_Table]    Script Date: 12/14/2021 9:29:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TagItem]    Script Date: 12/14/2021 9:29:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TopDay]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TopDay]
				@Value1 varchar(50),
				@Value2 varchar(50)
	as
	begin try
		begin tran
			
			select top(3) Count(NameMenu), NameMenu from Statistic
			join DetailStatistic on Statistic.IdStatistic = DetailStatistic.IdStatistic
			where CheckOut between @Value1 and @Value2
			group by NameMenu
			order by Count(NameMenu) desc
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_TopMonth]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TopMonth]
				@Year int,
				@Month int
	as
	begin try
		begin tran
			
			select top(3) Count(NameMenu), NameMenu from Statistic
			join DetailStatistic on Statistic.IdStatistic = DetailStatistic.IdStatistic
			where Year(CheckOut) = @Year and Month(CheckOut) =  @Month
			group by NameMenu
			order by Count(NameMenu) desc
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_TopYear]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TopYear]
					@Year int
	as
	begin try
		begin tran
			
			select top(3) Count(NameMenu), NameMenu from Statistic
			join DetailStatistic on Statistic.IdStatistic = DetailStatistic.IdStatistic
			where Year(CheckOut) = @Year 
			group by NameMenu
			order by Count(NameMenu) desc
			
			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMaterial]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdateMaterial]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMenu]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdateMenu]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatePassword]    Script Date: 12/14/2021 9:29:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateProfileStaff]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdateProfileStaff]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateVoucher]    Script Date: 12/14/2021 9:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdateVoucher]
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
GO
USE [master]
GO
ALTER DATABASE [QuanLyCafe] SET  READ_WRITE 
GO
