USE [master]
GO
/****** Object:  Database [QuanLyCafe]    Script Date: 11/15/2021 7:22:58 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDBill]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDDetailBill]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDDetailStatistic]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDMenu]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDStaff]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDStatistic]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDTable]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  Table [dbo].[DetailBill]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  Table [dbo].[DetailStatistic]    Script Date: 11/15/2021 7:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailStatistic](
	[IdDetailStatistic] [int] NOT NULL,
	[IdStatistic] [int] NULL,
	[NameMenu] [nvarchar](100) NULL,
	[Amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetailStatistic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  Table [dbo].[Material]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  Table [dbo].[Statistic]    Script Date: 11/15/2021 7:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistic](
	[IdStatistic] [int] NOT NULL,
	[IdBill] [int] NULL,
	[Total] [float] NULL,
	[Shift] [nvarchar](10) NULL,
	[NameStaff] [nvarchar](50) NULL,
	[CheckIn] [datetime] NULL,
	[CheckOut] [datetime] NULL,
	[PercentVoucher] [float] NULL,
	[Method] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdStatistic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableCf]    Script Date: 11/15/2021 7:22:59 PM ******/
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
/****** Object:  Table [dbo].[Voucher]    Script Date: 11/15/2021 7:22:59 PM ******/
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
INSERT [dbo].[Bill] ([IdBill], [IdTable], [CheckIn], [IdVoucher], [IdPayment], [IdStaff]) VALUES (1, 19, CAST(N'2021-11-15T18:53:34.000' AS DateTime), N'#NULL', N'#NULL', N'NV002')
GO
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'CF', N'Cafe')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'CK', N'Cake')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'FD', N'Food')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'FZ', N'Freeze')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'OR', N'Orther')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'SD', N'Soft Drink')
INSERT [dbo].[Category] ([IDCategory], [NameCategory]) VALUES (N'TE', N'Tea')
GO
INSERT [dbo].[DetailBill] ([IdDetailBill], [IdBill], [IdMenu], [Amount], [Note]) VALUES (1, 1, 18, 1, N'')
INSERT [dbo].[DetailBill] ([IdDetailBill], [IdBill], [IdMenu], [Amount], [Note]) VALUES (2, 1, 16, 1, N'')
INSERT [dbo].[DetailBill] ([IdDetailBill], [IdBill], [IdMenu], [Amount], [Note]) VALUES (3, 1, 13, 1, N'')
GO
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount]) VALUES (1, 1, N'Cappucino', 1)
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount]) VALUES (2, 1, N'Phin Sữa (Nóng)', 1)
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount]) VALUES (3, 1, N'Phindi Hồng Trà', 2)
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount]) VALUES (4, 2, N'Espresso', 1)
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount]) VALUES (5, 2, N'Phindi Choco', 2)
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount]) VALUES (6, 3, N'Phin Đen (Nóng) s', 2)
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount]) VALUES (7, 4, N'Phin Đen (Nóng) s', 1)
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount]) VALUES (8, 4, N'Phin Đen (Nóng)', 1)
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount]) VALUES (9, 5, N'Phindi Choco', 2)
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount]) VALUES (10, 5, N'Espresso', 2)
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount]) VALUES (11, 5, N'Americano', 2)
INSERT [dbo].[DetailStatistic] ([IdDetailStatistic], [IdStatistic], [NameMenu], [Amount]) VALUES (12, 5, N'Phindi Choco', 1)
GO
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
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [IsDelete]) VALUES (N'NV001', N'Trác Phương Kiệt', N'da', N'0769499550', N'phuongkiet850@gmail.com', N'Nam', CAST(N'2001-01-29' AS Date), N'Thu ngân', N'33354741122871651676713774147412831195', N'\Image\NhanVien\241982101_564828874726069_2353499063666868269_n.jpg', 1)
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [IsDelete]) VALUES (N'NV002', N'admin', N'd', N'0769499550', N'admin', N'None', CAST(N'2001-01-09' AS Date), N'Quản lý', N'33354741122871651676713774147412831195', N'\Image\Icon\unknown1.PNG', 0)
INSERT [dbo].[Staff] ([IdStaff], [NameStaff], [Address], [PhoneNumber], [Email], [Gender], [BirthDay], [Role], [Password], [Picture], [IsDelete]) VALUES (N'NV003', N'dasd', N'asdasd', N'0124587555', N'phuongkiet850d@gmail.com', N'Nam', CAST(N'2021-11-15' AS Date), N'Phục vụ', N'', N'\Image\NhanVien\241745361_564829181392705_7659333528664838532_n.jpg', 0)
GO
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [PercentVoucher], [Method]) VALUES (1, 3, 190300, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-11-05T21:40:11.000' AS DateTime), CAST(N'2021-06-11T04:26:47.000' AS DateTime), 0, N'Tại chỗ')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [PercentVoucher], [Method]) VALUES (2, 1, 120780, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-03-11T00:00:00.000' AS DateTime), CAST(N'2021-06-11T04:31:27.000' AS DateTime), 10, N'Tại chỗ')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [PercentVoucher], [Method]) VALUES (3, 7, 63800, N'Ca tối', N'admin', CAST(N'2021-06-11T04:34:39.000' AS DateTime), CAST(N'2021-06-11T04:34:49.000' AS DateTime), 0, N'Tại chỗ')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [PercentVoucher], [Method]) VALUES (4, 2, 57420, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-06-11T05:14:22.000' AS DateTime), CAST(N'2021-06-11T05:21:10.000' AS DateTime), 10, N'Tại chỗ')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [PercentVoucher], [Method]) VALUES (5, 42, 322300, N'Ca tối', N'Trác Phương Kiệt', CAST(N'2021-09-11T20:38:35.000' AS DateTime), CAST(N'2021-09-11T21:58:44.000' AS DateTime), 0, N'Tiền mặt')
INSERT [dbo].[Statistic] ([IdStatistic], [IdBill], [Total], [Shift], [NameStaff], [CheckIn], [CheckOut], [PercentVoucher], [Method]) VALUES (6, 2, 419100, N'Ca tối', N'admin', CAST(N'2021-12-11T18:07:19.000' AS DateTime), CAST(N'2021-12-11T18:08:25.000' AS DateTime), 0, N'Tiền mặt')
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
INSERT [dbo].[TableCf] ([IdTable], [NameTable], [Status]) VALUES (19, N'Bàn 19', N'Có người')
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
/****** Object:  StoredProcedure [dbo].[sp_AcceptLogin]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddBill]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddDesertToBill]    Script Date: 11/15/2021 7:23:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_AddDesertToBill]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_AddDetailStatistic]    Script Date: 11/15/2021 7:23:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_AddDetailStatistic]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_AddMenu]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddStatistic]    Script Date: 11/15/2021 7:23:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_AddStatistic]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_BillTable_DGV]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Delete]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteBill]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteMaterial]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteMenu]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteProfileStaff]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteVoucher]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Detach]    Script Date: 11/15/2021 7:23:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Detach]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DetailBill]    Script Date: 11/15/2021 7:23:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DetailBill]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DetailBill_DGV]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_FindMaterial]    Script Date: 11/15/2021 7:23:12 PM ******/
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
			where IdMaterial like '%' + @Find + '%' or NameMaterial like '%' + @Find + '%' 

			print N'Thao tác thành công'
		commit tran
	end try

	begin catch
		rollback tran
		print N'Thao tác không thành công'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[sp_FindMenu_All]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_FindMenu_Category]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_FindProfileStaff_All]    Script Date: 11/15/2021 7:23:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FindProfileStaff_All]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_FindProfileStaff_FindBy]    Script Date: 11/15/2021 7:23:12 PM ******/
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
GO
/****** Object:  StoredProcedure [dbo].[sp_FindVoucher]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ForgotPassword]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsertMaterial]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsertProfileStaff]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsertVoucher]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListCategory]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListMaterial]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListMaterial_DGV]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListMaterial_Id]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListMenu]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListMenu_DGV]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListPayMent]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListProfileStaff]    Script Date: 11/15/2021 7:23:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListProfileStaff]

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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListProfileStaff_DGV]    Script Date: 11/15/2021 7:23:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListProfileStaff_DGV]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListTable]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListVoucher]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListVoucher_DGV]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Merge]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_MergeBill]    Script Date: 11/15/2021 7:23:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create proc [dbo].[sp_MergeBill]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_MergeBillMenu]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SelectIdStaff]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SelectIdStaff_DGV]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SelectIdVoucher]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SumTotalBill]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Switch]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Table]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TagItem]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateMaterial]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateMenu]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdatePassword]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateProfileStaff]    Script Date: 11/15/2021 7:23:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateVoucher]    Script Date: 11/15/2021 7:23:12 PM ******/
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
